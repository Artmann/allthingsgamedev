class TalksController < ApplicationController

  def index
      @talks = ContentService.new.list_talks.sort { |a, b| b.created_at <=> a.created_at }
  end

  def show
      # The id is really the slug
      slug = params[:id]
      @article = ContentService.new.find_article(slug)
      @title = @article.title
  end
end
