class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def out
  end

  def quit
  end
  
  private
  
end