class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  has_many :startups

  attr_accessible :provider, :uid, :name, :email

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['user_info']
        user.name = auth['user_info']['name'] if auth['user_info']['name'] # Twitter, Google, Yahoo, GitHub
        user.email = auth['user_info']['email'] if auth['user_info']['email'] # Google, Yahoo, GitHub
      end
      if auth['extra'] && auth['extra']['user_hash']
        user.name = auth['extra']['user_hash']['name'] if auth['extra']['user_hash']['name'] # Facebook
        user.email = auth['extra']['user_hash']['email'] if auth['extra']['user_hash']['email'] # Facebook
      end
    end
  end

  def new_startup(attributes={})
    startups.new(attributes)
  end

  def find_startup(startup_id)
    startups.find(startup_id)
  end

  def has_startups?
    startups.size > 0
  end

end