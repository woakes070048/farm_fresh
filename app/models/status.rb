class Status < ActiveRecord::Base
  has_many :orders
  has_many :line_items

  validates_presence_of :name
  validates :name, uniqueness: true
end
