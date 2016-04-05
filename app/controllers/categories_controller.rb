class CategoriesController < ApplicationController

  def index
    if params[:parent_id].nil?
      @categories = Category.top_level
    else
      category = Category.find(params[:parent_id])
      @categories = category.children
    end
  end

end