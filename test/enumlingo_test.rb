require "test_helper"

class EnumlingoTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert Enumlingo::VERSION
  end

  test "it return English product kind of book" do
    I18n.locale = "en"
    book = products(:book)

    assert_equal "Book", book.kind_lingo
  end

  test "it return Chinese product kind of book" do
    I18n.locale = "zh-CN"
    book = products(:book)

    assert_equal "书籍", book.kind_lingo
  end

  test "it return missing translation of product kind of book" do
    I18n.locale = "zh-CN"
    book = products(:other)
    assert_equal "Translation missing: zh-CN.activerecord.attributes.product.kinds.other", book.kind_lingo
  end
end
