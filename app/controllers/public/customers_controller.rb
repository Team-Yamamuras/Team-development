class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
       redirect_to customers_path
    else
       render :edit and return
    end
  end

  def out
  end

  def quit
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code, :address, :phone_number)
  end
  
end
