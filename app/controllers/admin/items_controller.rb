class Admin::ItemsController < ApplicationController

  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def index
    @items = Item.page(params[:page]).per(10)
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      flash[:item_created_error] = "商品情報が保存されませんでした"
      redirect_to new_admin_item_path
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to admin_items_path(@item)
    else
       flash[:item_updated_error] = "商品情報が保存されませんでした"
       redirect_to admin_items_edit_path(@item)
    end
  end

  private
  def item_params
    params.require(:item).permit(:id,:category_id,:image,:name,:introduction,:price_without_tax,:is_active)
  end
end