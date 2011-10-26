class ModelWithNonDefaultLengthField < ActiveRecord::Base
  acts_as_formatted_length :field => :foo
end
