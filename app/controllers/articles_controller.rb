class ArticlesController < ApplicationController

    def index
        @articles = ContentService.new.list_articles
        @featured_article = @articles.shift
    end

    def show
        # The id is really the slug
        slug = params[:id]
        @article = ContentService.new.find_article(slug)
        @title = @article.title
    end
end
