class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc)
    @search = Item.ransack(params[:q])
    @results = @search.result
  end

  def about
  end
end
