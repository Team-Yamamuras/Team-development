class Admin::OrderedItemsController < ApplicationController
    
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end
end
