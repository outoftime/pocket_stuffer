class Identity < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true

  def self.create_from_auth(auth, user = nil)
    clazz = "#{auth['provider'].classify}Identity"
    clazz.constantize.find_or_create_by_uid!(auth['uid']) do |identity|
      identity.auth_token = auth['credentials']['token']
      identity.auth_secret = auth['credentials']['secret']
      identity.user = user || User.new
    end
  end
end
