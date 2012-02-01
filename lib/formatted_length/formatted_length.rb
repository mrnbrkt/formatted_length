module FormattedLength
  def self.format_to_s(value)
    value = value || 0
    hours = value / 3600
    minutes = (value / 60) % 60
    seconds = value % 60
    result = "%02d" % minutes + ":%02d" % seconds
    result = "#{hours}:#{result}" if hours > 0
    result
  end

  def self.format_to_i(value)
    result = 0
    unless value.nil?
      if (match = /((\d+):)?(\d+):(\d+)/.match(value))
        result = match[2].to_i * 3600 + match[3].to_i * 60 + match[4].to_i
      end
    end
    result
  end
end
