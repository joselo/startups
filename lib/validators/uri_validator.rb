require 'net/http'

# Thanks Ilya! http://www.igvita.com/2006/09/07/validating-url-in-ruby-on-rails/
# Original credits: http://blog.inquirylabs.com/2006/04/13/simple-uri-validation/
# HTTP Codes: http://www.ruby-doc.org/stdlib/libdoc/net/http/rdoc/classes/Net/HTTPResponse.html

class UriValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    raise(ArgumentError, "A regular expression must be supplied as the :format option of the options hash") unless options[:format].nil? or options[:format].is_a?(Regexp)
    configuration = { :message => I18n.t("activerecord.errors.models.#{object.class.name.downcase}.attributes.#{attribute}.invalid"), :format => URI::regexp(%w(http https)) }
    configuration.update(options)

    if value =~ configuration[:format]
      if !Rails.env.test? && (value =~ /^http:\/\/www.example/).nil?
        begin # check header response
          case Net::HTTP.get_response(URI.parse(value))
            when Net::HTTPSuccess then true
            else object.errors.add(attribute, configuration[:message]) and false
          end
        rescue # Recover on DNS failures..
          object.errors.add(attribute, configuration[:message]) and false
        end
      end
    else
      object.errors.add(attribute, configuration[:message]) and false
    end

  end
end