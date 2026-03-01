class Cart < ApplicationRecord
  belongs_to :user  # ← already there
  has_many :cart_items  # ← ADD HERE
  has_many :products, through: :cart_items  # ← ADD HERE
end