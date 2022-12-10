class Public::OrdersController < ApplicationController
  def index
   @orders = current_customer.orders
   @order = Order.find(params[:id])
  end

  private
  def order_params
      params.require(:order).permit(:shipping_addrress, :shipping_name, :postage, :billing_amount, :payment_method, :order_status)
  end
end
