Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['STARTUPS_CONSUMER_KEY'], ENV['STARTUPS_CONSUMER_SECRET']
end