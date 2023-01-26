class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @update_cart_item =  CartItem.find_by(item_id: @cart_item.item_id)
    if @update_cart_item.present? && @cart_item.valid?
        @cart_item.count += @update_cart_item.count
        @update_cart_item.destroy
    end

    if @cart_item.save
      redirect_to cart_items_path
    else
      @product = Product.find(params[:cart_item][:item_id])
      @cart_item = CartItem.new
      flash[:alert] = "個数を選択してください"
    end
  end

  def update
   @cart_item = CartItem.find(params[:id])
   @cart_item.update(cart_item_params)
   redirect_to cart_items_path
  end

  def destroy
   cart_item = CartItem.find(params[:id])
   cart_item.destroy
   redirect_to cart_items_path
  end

  def destroy_all
   current_customer.cart_items.destroy_all
   redirect_to cart_items_path
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:customer_id, :item_id, :count)
  end

  def calculate(user)
    total_price = 0
    user.cart_items.each do |cart_item|
      total_price += cart_item.count * cart_item.item.price_without_tax
    end
    return (total_price * 1.1).floor
  end

end
