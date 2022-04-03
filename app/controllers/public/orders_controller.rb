class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    @total = @cart_items.inject(0) { |total, cart_item| total + cart_item.subtotal }
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer_id
    @order.save
    redirect_to orders_thanks_path
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :payment_method)
  end

end
