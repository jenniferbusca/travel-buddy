Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'],
  provider_ignores_state: true,
  callback_path: '/auth/google_oauth2/callback',
  skip_jwt: true
end
