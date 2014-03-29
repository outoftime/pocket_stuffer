class PocketIdentity < Identity
  include HTTParty
  base_uri 'https://getpocket.com/v3'

  def add_url(url, options = {})
    self.class.post(
      '/add',
      headers: {'Content-Type' => 'application/json'},
      body: {
        url: url,
        tweet_id: options[:tweet_id],
        consumer_key: ENV['POCKET_CONSUMER_KEY'],
        access_token: auth_token
      }.to_json
    )
  end
end
