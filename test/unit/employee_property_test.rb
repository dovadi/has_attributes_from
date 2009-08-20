require File.dirname(__FILE__) + '/../test_helper'

class EmployeePropertyTest < Test::Unit::TestCase
  context 'A employee_property' do
    setup do
      @employee_property = Factory(:employee_property)
    end

    should 'be valid' do
      assert_valid @employee_property
    end
  end
end
