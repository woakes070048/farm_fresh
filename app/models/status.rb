class Status < ActiveRecord::Base
  has_many :orders

  validates_presence_of :name
  validates :name, uniqueness: true
end
