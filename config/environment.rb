RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'mechanize'
  config.gem 'compass'
  config.gem 'haml'
  config.gem "bitly"
  config.gem "rspec", :lib => false, :version => ">= 1.2.0"
  config.gem "rspec-rails", :lib => false, :version => ">= 1.2.0"
  config.time_zone = 'UTC'
end

ActionView::Base.field_error_proc = Proc.new { |html_tag, instance|
  "<span class=\"fieldWithErrors\">#{html_tag}</span>" 
}