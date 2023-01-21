class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    #@shipping_addresses = current_customer.ship_addresses
  end
  
  def confirm
    @order = Order.new
    #@cart_items = current_customer.cart_items
  end
  
  def complete
  end

  def create
    #@order = Order.new(order_params)
    #@order.customer_id = current_customer.id
    #@order.save
  end

  def index
  end

  def show
  end
end
