require 'spec_helper'
examples = [
        {seconds: 5, as_string: "00:05"},
        {seconds: 65, as_string: "01:05"},
        {seconds: 555, as_string: "09:15"},
        {seconds: 1234, as_string: "20:34"},
        {seconds: 3599, as_string: "59:59"},
        {seconds: 3600, as_string: "1:00:00"},
         {seconds: 0, as_string: "00:00"}
      ]
describe FormattedLength do
  describe ".format_to_s" do
    it "converts length in seconds to string representation" do
      examples.each do |hash|
        FormattedLength.format_to_s(hash[:seconds]).should  == hash[:as_string]
      end
    end

    it "converts nil to 00:00" do
      FormattedLength.format_to_s(nil).should == "00:00"
    end
  end

  describe ".format_to_i" do
    it "converts string representation of length to seconds" do
      examples.each do |hash|
        FormattedLength.format_to_i(hash[:as_string]).should  == hash[:seconds]
      end
    end

    it "handles empty string and nil" do
      FormattedLength.format_to_i(nil).should == 0
      FormattedLength.format_to_i("").should == 0
    end
  end
end