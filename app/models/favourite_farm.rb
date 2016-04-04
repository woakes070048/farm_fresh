class FavouriteFarm < ActiveRecord::Base
  belongs_to :farm
  belongs_to :restaurant

  validates_presence_of :farm_id, :restaurant_id
end
