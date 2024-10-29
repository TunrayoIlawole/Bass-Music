class FavouritesController < ApplicationController

  before_action :authenticate_user!

  def index
    @favourite_albums = current_user.favourite_albums
  end

  def create
    @album = Album.find(params[:album_id])
    current_user.favourite_albums << @album unless current_user.favourite_albums.include?(@album)
    redirect_to album_path(@album), notice: "Album added to favourites"
  end

  def destroy
    @album = Album.find(params[:album_id])
    current_user.favourite_albums.delete(@album)
    redirect_to album_path(@album), notice: "Album removed from favourites"
  end
end
