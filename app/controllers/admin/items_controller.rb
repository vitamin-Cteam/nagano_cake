class Admin::ItemsController < ApplicationController
  def index
    @items = Item.page.all
  end

  def new
    @item = Item.new
  end

  def creat
    @item = item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  def post_image_params
        params.require(:item).permit(:item_image, :name, :description, :genre_id, :price, :is_on_sale)
  end
end
