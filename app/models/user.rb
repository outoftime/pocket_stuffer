class User < ActiveRecord::Base
  has_many :identities, dependent: :destroy
  has_many :sources, dependent: :destroy

  def update_reading_list
    pocket_identity = identities.find_by_type!('PocketIdentity')
    add_url = pocket_identity.method(:add_url)

    sources.find_each do |source|
      source.each_entry(since: source.synced_at, &add_url)
      source.touch(:synced_at)
    end
  end

  def needs_twitter_auth?
    sources.where(type: 'TwitterSource').any? &&
      identities.where(type: 'TwitterIdentity').none?
  end
end
