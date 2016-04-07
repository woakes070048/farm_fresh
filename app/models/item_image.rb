class ItemImage < ActiveRecord::Base
  belongs_to :item

  validates_presence_of :image
  validates_presence_of :item

  mount_uploader :image, ItemImageUploader
end
