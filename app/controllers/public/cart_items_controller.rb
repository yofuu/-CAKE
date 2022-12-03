class Public::CartItemsController < ApplicationController
  def index
     @cart_items = Cart_Item.all
  end
  
   def create
      binding.pry
   end
    
    private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
