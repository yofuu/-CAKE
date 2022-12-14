class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @total = 0
      @order.order_details.each do |order_detail|
        @total += order_detail.purchase_price * order_detail.amount
      end
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
    redirect_to admin_order_path(@order.id), notice:"Item was successfully updated."
    else
    render:show
    end
  end

  private
  def order_params
      params.require(:order).permit(:order_status)
  end
end
