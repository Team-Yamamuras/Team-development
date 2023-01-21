class Order < ApplicationRecord

  belongs_to :customer
  has_many :ordered_items, dependent: :destroy
  
  enum payment: {credit_card:0, transfer:1}
  enum status: {waiting:0, confirmation:1, making:2, ready:3, sent:4}
end
