class Talk
  attr_accessor :content, :created_at, :embed, :slug, :title

  def initialize(title, slug, embed, content, created_at = Time.now)
    self.content = content
    self.created_at = created_at
    self.embed = embed
    self.slug = slug
    self.title = title
  end

  def poster_url
    "https://carepharmaceuticals.com.au/wp-content/uploads/sites/19/2018/02/placeholder-600x400.png"
  end
end