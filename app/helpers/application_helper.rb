module ApplicationHelper

  def link_to_twitter(text)
    link_to_blank "@#{text}", "http://twitter.com/#{text}" unless text.blank?
  end

  def link_to_facebook(text)
    link_to_blank "#{text}", "http://facebook.com/#{text}" unless text.blank?
  end  

  def link_to_blank(text, url)
    link_to text, url, :target => '_blank'
  end

  def page_header
    content_for :page_header do
      content_tag :h1, t('.page_header')
    end
  end

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|
      content_tag :div, :class => "alert-message #{type.to_s}" do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    raw formatted_messages.join
  end

  private

  def message_for_item(message, item = nil)
    if item.is_a?(Array)
      message % link_to(*item)
    else
      message % item
    end
  end 

end