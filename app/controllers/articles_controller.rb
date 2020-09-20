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

        ad_ids = [
            'div-gpt-ad-1547765304248-0',
            'div-gpt-ad-1547765393475-0',
            'div-gpt-ad-1547765417792-0'
        ]
        index = 0
        word_count = 0

        doc.css('p').each do |block|
            word_count += (block.text || "").split(" ").size

            if word_count >= 150
                id = ad_ids[index % ad_ids.size]
                index += 1

                block.add_next_sibling "<div id='#{id}'><script>googletag.cmd.push(function() { googletag.display('#{id}'); });</script></div>"

                word_count = 0
            end
        end

        @articleContent = doc.to_s
    end
end
