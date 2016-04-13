class FarmsController < ApplicationController

  def index

  end

  def show
    @items = Farm.find(params[:id]).items.live.includes(:images)
  end

end