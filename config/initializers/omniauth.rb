Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :pocket, ENV['POCKET_CONSUMER_KEY']
  provider :twitter, ENV['TWITTER_API_KEY'], ENV['TWITTER_API_SECRET']
end
