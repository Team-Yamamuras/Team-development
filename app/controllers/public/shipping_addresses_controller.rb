class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = current_customer.shipping_address
    @shipping_address = ShippingAddress.new
  end

  def edit
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    @shipping_address.save
    redirect_to shipping_addresses_path
  end

  def update
  end

  def destroy
  end

   private
  def shipping_address_params
    params.require(:shipping_address).permit(:zip_code, :address, :name)
  end

end
