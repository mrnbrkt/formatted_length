require 'spec_helper'

class ClassFormattedWithDefaultField < SuperModel::Base
  extend FormattedLength::ModelAdditions
  acts_as_formatted_length
  attr_accessor :length
end

class ClassFormattedWithNonDefaultField < SuperModel::Base
  extend FormattedLength::ModelAdditions
  acts_as_formatted_length :how_long
  attr_accessor :how_long
end

describe FormattedLength::ModelAdditions do
  describe "#formatted_length" do 
    it "converts integer value from length by default" do
      ClassFormattedWithDefaultField.create!(length: 30).formatted_length.should == "00:30"
      ClassFormattedWithDefaultField.create!().formatted_length.should == "00:00"
    end

    it "converts integer value from specific field if defined" do 
      ClassFormattedWithNonDefaultField.create!(how_long: 30).formatted_length.should == "00:30"
      ClassFormattedWithNonDefaultField.create!().formatted_length.should == "00:00"
    end
  end

  describe "#formatted_length=" do
    it "converts string value and saves it in default field" do
      ClassFormattedWithDefaultField.create!(formatted_length: "1:00:30").length.should == 3630
      ClassFormattedWithDefaultField.create!(formatted_length: "00:30").length.should == 30
    end

    it "converts string value and saves it in selected field" do
      ClassFormattedWithNonDefaultField.create!(formatted_length: "1:00:30").how_long.should == 3630
      ClassFormattedWithNonDefaultField.create!(formatted_length: "00:30").how_long.should == 30
    end
  end
end