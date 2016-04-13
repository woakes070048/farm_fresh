class LineItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  belongs_to :status

  validates_presence_of :order, :item
  validates :quantity, numericality: { greater_than: 0 }

  scope :recents, -> { where("line_items.created_at > ?", 7.days.ago) }
end
