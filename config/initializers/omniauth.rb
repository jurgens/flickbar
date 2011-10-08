Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, AppConfig['facebook_api_key'], AppConfig['facebook_api_secret']
end
