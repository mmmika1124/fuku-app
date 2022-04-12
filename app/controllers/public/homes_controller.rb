class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc)
    @genres = Genre.all
    @search = Item.ransack(params[:q])
  end

  def about; end
end
