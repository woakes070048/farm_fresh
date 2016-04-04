class Restaurant < User
  has_many :favourite_farms

  validates_presence_of :name
end