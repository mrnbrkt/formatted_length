module FormattedLength
  module ActsAsFormattedLength
    extend ActiveSupport::Concern
    module  ClassMethods
      def acts_as_formatted_length(options = {})
       cattr_accessor :formatted_length_field
       self.formatted_length_field = options[:field] || :length
       if options[:setter] == true
         define_method :formatted_length= do |value|
	          if (match = /((\d+):)?(\d+):(\d+)/.match(value))
	            self.send("#{self.class.formatted_length_field}=", match[2].to_i * 3600 + match[3].to_i * 60 + match[4].to_i)
	          else
	            self.send("#{self.class.formatted_length_field}=", value.to_i)
	          end           
         end
       end
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
