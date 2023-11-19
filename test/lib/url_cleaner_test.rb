require "test_helper"

class UrlCleanerTest < ActiveSupport::TestCase
  test "clean method removes fbclid" do
    cleaner = UrlCleaner.new("http://example.com?fbclid=123")
    assert_equal "http://example.com", cleaner.clean
  end

  test "clean method removes utm_* parameters" do
    cleaner = UrlCleaner.new("http://example.com?utm_medium=1&utm_source=2&utm_campaign=3&utm_term=4&utm_content=5")
    assert_equal "http://example.com", cleaner.clean
  end

  test "clean method removes only listed parameters" do
    cleaner = UrlCleaner.new("http://example.com/articles?utm_medium=1&article_id=10")
    assert_equal "http://example.com/articles?article_id=10", cleaner.clean
  end
end
