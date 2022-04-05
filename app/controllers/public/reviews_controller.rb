class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new
  end

  private

  def review_params
    params.require(:review).permit(:customer_id, :item_id, :age, :height, :figure, :score, :comment)
  end

end
