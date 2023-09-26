class Admin::GenresController < ApplicationController
  before_action :get_genre_id, only: [:edit, :update]

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "新しいジャンルを作成しました"
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      flash[:notice] = "ジャンル情報を更新しました"
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def get_genre_id
    @genre = Genre.find(params[:id])
  end

end
