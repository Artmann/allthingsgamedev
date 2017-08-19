require 'test_helper'

class ContentfulLogoAttributionTest < ActionDispatch::IntegrationTest
  test "contentful logo is visible" do
    get "/"
    assert_select ".contentful-logo"
  end
end
