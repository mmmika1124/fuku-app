class Public::ReviewsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @review = Review.new
  end

  def create
    @item = Item.find(params[:item_id])
    @review = current_customer.reviews.new(review_params)
    @review.item_id = @item.id
    if @review.save
      redirect_to item_reviews_thanks_path
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:customer_id, :item_id, :age, :height, :figure, :score, :comment)
  end

end
