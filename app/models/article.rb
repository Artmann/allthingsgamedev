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
end