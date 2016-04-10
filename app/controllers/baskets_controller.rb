class BasketsController < ApplicationController
  before_filter :authenticate_restaurant!

  def index
    @basket_items = current_restaurant.basket_items
  end

  def create
    basket_item = current_restaurant.basket_items.create(basket_item_params)
    render json: basket_item
  end

  def destroy
    basket_item = BasketItem.find(params[:id])
    basket_item.destroy
    render json: basket_item
  end

  def count
    render json: {count: current_restaurant.basket_items.count}
  end

  def basket_item_params
    json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
    json_params.require(:basket_item).permit(:item_id, :quantity)
  end
end
