class SearchesController < ApplicationController
  def genre_search
    @genres = Genre.all
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id).page(params[:page]).per(6)
  end
end