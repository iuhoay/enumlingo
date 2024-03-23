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

  test "it return options of product kind" do
    I18n.locale = "en"
    assert_equal [["Book", "book"], ["Food", "food"], ["Medical", "medical"], ["Other", "other"]], Product.kinds_lingo
  end

  test "it return options of product kind in Chinese" do
    I18n.locale = "zh-CN"
    assert_equal [["书籍", "book"], ["食品", "food"], ["药品", "medical"], ["Translation missing: zh-CN.activerecord.attributes.product.kinds.other", "other"]], Product.kinds_lingo
  end

  test "it return text of product kind" do
    assert_equal "Book", Product.kind_lingo(:book)
  end

  test "it return text of product kind in Chinese" do
    I18n.locale = "zh-CN"
    assert_equal "书籍", Product.kind_lingo(:book)
  end
end
