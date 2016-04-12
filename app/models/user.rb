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
      user.access_token = auth.extra.access_token.params[:oauth_token]
      user.access_secret = auth.extra.access_token.params[:oauth_token_secret]
    end
  end

  def email_required?
    super && provider.blank?
  end

  def tweet(message)
    return unless provider == "twitter"
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["twitter_client_key"]
      config.consumer_secret = ENV["twitter_secret_access_key"]
      config.access_token    = access_token
      config.access_token_secret = access_secret
    end
    client.update(message)
end

end
