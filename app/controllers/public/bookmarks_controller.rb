class Public::BookmarksController < ApplicationController
  def bookmark
    @bookmarks = current_customer.bookmarks
    @cart_item = CartItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @bookmark = current_customer.bookmarks.new(item_id: @item.id)
    @bookmark.save
  end

  def destroy
    @bookmark = current_customer.bookmarks.find_by(customer_id: current_customer.id, item_id: params[:item_id])
    @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:customer_id, :item_id)
  end

end
