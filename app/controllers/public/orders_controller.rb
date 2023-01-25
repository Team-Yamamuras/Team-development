class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @shipping_addresses = current_customer.shipping_address
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.postage = 800
    @total_fee = 0
    @order.payment = params[:order][:payment]

    if params[:order][:address_number] == "0" # ご自身の住所 選択時
      @order.zip_code = current_customer.zip_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_number] == "1" # 登録済住所から選択 選択時
      @address = Address.find(params[:order][:address_id])
      @order.zip_code = @address.zip_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_number] == "2" # 新しいお届け先 選択時
       # @address = current_customer.addresses.new(address_params)
       # @address.customer_id = current_customer.id
       # @address.save
       @order.zip_code = params[:order][:zip_code]
       @order.address = params[:order][:address]
       @order.name = params[:order][:name]
    else
      render :new
    end
      @order.billing = @total_fee
  end


  def complete
  end

  def create
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id
    @order.postage = 800
    @order.save
#カート内商品を注文商品に移動させる
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @ordered_item = OrderedItem.new
      @ordered_item.order_id = @order.id
      @ordered_item.item_id = cart_item.item_id
      @ordered_item.count = cart_item.count
      @ordered_item.price_tax_included = cart_item.item.price_without_tax*1.1
      @ordered_item.save
    end
    @cart_items.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @orders = current_customer.orders.order(created_at: :DESC).page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.ordered_items
    @shopping_cost = 800
  end

  private
  def order_params
    params.require(:order).permit(:postage, :billing, :payment, :name, :zip_code, :address, :status)
  end

  def address_params
    params.require(:address).permit(:zip_code, :address, :name)
  end


end
