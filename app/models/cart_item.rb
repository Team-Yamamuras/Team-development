class CartItem < ApplicationRecord
  validates :count, presence: true
  
  belongs_to :customer
  belongs_to :item
  
  def validate_into_cart
      cart_items = self.customer.cart_items
      if (quantity) == nil
         return (false)
      elsif cart_items.any? {|cart_item| cart_item.item_id == (item_id)} == true
         return (false)
      else
        return (true)
      end
  end
end
