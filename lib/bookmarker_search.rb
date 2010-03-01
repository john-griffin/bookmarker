module Bookmarker
  module Search
    def self.included(base)
      base.send(:extend,  ClassMethods)
    end
    
    module ClassMethods
      def search(text, fields)
        return [] if text.nil? || text.blank? || fields.nil? || fields.empty?
        condition = fields.collect{|f| f+" like :search"}.join(" or ")
        self.all(:conditions => [condition, {:search => "%"+text+"%"}])      
      end
    end
  end
end