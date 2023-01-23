class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :name, :address, :zip_code, presence: true
	validates :zip_code, numericality: { only_integer: true }

  def address_display
    '〒' + zip_code + ' ' + address + ' ' + name
  end

end
