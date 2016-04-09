class BasketsController < ApplicationController
  before_filter :authenticate_restaurant!

  def index
    @basket_items = current_restaurant.basket_items
  end

  def create
    data = JSON.parse(params[:basket_item])
    basket_item = current_restaurant.basket_items.create(item_id: data["item_id"], quantity: data["quantity"])

    render json: basket_item
  end

  def destroy
    basket_item = BasketItem.find(params[:id])
    basket_item.destroy
    render json: basket_item
  end
end
