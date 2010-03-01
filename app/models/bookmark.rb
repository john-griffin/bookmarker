class Bookmark < ActiveRecord::Base
  
  include Bookmarker::Search
  
  belongs_to :site
  
  acts_as_taggable
  
  validates_presence_of :url, :on => :create, :message => "must be entered"
  validates_format_of :url, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :message => "must be valid"
  validate :url_must_exist, :if => :valid_url
  
  def before_create
    attach_site!
    update_title!
    update_url_short!
  end
  
  private
  
  def get_page(url)
    a = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari'}.get(url)
  end
  
  def update_title!
    self.title = get_page(url).title || url
  end
  
  def attach_site!
    host = URI.parse(url).host
    self.site = Site.find_or_create_by_url(host)
  end
  
  def update_url_short!
    bitly = Bitly.new("splitstate", "R_c8f065fed0cdeec065d93c9d55823acc")
    self.url_short = bitly.shorten(url).short_url
  end
  
  def valid_url
    self.errors.empty?
  end
  
  def url_must_exist
    begin
      get_page(url)
    rescue SocketError => e
      errors.add(:url, " must be valid")
    end
  end
  
end
