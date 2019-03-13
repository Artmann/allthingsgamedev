class Article
  attr_accessor :content, :created_at, :excerpt, :image_url, :slug, :title

  def initialize(title, slug, content, created_at = Time.now, excerpt = '', image_url = nil)
    self.content = content
    self.created_at = created_at
    self.excerpt = excerpt
    self.image_url = image_url
    self.slug = slug
    self.title = title
  end

  def feature_image_url
    if image_url.start_with?("//")
      return "https:#{image_url}"
    end

    return image_url
  end

  def to_json
    {
      content: content,
      created_at: created_at,
      excerpt: excerpt,
      image_url: image_url,
      slug: slug,
      title: title
    }.to_json
  end
end
