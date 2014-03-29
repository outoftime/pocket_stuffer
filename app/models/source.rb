class Source < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true

  def self.heuristic_create!(locator)
    implementation =
      if locator.starts_with?('@') || locator =~ /^\w{1,15}$/
        TwitterSource
      else
        RssSource
      end
    implementation.create_from_locator(locator)
  end

  def to_s
    title
  end
end
