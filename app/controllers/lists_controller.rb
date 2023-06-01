class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

    def destroy
      @list = List.find(params[:id])
      @list.destroy
      # No need for app/views/restaurants/destroy.html.erb
      redirect_to lists_path, status: :see_other
    end


  private

  def list_params
    params.require(:list).permit(:name, :address, :rating)
  end
end
