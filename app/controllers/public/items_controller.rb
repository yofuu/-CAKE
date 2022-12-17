class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def items_params
    params.require(:item).permit(:image, :name, :introduction, :gener_id, :price, :is_active)
  end
end
