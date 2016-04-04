class FavouriteFarm < ActiveRecord::Base
  belongs_to :farm
  belongs_to :restaurant

  validates_presence_of :farm, :restaurant
end
