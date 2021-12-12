class SitemapController < ApplicationController
  def index
    @articles = ContentService.instance.list_articles.sort { |a, b| b.created_at <=> a.created_at }
  end
end
