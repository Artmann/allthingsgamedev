class SitemapController < ApplicationController
  def index
    @articles = ContentService.instance.list_articles.sort { |a, b| b.created_at <=> a.created_at }
    @talks = ContentService.instance.list_talks.sort { |a, b| b.created_at <=> a.created_at }
  end
end
