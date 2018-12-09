  class ContentService
  def initialize(client = nil)
    @client = client || Contentful::Client.new(
      access_token: ENV['CONTENTFUL_TOKEN'] || '', 
      space: ENV['CONTENTFUL_SPACE'] || ''
    ) 
  end

  # Returns a list of published articles
  def list_articles
    @client.entries(content_type: :article)
     .to_a
     .map { |a| make_article a }
  end

  # Returns an article with the given slug
  def find_article(slug)
    make_article @client.entries(content_type: :article, 'fields.slug': slug).first
  end

  private
  def make_article(a)
    Article.new a.title, a.slug, a.content, a.created_at, a.excerpt, (a.feature_image ? a.feature_image.url : nil)
  end
end