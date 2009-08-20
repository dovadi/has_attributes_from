require File.dirname(__FILE__) + '/../test_helper'

class ManagerTest < Test::Unit::TestCase
  context 'A manager' do
    setup do
      @manager = Factory(:manager)
    end

    should 'be valid' do
      assert_valid @manager
    end
  end
end
