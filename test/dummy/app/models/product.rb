class Product < ApplicationRecord
  extend Enumlingo

  enum kind: [:book, :food, :medical, :other]

  enumlingo :kind
end
