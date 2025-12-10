class ClassificationsController < ApplicationController

  def index
    @classifications = Classification.all
    @pareto = pareto_classifications
    # inserir aqui tags que foram elegidas pelo pareto -> montar gráfico de tendência
    pareto_tags = @pareto.map(&:tag)
    @trend_series = conversation_trends_for(pareto_tags)
  end

  def show
    @classification = Classification.find(params[:id])

    trend_hash = conversation_trends_for([@classification.tag])
    trend      = trend_hash[@classification.tag] || { labels: [], values: [] }

    @labels = trend[:labels]
    @values = trend[:values]

    # Só queremos mostrar: Dia 1, 5, 10, 15, 20, 25, 30
    days_to_show = [1, 5, 10, 15, 20, 25, 30]

    @volume_points = []

    @labels.each_with_index do |label, idx|
      day_number = idx + 1
      next unless days_to_show.include?(day_number)

      @volume_points << {
        label: label,          # "Dia 1", "Dia 5" e por aí vai....
        count: @values[idx]    # volume de conversas daquele dia
      }
    end
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


  private

  def conversation_trends_for(tags, days: 30)
    return {} if tags.blank?

    start_date = days.days.ago.to_date

    raw_counts = Conversation
      .joins(:classification)
      .where(classifications: { tag: tags })
      .where("conversations.created_at >= ?", start_date)
      .group("classifications.tag", "DATE(conversations.created_at)")
      .order("classifications.tag", "DATE(conversations.created_at)")
      .count

    trends = Hash.new { |h, k| h[k] = Hash.new(0) }

    raw_counts.each do |(tag, date), count|
      trends[tag][date] = count
    end

    trends.transform_values do |per_day_hash|
    all_dates = (start_date..Date.today).to_a

    {
      labels: all_dates.each_with_index.map { |_, idx| "Dia #{idx + 1}" },
      values: all_dates.map { |d| per_day_hash[d] || per_day_hash[d.to_s] || 0 }
    }
end
  end

end
