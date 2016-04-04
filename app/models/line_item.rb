class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  validates_presence_of :order, :item
  validates :quantity, numericality: { greater_than: 0 }
end
