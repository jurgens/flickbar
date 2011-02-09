Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '2c29ede829e80f949e57f2be80f2a2a1', '15d3b7f2495459000bb847fbb888742d'
end
