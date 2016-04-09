class BasketsController < ApplicationController
  before_filter :authenticate_restaurant!

  def index
    @basket_items = current_restaurant.basket_items
  end

  def create
    current_restaurant.basket_items.create(basket_item_params)
  end

  def basket_item_params
    params.require(:basket_item).permit(:item, :quantity)
  end
end
