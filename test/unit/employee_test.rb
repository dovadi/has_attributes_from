require File.dirname(__FILE__) + '/../test_helper'

class EmployeeTest < Test::Unit::TestCase
  context 'An employee with_properties' do
    setup do
      @employee = Factory(:employee)
      @employee.employee_property=Factory(:employee_property, :reports_to=>123, :department=>'Sales', :employee_id=>@employee)
      @employee.save
    end

    should_have_one  :employee_property
    should_have_class_methods :with_properties
    should_have_instance_methods :save_properties
    should_have_instance_methods :department
    should_have_instance_methods :department=
    should_have_instance_methods :reports_to
    should_have_instance_methods :reports_to=

    should 'be valid' do
      assert_valid @employee
    end

    should 'return its department (based on employee properties)' do
      assert_equal 'Sales', @employee.department
    end

    should 'create a employee with its properties' do
      employee = Employee.create(:name =>'Dovadi', :email=>'frank@dovadi.com', :reports_to=>55, :department=>'Customer support')
      assert_valid employee
      assert_valid employee.employee_property
    end

    should 'update attributes with a property' do
      employee = Employee.create(:name =>'Dovadi', :email=>'frank@dovadi.com')
      employee.update_attributes(:reports_to=>100)
      employee.reload
      assert_equal 100, employee.reports_to
    end

    should 'update one attribute with a property' do
      employee = Employee.create(:name =>'Dovadi', :email=>'frank@dovadi.com')
      employee.update_attribute(:reports_to,200)
      employee.reload
      assert_equal 200, employee.reports_to
    end
  end

end
