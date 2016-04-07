class ItemsController < ApplicationController
  before_filter :authenticate_farm!, only: [:farm_index, :show, :create, :destroy, :new, :edit]
  before_filter :authenticate_restaurant!, only: [:index, :show, :product]

  def index
    sort_column =
      params[:sort_option].nil? ? :price : params[:sort_option].strip.downcase
    #TODO: Handle sortby distance after geocoder is setup

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
  end


  def create
    @item = Item.create(item_params)

    if @item.valid?
      redirect_to farm_items_path, notice: "Item created"
    else
      redirect_to farm_items_path, notice: "Could not create item"
    end

  end

  def destroy
    # # needed to add this as a workaround for Items that got added without farms
    # Item.all.each { |i| i.update(farm: Farm.first) }

    @item = Item.find(params[:id])
    @item.update(archived: true)
    redirect_to farm_items_path, notice: "Item removed"
  end

  def new
    @item = Item.new
    @item.images.build
    @categories = Category.all.where("parent_id IS NOT null").map do |category|
      [category.name, category.id]
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = get_categories_list
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    if @item.valid?
      redirect_to farm_items_path, notice: "Item updated successfully"
    else
      redirect_to farm_items_path, notice: "Could not update item"
    end
  end

  def product
    @item = Item.find(params[:id])
    @categories = get_categories_list
  end

  def farm_index
    @items = current_farm.items.live.order(name: "ASC").paginate(page: params[:page]).includes(:images)
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :price, :farm_id, :category_id, :description,
      images_attributes: [:id, :image, :_destroy])
  end

  def get_categories_list
    Category.all.where("parent_id IS NOT null").map do |category|
          [category.name, category.id]
    end
  end
end
