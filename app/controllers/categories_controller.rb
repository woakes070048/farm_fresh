class CategoriesController < ApplicationController

  def index
    if params[:parent_id].nil?
      render json: Category.top_level
    else
      category = Category.find(params[:parent_id])
      render json: category.children
    end
  end

end