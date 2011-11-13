if Rails.configuration.respond_to?(:sass)
  Rails.configuration.sass.tap do |config|
    # Prefer SASS, 'cause that's what real men use :)
    config.preferred_syntax = :sass
  end
end