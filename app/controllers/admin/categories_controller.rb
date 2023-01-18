class Admin::CategoriesController < ApplicationController
  #管理者ログインの権限
  #before_action :authenticate_admin!

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index and return
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to admin_categories_path
  end

  private
  #ストロングパラメータを設定することでデータを一時保持
  def category_params
    params.require(:category).permit(:category)
  end

end
