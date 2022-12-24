class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customers_params)
    redirect_to mypage_path(@customer), notice:"Item was successfully updated."
    else
    render:edit
    end
  end

  private
  def customers_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :encrypted_password, :email, :is_deleted)
  end
end
