class SearchesController < ApplicationController
  def genre_search
    @genres = Genre.all
    @genre_id = params[:genre_id]
    @items = Item.where(genre_id: @genre_id)
    @Genres = Genre.page(params[:page]).per(8)
  end
end