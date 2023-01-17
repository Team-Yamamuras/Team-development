class Admin::CategoriesController < ApplicationController
  
  def index
  end

  def create
  end

  def edit
  end

  def update
  end
  
  def genre_parms
    params.require(:genre).permit(:name)
  end
  
end
