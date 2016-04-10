class Restaurant < User
  has_many :favourite_farms
  has_many :basket_items
  has_many :orders

  validates_presence_of :name

  def basket_total
    basket_items.inject(0) do |sum,basket_item|
      sum + (basket_item.item.price * basket_item.quantity)
    end
  end
end