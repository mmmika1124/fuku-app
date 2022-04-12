class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def create
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer = current_customer
    found_cart_item = CartItem.find_by(item_id: cart_item_params[:item_id], customer_id: current_customer.id)
    if found_cart_item.present?
      cart_item = CartItem.find_by(item_id: cart_item_params[:item_id], customer_id: current_customer.id)
      cart_item.amount += params[:cart_item][:amount].to_i
    end
    cart_item.save
    redirect_to cart_items_path
  end

  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |total, cart_item| total + cart_item.subtotal }
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.customer = current_customer
    cart_item.update(amount: params[:cart_item][:amount])
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_customer.cart_items
    cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
