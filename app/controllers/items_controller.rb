class ItemsController < ApplicationController
  # before_filter :authenticate_restaurant!

  def index
    sort_column =
      params[:sort_option].nil? ? :price : params[:sort_option].strip.downcase.to_sym

    if params[:category_id].nil?
      @items = Item.order({ sort_column => "DESC" }).
        paginate(page: params[:page], per_page: 9).
        includes(:images)
    else
      @items = Category.find(params[:category_id]).
        items.order({ sort_column => "DESC" }).
        paginate(page: params[:page], per_page: 9).
        includes(:images)
    end

  end
end
