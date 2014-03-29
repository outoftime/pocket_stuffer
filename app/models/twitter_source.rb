class TwitterSource < Source
  def self.create_from_locator(locator, options = {})
    create!(
      locator: locator.sub(/^@/, ''),
      title: locator.sub(/^@?/, '@'),
      type: name
    )
  end

  def each_entry(options = {}, &block)
    return enum_for(:each_entry, options) unless block

    client = user.identities.find_by_type('TwitterIdentity').try(:client)
    return unless client

    since = options[:since]
    client.user_timeline(locator).each do |tweet|
      if since.nil? || tweet.created_at >= since
        tweet.urls.each do |url|
          yield url.expanded_url.to_s, tweet_id: tweet.id
        end
      end
    end
  end

  def web_url
    "https:/twitter.com/#{locator}"
  end
end
