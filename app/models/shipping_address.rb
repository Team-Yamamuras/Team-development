class ShippingAddress < ApplicationRecord
  belongs_to :customer
  
  validates :name, :address, :zip_code, presence: true
	validates :zip_code, numericality: { only_integer: true }
end
