class Public::OrdersController < ApplicationController
  def index
   @orders = current_customer.orders
   @order = Order.find(params[:id])
  end

  def new
      @addresses = current_customer.addresses
      @order = Order.new
  end

  def confirm
      @order = Order.new(order_params)
      @cart_items = current_customer.cart_items
      @total = 0
      if params[:address]=="0"
          @order.shipping_addrress=current_customer.address
          @order.shipping_postal_code=current_customer.postal_code
          @order.shipping_name=current_customer.last_name + current_customer.first_name
      elsif params[:address]=="1"
      elsif params[:address]=="2"
          @order.shipping_addrress=params[:shipping_addrress]
          @order.shipping_postal_code=params[:shipping_postal_code]
          @order.shipping_name=params[:shipping_name]
      end
  end
  
  def complete
  end

  private
  def order_params
      params.require(:order).permit(:shipping_addrress, :shipping_postal_code, :shipping_name, :postage, :billing_amount, :payment_method, :order_status)
  end
end
