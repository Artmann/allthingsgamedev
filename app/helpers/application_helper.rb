module ApplicationHelper
    def markdown(text)
        return '' if text.nil?

        renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
        doc = Nokogiri::HTML::DocumentFragment.parse(renderer.render(text))
        doc.css('code[@class]').each do |code|
            div = CodeRay.scan(code.text.rstrip, code[:class].to_sym).div
            code = code.replace(div)
            code.first.parent.swap(code.first)
        end
        return doc.to_s
    end

end
