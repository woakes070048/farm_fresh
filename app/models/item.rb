class Item < ActiveRecord::Base
  belongs_to :farm
  belongs_to :category
end
