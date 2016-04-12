class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :logo, LogoImageUploader

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.post_code.present? and obj.post_code_changed? }

  def full_address
    "#{street}, #{city}, #{post_code}, #{region}"
  end

end
