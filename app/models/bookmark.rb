class Bookmark < ActiveRecord::Base
  belongs_to :site
  
  acts_as_taggable
end
