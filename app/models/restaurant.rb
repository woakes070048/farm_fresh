class Restaurant < User
  has_many :favourite_farms
  has_many :basket_items

  validates_presence_of :name
end