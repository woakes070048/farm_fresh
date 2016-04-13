class FarmsController < ApplicationController

  def index

  end

  def show
    @farm = Farm.find(params[:id])
    @items = @farm.items.live.includes(:images)
  end

end