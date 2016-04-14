module OmniAuthTestHelper
  def valid_twitter_login_setup
    if Rails.env.test?
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
        provider: 'twitter',
        uid: '123545',
        info: {
          first_name: "Gaius",
          last_name:  "Baltar",
          name: "Bob Smith"
        },
        credentials: {
          token: "123456",
          expires_at: Time.now + 1.week
        },
        extra: {
          raw_info: {
            gender: 'male'
          }
        }
      })
    end
  end
end