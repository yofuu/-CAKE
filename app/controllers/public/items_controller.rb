class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
  
  private
  def items_params
    params.require(:item).permit(:image, :name, :introduction, :gener_id, :price, :is_active)
  end
end
