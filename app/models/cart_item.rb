class CartItem < ApplicationRecord
  belongs_to :cart  # ← already there
  belongs_to :product  # ← already there (Rails may have added these)
end