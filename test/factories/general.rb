Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.sequence :name do |n|
  "name-#{n}"
end

Factory.define :person do |person|
  person.email  {Factory.next :email}
  person.name   {Factory.next :name }
end

Factory.define :customer do |customer|
end

Factory.define :manager do |customer|
end

Factory.define :employee do |customer|
end

Factory.define :customer_detail do |customer_detail|
  customer_detail.phone ""
end

Factory.define :employee_property do |employee_property|
end