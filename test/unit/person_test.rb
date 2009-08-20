require File.dirname(__FILE__) + '/../test_helper'

class PersonTest < Test::Unit::TestCase
  context 'A person' do
    setup do
      @person = Factory(:person)
    end

    should 'be valid' do
      assert_valid @person
    end
  end
end
