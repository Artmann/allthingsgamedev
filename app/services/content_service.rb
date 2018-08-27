class ContentService
  def initialize(client = nil)
    @client = client || Contentful::Client.new(
      access_token: ENV['CONTENTFUL_TOKEN'] || '', 
      space: ENV['CONTENTFUL_SPACE'] || ''
    ) 
  end

  # Returns a list of published articles
  def list_articles
    @client.entries(content_type: :article).to_a
  end

  # Returns an article with the given slug
  def find_article(slug)
    @client.entries(content_type: :article, 'fields.slug': slug).first
  end
end