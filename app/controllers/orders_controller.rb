class OrdersController < ApplicationController
  def index
    create unless params[:stripeToken].nil?
    @orders = current_restaurant.orders
  end

  def show
  end

  def create
    order = current_restaurant.orders.create(vat: 20, delivery_option: DeliveryOption.first)
    current_restaurant.basket_items.each do |basket_item|
      order.line_items.build(item_id: basket_item.item_id, quantity: basket_item.quantity)
    end
    order.save

    current_restaurant.basket_items.destroy_all

    redirect_to restaurant_root_path, notice: "Payment successful, thanks for your order."
  end
end