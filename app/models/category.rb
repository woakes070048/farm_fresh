class Category < ActiveRecord::Base
  belongs_to :parent, class_name: 'Category', foreign_key: :parent_id, inverse_of: :children
  has_many :children, class_name: 'Category', foreign_key: :parent_id, inverse_of: :parent

  has_many :items

  scope :top_level, -> { where parent: nil }

  validates_presence_of :name
end
