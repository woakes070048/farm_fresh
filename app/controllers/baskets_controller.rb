class BasketsController < ApplicationController
  before_filter :authenticate_restaurant!

  def index
    @basket_items = current_restaurant.basket_items.includes(:item)
    @amount = (current_restaurant.basket_total * 1.2 * 100).to_i
  end

  def create
    basket_item = current_restaurant.basket_items.create(basket_item_params)
    render json: basket_item
  end

  def destroy
    basket_item = current_restaurant.basket_items.find(params[:id])
    basket_item.destroy
    render json: basket_item
  end

  def count
    total_ex_vat = current_restaurant.basket_total
    vat = 1.2
    total_inc_vat = total_ex_vat * vat

    render json: {count:       current_restaurant.basket_items.count,
                  totalExVat:  total_ex_vat.round(2),
                  vat:         20,
                  totalIncVat: total_inc_vat.round(2)}
  end

  def basket_item_params
    json_params = ActionController::Parameters.new(JSON.parse(request.body.read))
    json_params.require(:basket_item).permit(:item_id, :quantity)
  end
end
