require "test_helper"

class EnumlingoTest < ActiveSupport::TestCase
  setup do
    @book = products(:book)
    @other = products(:other)
  end

  test "it has a version number" do
    assert Enumlingo::VERSION
  end

  test "it return English product kind of book" do
    assert_equal "Book", @book.kind_lingo(locale: :en)
  end

  test "it return Chinese product kind of book" do
    assert_equal "书籍", @book.kind_lingo(locale: "zh-CN")
  end

  test "it return missing translation of product kind of book" do
    assert_equal "Translation missing: zh-CN.activerecord.attributes.product.kinds.other", @other.kind_lingo(locale: "zh-CN")
  end

  test "it return options of product kind" do
    assert_equal [["Book", "book"], ["Food", "food"], ["Medical", "medical"], ["Other", "other"]], Product.kinds_lingo(locale: :en)
  end

  test "it return options of product kind in Chinese" do
    assert_equal [["书籍", "book"], ["食品", "food"], ["药品", "medical"], ["Translation missing: zh-CN.activerecord.attributes.product.kinds.other", "other"]], Product.kinds_lingo(locale: "zh-CN")
  end

  test "it return text of product kind" do
    assert_equal "Book", Product.kind_lingo(:book, locale: :en)
  end

  test "it return text of product kind in Chinese" do
    assert_equal "书籍", Product.kind_lingo(:book, locale: "zh-CN")
  end

  test "return options of product kind value with custom translation" do
    assert_equal [["Book", 0], ["Food", 1], ["Medical", 2], ["Other", 3]], Product.kinds_lingo_values(locale: :en)
  end
end
