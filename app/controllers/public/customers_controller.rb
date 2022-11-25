class Public::CustomersController < ApplicationController
  def show
   @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  private
  def customers_params
    params.require(:customer).permit(:name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end
