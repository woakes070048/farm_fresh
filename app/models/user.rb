class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  mount_uploader :logo, LogoImageUploader

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj){ obj.post_code.present? and obj.post_code_changed? }

  def full_address
    "#{street}, #{city}, #{post_code}, #{region}"
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      # user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end

  def email_required?
    super && provider.blank?
  end

end
