class TwitterIdentity < Identity
  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_API_KEY']
      config.consumer_secret = ENV['TWITTER_API_SECRET']
      config.access_token = auth_token
      config.access_token_secret = auth_secret
    end
  end
end
