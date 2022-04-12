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
    @results = case params[:q][:type]
               when 'category'
                 @search.result
               when 'age'
                 Item.where(id: Review.where(age: params[:age]).pluck('item_id').uniq)
               when 'style'
                 Item.where(id: Review.where(figure: params[:figure]).pluck('item_id').uniq)
               else
                 Item.all
               end
  end
end
