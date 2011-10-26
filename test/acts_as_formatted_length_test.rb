require 'test_helper'

class ActsAsFormattedLengthTest < Test::Unit::TestCase
  def test_default_length_field_should_be_length
    assert_equal :length, ModelWithDefaultLengthField.formatted_length_field
  end
  
  def test_non_default_length_field_should_be_foo
    assert_equal :foo, ModelWithNonDefaultLengthField.formatted_length_field
  end
  
  def test_formatted_length_correct_for_default
    tested_model = ModelWithDefaultLengthField.new
    tested_model.length = 0
    assert_equal "00:00", tested_model.formatted_length
    tested_model.length = 30
    assert_equal "00:30", tested_model.formatted_length
    tested_model.length = 64
    assert_equal "01:04", tested_model.formatted_length
    tested_model.length = 3666
    assert_equal "1:01:06", tested_model.formatted_length
  end
  
  def test_formatted_length_correct_for_non_default
    tested_model = ModelWithNonDefaultLengthField.new
    tested_model.foo = 0
    assert_equal "00:00", tested_model.formatted_length
    tested_model.foo = 30
    assert_equal "00:30", tested_model.formatted_length
    tested_model.foo = 64
    assert_equal "01:04", tested_model.formatted_length
    tested_model.foo = 3666
    assert_equal "1:01:06", tested_model.formatted_length
  end
  
  def test_formatted_length_handles_nil
    tested_model = ModelWithDefaultLengthField.new
    tested_model.length = nil
    assert_equal "00:00", tested_model.formatted_length
  end
  
  def test_formatted_length_setter_accepts_formatted_string
    tested_model = ModelWithLengthFieldAndSetter.new
    tested_model.formatted_length = "1:01:06"
    assert_equal 3666,tested_model.length
    tested_model.formatted_length = "1:04"
    assert_equal 64,tested_model.length
    tested_model.formatted_length = "01:04"
    assert_equal 64,tested_model.length
    tested_model.formatted_length = "0:30"
    assert_equal 30,tested_model.length
    tested_model.formatted_length = "0:00"
    assert_equal 0,tested_model.length
  end 
  
  def test_formatted_length_setter_accepts_string
    tested_model = ModelWithLengthFieldAndSetter.new
    tested_model.formatted_length = "56"
    assert_equal 56,tested_model.length
  end 
end
