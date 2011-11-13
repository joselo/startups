class Startup < ActiveRecord::Base
  belongs_to :user
  before_save :set_permalink

  MAX_DESCRIPTION = 1000

  validates :name, :description, :twitter, :presence => true
  validates :description, :length => { :maximum => MAX_DESCRIPTION }
  validates :url, :presence => true, :uri => { :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ }

  def to_param
    "#{id}-#{permalink}"
  end

  def self.latest(page = 1)
    Startup.order("created_at desc").page page
  end

  private

  def set_permalink
    self.permalink = name.parameterize
  end  

end