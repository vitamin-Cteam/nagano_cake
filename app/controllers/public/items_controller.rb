class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_on_sale: true).page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end
end
