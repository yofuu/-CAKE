class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(5)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)

    if @item.save
      redirect_to admin_item_path(@item.id), notice:"Item was successfully updated."
    else
      @items = Item.all
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
    redirect_to admin_item_path(@item), notice:"Item was successfully updated."
    else
    render:edit
    end
  end

  private
  def items_params
    params.require(:item).permit(:image, :name, :introduction, :gener_id, :price, :is_active)
  end
end
