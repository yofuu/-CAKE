class Public::CartItemsController < ApplicationController
  def index
     @cart_items = current_customer.cart_items
     @total = 0
  end

   def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
    #   1. 追加した商品がカート内に存在するかの判別
    # 存在した場合
      if item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
    #   2. カート内の個数をフォームから送られた個数分追加する
         item.update(amount: item.amount + @cart_item.amount)
      else
    # 存在しなかった場合
         @cart_item.save
    #   カートモデルにレコードを新規作成する
      end
      redirect_to cart_items_path
   end

   def update
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(cart_item_params)
    redirect_to cart_items_path, notice:"Item was successfully updated."
    else
    render:index
    end
   end

   def destroy
     cart_item = CartItem.find(params[:id])
     cart_item.destroy
     redirect_to cart_items_path
   end

   def destroy_all
     current_customer.cart_items.destroy_all
     redirect_to cart_items_path
   end

    private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
