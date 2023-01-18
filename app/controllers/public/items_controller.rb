class Public::ItemsController < ApplicationController
  def index
      @categories = Category.where(is_enabled: true)
    if params[category_id]
      @category = Category.find(params[:category_id])
      @items = @category.items.order(created_at: :desc).where(is_active: true).page(params[:page]).per(8)
    else
      @items = Item.where(is_active: true).page(params[:page]).per(12)
    end
  end

  def show
    @cart_item = CartItem.new
    @categories = Category.all
    @item = Item.find(params[:id])
  end
end
