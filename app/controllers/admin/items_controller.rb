class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      @items = Item.all
      render :index
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end


  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :image)
  end

end
