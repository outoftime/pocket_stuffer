class RssSource < Source
  RSS_MIME_TYPES = Set[
    'application/rss+xml',
    'application/rdf+xml',
    'application/atom+xml',
    'application/xml',
    'text/xml'
  ]

  def self.create_from_locator(locator, options = {})
    uri = Addressable::URI.heuristic_parse(locator)
    response = Net::HTTP.get_response(uri)
    if options[:assume_rss] || RSS_MIME_TYPES.include?(response.content_type)
      feed = Feedjira::Feed.parse(response.body)
      find_or_create_by_locator!(
        locator: feed.feed_url,
        title: feed.title,
        web_url: feed.url,
        type: name
      )
    else
      doc = Nokogiri::HTML(response.body)
      alternate = doc.css('link[rel="alternate"]')
        .find { |link| RSS_MIME_TYPES.include?(link.attr('type')) }
      create_from_locator(alternate.attr('href'), assume_rss: true) if alternate
      binding.pry unless alternate
    end
  end

  def each_entry(options = {})
    return enum_for(:each_entry, options) unless block_given?

    since = options[:since]
    feed.entries.each do |entry|
      yield entry.url if since.nil? || entry.published > since
    end
  end

  private

  def feed
    @feed ||= Feedjira::Feed.fetch_and_parse(locator)
  end
end
