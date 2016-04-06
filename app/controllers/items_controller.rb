class ItemsController < ApplicationController
  before_filter :authenticate_farm!, only: [:create, :update]

  def index
    sort_column =
      params[:sort_option].nil? ? :price : params[:sort_option].strip.downcase

    if params[:category_id].nil?

      @items = Item.order({ sort_column.to_sym => "DESC" }).
        paginate(page: params[:page], per_page: 9).
        includes(:images)
    else
      @items = Category.find(params[:category_id]).
        items.order({ sort_column.to_sym => "DESC" }).
        paginate(page: params[:page], per_page: 9).
        includes(:images)
    end

  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def create
    @item = Item.create(item_params)

    if @item.valid?
      render json: @item
    else
      render json: {error: "Could not save the item."}
    end
  end

  def destroy
    # needed to add this as a workaround for Items that got added without farms
    Item.all.each { |i| i.update(farm: Farm.first) }

    @item = Item.find(params[:id])
    @item.update(archived: true)
    render json: @item
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :price, :farm_id, :category_id, :description,
      images_attributes: [:image, :_destroy])
  end
end
