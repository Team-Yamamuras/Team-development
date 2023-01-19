class CartItem < ApplicationRecord
  validates :quantity, presence: true
  
  belongs_to :customer
  belongs_to :item
end
