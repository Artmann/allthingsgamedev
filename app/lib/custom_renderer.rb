class CustomRender < Redcarpet::Render::HTML
  def image(link, title, alt_text)
      %(<img alt="#{alt_text}" class="lazy" data-src="#{link}" title="#{title}" src="iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==" />)
  end
end
