class Public::BookmarksController < ApplicationController
  def index
  end

  def create
    @item = Item.find(params[:item_id])
    @bookmark = current_customer.bookmarks.new(item_id: item.id)
    @bookmark.save
    respond_to :js
  end

  def destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:customer_id, :item_id)
  end

end
