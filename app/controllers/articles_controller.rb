class ArticlesController < ApplicationController

    def index
        @articles = ContentService.instance.list_articles.sort { |a, b| b.created_at <=> a.created_at }
        @featured_article = @articles.shift
    end

    def show
        # The id is really the slug
        slug = params[:id]
        @article = ContentService.instance.find_article(slug)
        @title = @article.title

        renderer = Redcarpet::Markdown.new(CustomRender, fenced_code_blocks: true)

        doc = Nokogiri::HTML::DocumentFragment.parse(renderer.render(@article.content))

        @articleContent = doc.to_s
    end
end
