class Item < ActiveRecord::Base
  belongs_to :farm
  belongs_to :category
  has_many :images, class_name: 'ItemImage', foreign_key: :item_id
  has_many :line_items

  validates_presence_of :name, :category, :farm
  validates :price, numericality: { greater_than: 0}

  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  before_create :default_values
  before_destroy :archive_item

  scope :live,    -> { where archived: false }
  scope :archive, -> { where archived: true }

  private

  def default_values
    write_attribute(:archived, false)
    write_attribute(:created_at, DateTime.now)
  end

  def archive_item
    write_attribute(:archived, true)
    false
  end
end
