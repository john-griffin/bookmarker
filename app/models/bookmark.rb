class Bookmark < ActiveRecord::Base
  belongs_to :site
  
  acts_as_taggable
  
  def before_create
    attach_site!
    update_title!
    update_url_short!
  end
  
  private
  def update_title!
    a = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
    self.title = a.get(url).title || url
  end
  
  def attach_site!
    host = URI.parse(url).host
    found_site = Site.find_by_url(host)
    if found_site.nil?
      create_site(:url => host)
    else
      self.site=found_site
    end
  end
  
  def update_url_short!
    bitly = Bitly.new("splitstate", "R_c8f065fed0cdeec065d93c9d55823acc")
    self.url_short = bitly.shorten(url).short_url
  end
end
