module FormattedLength
  module ActsAsFormattedLength
    extend ActiveSupport::Concern
    module  ClassMethods
      def acts_as_formatted_length(options = {})
       cattr_accessor :formatted_length_field
       self.formatted_length_field = options[:field] || :length
      end
    end
    
    module InstanceMethods
      def formatted_length
        value = self.send(self.class.formatted_length_field) || 0
        str=""
        hours=value/3600
        minutes=value%3600/60
        seconds=value%60
        minutes_str = minutes > 9? minutes.to_s : "0#{minutes}"
        seconds_str = seconds > 9? seconds.to_s : "0#{seconds}"
        if(hours > 0) #we have hours
          str << "#{hours}:"
        end
        str << "#{minutes_str}:#{seconds_str}"
      end
    end
  end
end

ActiveRecord::Base.send :include, FormattedLength::ActsAsFormattedLength
