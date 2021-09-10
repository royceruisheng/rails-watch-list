class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all # able to select movie from list of movies
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to @bookmark.list
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to @list
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
