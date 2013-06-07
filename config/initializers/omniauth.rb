OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  #provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  provider :facebook, '372259012878195', 'b761a9db155ce34273d52de807762bac'
  #
  
end
