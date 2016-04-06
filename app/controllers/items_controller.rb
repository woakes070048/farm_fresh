class ItemsController < ApplicationController
  # before_filter :authenticate_restaurant!

  def index
    if params[:category_id].nil?
      @items = Item.all.includes(:images)
    else
      @items = Category.find(params[:category_id]).items.includes(:images)
    end

    unless params[:sort_option].nil?
      @items.order("#{params[:sort_option].strip.downcase} asc")
    end

  end
end
