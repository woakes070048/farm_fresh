class DeliveryOption < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
