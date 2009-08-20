require File.dirname(__FILE__) + '/../test_helper'

class CustomerTest < Test::Unit::TestCase
  context 'A customer with_properties' do
    setup do
      @customer = Factory(:customer)
      @customer.customer_detail=Factory(:customer_detail, :phone=>'0222311304', :customer_id=>@customer)
      @customer.save
    end

    should_have_one  :customer_detail
    should_have_class_methods :with_properties
    should_have_instance_methods :save_properties
    should_have_instance_methods :phone
    should_have_instance_methods :phone=

    should 'be valid' do
      assert_valid @customer
    end

    should 'return its phone number (based on customer properties)' do
      assert_equal '0222311304', @customer.phone
    end

    should 'create a customer with its properties' do
      customer = Customer.create(:name =>'Dovadi', :email=>'frank@dovadi.com', :phone=>'0649416406')
      assert_valid customer
      assert_valid customer.customer_detail
    end

    should 'update attributes with a property' do
      customer = Customer.create(:name =>'Dovadi', :email=>'frank@dovadi.com')
      customer.update_attributes(:phone=>'0222300100')
      customer.reload
      assert_equal '0222300100', customer.phone
    end

    should 'update one attribute with a property' do
      customer = Customer.create(:name =>'Dovadi', :email=>'frank@dovadi.com')
      customer.update_attribute(:phone,'0222300200')
      customer.reload
      assert_equal '0222300200', customer.phone
    end
  end

  context 'Validations of a property (through customer_detail)' do
    setup do
      @customer = Factory(:customer)
      @customer.customer_detail=Factory(:customer_detail, :phone=>'0222311304', :customer_id=>@customer)
      @customer.save
    end
    should_ensure_length_in_range :phone, 10..10

    should "validate length of phone (which is a property through customer_detail)" do
      @customer.phone="012345678"
      assert !@customer.save
    end

    should "validate format of phone (which is a property through customer_detail)" do
      @customer.phone="012345678A"
      assert !@customer.save
    end

    should "allow blank a phone number (which is a property through customer_detail)" do
      @customer.phone=""
      assert @customer.save
    end
  end

end