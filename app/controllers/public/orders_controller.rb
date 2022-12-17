class Public::OrdersController < ApplicationController
  def index
   @orders = current_customer.orders
  end

  def new
      @addresses = current_customer.addresses
      @order = Order.new
  end
  
  def show
    @order.postage = 500
    
  end

  def confirm
      @order = Order.new(order_params)
      @cart_items = current_customer.cart_items
      @total = 0
      @order.postage = 500
      @order.billing_amount = @order.postage + @total
      if params[:order][:address]=="0"
          @order.shipping_addrress=current_customer.address
          @order.shipping_postal_code=current_customer.postal_code
          @order.shipping_name=current_customer.last_name + current_customer.first_name
      elsif params[:order][:address]=="1"
      elsif params[:order][:address]=="2"
          @order.shipping_addrress=params[:shipping_addrress]
          @order.shipping_postal_code=params[:shipping_postal_code]
          @order.shipping_name=params[:shipping_name]
      end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_complete_path
  end

  private
  def order_params
      params.require(:order).permit(:shipping_addrress, :shipping_postal_code, :shipping_name, :postage, :billing_amount, :payment_method, :order_status)
  end
end
