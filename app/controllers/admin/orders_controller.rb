class Admin::OrdersController < ApplicationController
  
  def index
    @orders = Order.all
    #@order = Orders.page(params[:page]).per(10)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.ordered_items
    @customer = @order.customer
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_orders_path
  end
  
 private
 
  def order_params
    params.require(:order).permit(:postage, :billing, :payment, :name, :zip_code, :address, :status)
  end

end
