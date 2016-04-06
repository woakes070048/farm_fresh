class CategoriesController < ApplicationController
  before_filter :authenticate_restaurant!

  def index
    if params[:parent_id].nil?
      @categories = Category.top_level.includes(:items)
    else
      category = Category.find(params[:parent_id])
      @categories = category.children.includes(:items)
    end
  end

end