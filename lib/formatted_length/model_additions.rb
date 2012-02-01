module FormattedLength
  module ModelAdditions
    def acts_as_formatted_length(field = :length)
      define_method :formatted_length do
        FormattedLength.format_to_s(send(field))
      end
      define_method :formatted_length= do |value|
        send("#{field}=".to_sym, FormattedLength.format_to_i(value))
      end
    end
  end
end