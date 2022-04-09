class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @customer = current_customer
    @reviews = @item.reviews
    @cart_item = CartItem.new
    @bookmark = Bookmark.new
  end

  def result
    @search = Item.ransack(params[:q])
    @results = @search.result
    @genres = Genre.all
  end

end
