class CustomRender < Redcarpet::Render::HTML
    def image(link, title, alt_text)
        %(<img alt="#{alt_text}" class="lazy" data-src="#{link}" title="#{title}" src="iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" />)
    end
end

module ApplicationHelper
    def markdown(text)
        return '' if text.nil?

        renderer = Redcarpet::Markdown.new(CustomRender, fenced_code_blocks: true)
        doc = Nokogiri::HTML::DocumentFragment.parse(renderer.render(text))
        doc.css('code[@class]').each do |code|
            div = CodeRay.scan(code.text.rstrip, code[:class].to_sym).div
            code = code.replace(div)
            code.first.parent.swap(code.first)
        end
        return doc.to_s
    end

end
