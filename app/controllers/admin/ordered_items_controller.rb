class Admin::OrderedItemsController < ApplicationController

  def update
    @ordered_item = OrderedItem.find(params[:id])
    @ordered_item.update(order_params)
    redirect_to admin_order_path(@ordered_item.order_id)
  end

private

  def order_params
    params.require(:ordered_item).permit(:status)
  end

end
