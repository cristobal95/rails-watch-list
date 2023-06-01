class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to lists_path(@list), notice: 'Bookmark was successfully added.'
    else
      render :new
    end


  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment, :list_id)
  end
end
