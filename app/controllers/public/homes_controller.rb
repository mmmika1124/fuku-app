class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc)
    @q = Genre.ransack(params[:q])
    @results = @q.result
  end

  def about
  end
end
