require 'test_helper'

class ContentServiceTest < ActiveSupport::TestCase
  test 'list_articles lists articles' do
    client = Contentful::Client.new(space: 'xxx', access_token: 'xxx')
    client
      .expects(:entries)
      .with(content_type: :article)
      .returns([
        { slug: 'article-1', title: 'Article 1', content: 'foobar1' },
        { slug: 'article-2', title: 'Article 2', content: 'foobar2' },
        { slug: 'article-3', title: 'Article 3', content: 'foobar3' }
      ])

    articles = ContentService.new(client).list_articles

    # def initialize(title, slug, content, created_at = Time.now, excerpt = '', image_url = nil)
    expectedArticles = [
      Article.new('Article 1', 'article-1', 'foobar1'),
      Article.new('Article 2', 'article-2', 'foobar2'),
      Article.new('Article 3', 'article-3', 'foobar3')
    ]

    assert_equal expectedArticles, articles, 'Returns a list of articles'
  end

  test 'find_article returns an article' do
    client = Contentful::Client.new(space: 'xxx', access_token: 'xxx')
    client
      .expects(:entries)
      .with(content_type: :article, 'fields.slug': 'foo')
      .returns([{ title: 'Foobar', slug: 'foo' }])

    article = ContentService.new(client).find_article('foo')
    assert_equal({ title: 'Foobar', slug: 'foo' }, article, 'Returns the correct article')
  end
  
end