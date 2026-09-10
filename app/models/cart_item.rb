class CartItem < ApplicationRecord
  belongs_to :cart, counter_cache: false
  belongs_to :product

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
