class OrderedItem < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum status: {impossible_manufacture:0, waiting_manufacture:1, manufacturing:2, finish:3}
end
