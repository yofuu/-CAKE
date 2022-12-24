class Public::OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
  end

  def new
    return redirect_to cart_items_path if current_customer.cart_items.blank?

    @addresses = current_customer.addresses
    @order = Order.new
  end

  def show
    @order = Order.find(params[:id])
    @total = 0
      @order.order_details.each do |order_detail|
        @total += order_detail.purchase_price * order_detail.amount
      end
  end

  def confirm
      @order = Order.new(order_params)
      @cart_items = current_customer.cart_items
      @total = 0
      current_customer.cart_items.each do |cart_item|
        @total += cart_item.item.with_tax_price * cart_item.amount
      end
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
    @order.order_status = 0
    @order.save
    current_customer.cart_items.each do |cart_item|
      @order.order_details.create!(
        item_id:cart_item.item_id,
        purchase_price:cart_item.item.with_tax_price,
        amount:cart_item.amount,
        production_status: :nyuukinnmachi
        )
    end
    current_customer.cart_items.destroy_all
    redirect_to orders_complete_path
  end

  private
  def order_params
      params.require(:order).permit(:shipping_addrress, :shipping_postal_code, :shipping_name, :postage, :billing_amount, :payment_method, :order_status)
  end
end
