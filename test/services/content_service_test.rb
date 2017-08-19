require 'test_helper'


class ContentServiceTest < ActiveSupport::TestCase
  test 'list_articles lists articles' do
    client = Contentful::Client.new(space: 'xxx', access_token: 'xxx')
    client
      .expects(:entries)
      .with(content_type: :article)
      .returns([{ slug: 'a' }, {  slug: 'b' }])

    articles = ContentService.new(client).list_articles
    assert_equal [{ slug: 'a' }, {  slug: 'b' }], articles, 'Returns a list of articles'
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