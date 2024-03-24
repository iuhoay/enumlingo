# Enumlingo

[![Gem Version](https://badge.fury.io/rb/enumlingo.svg)](https://badge.fury.io/rb/enumlingo)

Enumlingo is a simple gem that helps you translate enum values in your Rails app.

## Usage

`extend Enumlingo` in your model and call enumlingo with the enums you want to translate.

```ruby
class Product < ApplicationRecord
  extend Enumlingo

  enum status: %i[active inactive]
  enum kind: %i[book food medical other]


  enumlingo :status, :kind
end
```

define the translations in your locale file

```yaml
en:
  activerecord:
    attributes:
      product:
        statuses:
          active: "Active"
          inactive: "Inactive"
        kinds:
          book: "Book"
          food: "Food"
          medical: "Medical"
          other: "Other"

"zh-CN":
  activerecord:
    attributes:
      product:
      statuses:
        active: "激活"
        inactive: "未激活"
      kinds:
        book: "书籍"
        food: "食品"
        medical: "医疗"
        other: "其他"
```

### Value translation

```ruby
product = Product.new(status: :active, kind: :book)
product.status_lingo # => "Active"
product.kind_lingo # => "Book"

I18n.locale = "zh-CN"
product.status_lingo # => "激活"
product.kind_lingo # => "书籍"
```

### Options translation

```ruby
Product.statuses_lingo # => [["Active", "active"], ["Inactive", "inactive"]]
Product.kinds_lingo # => [["Book", "book"], ["Food", "food"], ["Medical", "medical"], ["Other", "other"]]
```

```ruby
Product.status_lingo(:active) # => "Active"
```

### Form translation

```ruby
<%= form_for @product do |f| %>
  <%= f.select :status, Product.statuses_lingo %>
  <%= f.select :kind, Product.kinds_lingo %>

  ...
<% end %>
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "enumlingo"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install enumlingo
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
