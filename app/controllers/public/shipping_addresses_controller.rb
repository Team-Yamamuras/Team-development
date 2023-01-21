class Public::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = current_customer.shipping_address
  	@shipping_address = ShippingAddress.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
