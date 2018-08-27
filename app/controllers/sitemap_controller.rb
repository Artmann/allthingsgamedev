class SitemapController < ApplicationController
  def index
    @articles = ContentService.new.list_articles.sort { |a, b| b.created_at <=> a.created_at }
  end
end