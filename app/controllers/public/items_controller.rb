class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @search = Item.ransack(params[:q])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @customer = current_customer
    @reviews = @item.reviews
    @cart_item = CartItem.new
    @bookmark = Bookmark.new
  end

  def result
    @genres = Genre.all
    @search = Item.ransack(genre_id_eq: params[:q][:genre_id])
    if params[:q][:type] == "category"
      @results = @search.result
    elsif params[:q][:type] == "review"
      @results = Item.where(id: Review.where(age: params[:age]).pluck('item_id').uniq)
    else
      @results = Item.all
    end
  end

end
