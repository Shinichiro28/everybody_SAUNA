class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを登録しました"
      redirect_to admin_genres_path
    end
  end

  def update
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      redirect_to admin_genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
