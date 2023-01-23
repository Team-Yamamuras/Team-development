class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    #@shipping_addresses = current_customer.ship_addresses
  end
  
  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.postage = 800
    @total_fee = 0
    @order.payment = params[:order][:payment]
    
    if params[:order][:payment] == "0" # ご自身の住所 選択時
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:payment] == "1" # 登録済住所から選択 選択時
      @address = Address.find(params[:order][:address_id])
      @order.zip_code = @address.zip_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:payment] == "2" # 新しいお届け先 選択時
       # @address = current_customer.addresses.new(address_params)
       # @address.customer_id = current_customer.id
       # @address.save
       @order.zip_code = params[:order][:zip_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
    else
        render 'new'
    end
  end

  
  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_complete_path
  end

  def index
  end

  def show
  end
  
  private
  def address_params
    params.require(:address).permit(:zip_code, :address, :name)
  end
end
