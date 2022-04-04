class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @total = @cart_items.inject(0) { |total, cart_item| total + cart_item.subtotal }
  end

  def create
    @order = Order.new(order_params)
    @order.customer = current_customer
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      order_detail = @order.order_details.new
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.with_tax_price
      order_detail.save
    end
    @cart_items.destroy_all
    redirect_to orders_thanks_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :payment_method)
  end

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount)
  end

end
