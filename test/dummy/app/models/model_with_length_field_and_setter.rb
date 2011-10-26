class ModelWithLengthFieldAndSetter < ActiveRecord::Base
  acts_as_formatted_length :setter => true
end
