class ItemImage < ActiveRecord::Base
  belongs_to :item

  validates_presence_of :image

  mount_uploader :image, ItemImageUploader
end
