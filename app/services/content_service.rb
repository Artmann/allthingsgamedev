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

  # Returns a list of published talks
  def list_talks
    @client.entries(content_type: :talk)
     .to_a
     .map { |t| make_talk t }
  end

  # Returns an article with the given slug
  def find_article(slug)
    make_article @client.entries(content_type: :article, 'fields.slug': slug).first
  end

  # Returns an talk with the given slug
  def find_talk(slug)
    make_talk @client.entries(content_type: :talk, 'fields.slug': slug).first
  end


  private
  def make_article(a)
    Article.new a.title, a.slug, a.content, a.created_at, a.excerpt, (a.feature_image ? a.feature_image.url : nil)
  end

  def make_talk(t)
    content = t.fields[:content] || ""
    Talk.new t.title, t.slug, t.video_embed, content, t.created_at
  end
end
