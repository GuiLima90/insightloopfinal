class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def dashboard
  end

  def home
  end

  def product_insights
    @conversations = Conversation
      .order(occurred_on: :desc)
      render "pages/product_insights_index"
  end

  def product_insight
    @conversation = Conversation.find(params[:id])
     render "pages/product_insight_show"
  end

end
