require File.dirname(__FILE__) + '/../test_helper'

class CustomerDetailTest < Test::Unit::TestCase
  context 'A customer_detail' do
    setup do
      @customer_detail = Factory(:customer_detail)
    end

    should 'be valid' do
      assert_valid @customer_detail
    end
  end
end
