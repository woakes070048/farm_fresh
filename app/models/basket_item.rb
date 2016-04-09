class BasketItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :restaurant

  validates_presence_of :item
  validates_presence_of :restaurant
  validates :quantity, numericality: { greater_than: 0}
end
