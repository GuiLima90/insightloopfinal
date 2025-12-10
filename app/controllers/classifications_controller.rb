class ClassificationsController < ApplicationController

  def index
    @classifications = Classification.all
    @pareto = pareto_classifications
    # Get counts by tag, excluding blank tags (optional)
    counts_hash = Conversation
                    .joins(:classification)
                    .where.not(classifications: { tag: [nil, ""] })
                    .group("classifications.tag")
                    .order(Arel.sql("COUNT(*) DESC"))
                    .count

    # labels (tags) and counts array (already sorted descending by DB)
    @chart_labels = counts_hash.keys
    @chart_counts = counts_hash.values.map(&:to_i)

    # compute cumulative percentage on Ruby side
    total = @chart_counts.sum.nonzero? || 1
    cumulative = []
    running = 0.0
    @chart_counts.each do |c|
      running += c
      cumulative << ((running / total) * 100).round(0)
    end
    @chart_cumulative = cumulative
  end

  def show
    @classification = Classification.find(params[:id])
  end

  private

  def pareto_classifications
    rows = Conversation
      .joins(:classification)
      .select(
        "classifications.tag AS tag,
        COUNT(*) AS count,
        ROUND(
          100 * COUNT(*) / SUM(COUNT(*)) OVER ()
        ) AS pct,
        ROUND(
          100 * SUM(COUNT(*)) OVER (ORDER BY COUNT(*) DESC)
          / SUM(COUNT(*)) OVER ()
        ) AS cum_pct"
      )
      .group("classifications.tag")
      .order("count DESC")

    # Keep only classifications contributing to the first 80% of conversations
    rows.select { |r| r.cum_pct <= 80 }

  end

end
