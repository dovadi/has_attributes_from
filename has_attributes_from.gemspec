--- !ruby/object:Gem::Specification 
name: has_attributes_from
version: !ruby/object:Gem::Version 
  version: 0.1.4
platform: ruby
authors: 
- Frank Oxener
autorequire: 
bindir: bin
cert_chain: []

date: 2009-08-24 00:00:00 +02:00
default_executable: 
dependencies: []

description: Merge the attributes from another ActiveRecord class to an individual STI subclass.
email: frank.oxener@dovadi.com
executables: []

extensions: []

extra_rdoc_files: []

files: 
- History.txt
- Manifest.txt
- Rakefile
- README.textile
- lib/has_attributes_from
- lib/has_attributes_from/base.rb
- lib/has_attributes_from.rb
- tasks/has_attributes_from.rake
- test/factories
- test/factories/general.rb
- test/rails_root
- test/rails_root/app
- test/rails_root/app/models
- test/rails_root/app/models/customer.rb
- test/rails_root/app/models/customer_detail.rb
- test/rails_root/app/models/employee.rb
- test/rails_root/app/models/employee_property.rb
- test/rails_root/app/models/manager.rb
- test/rails_root/app/models/person.rb
- test/rails_root/config
- test/rails_root/config/boot.rb
- test/rails_root/config/database.yml
- test/rails_root/config/environment.rb
- test/rails_root/config/environments
- test/rails_root/config/environments/test.rb
- test/rails_root/config/routes.rb
- test/rails_root/db
- test/rails_root/db/migrate
- test/rails_root/db/migrate/20090820105348_create_people.rb
- test/rails_root/db/migrate/20090820105521_create_employee_properties.rb
- test/rails_root/db/migrate/20090820110621_create_customer_details.rb
- test/rails_root/db/schema.rb
- test/rails_root/db/test.sqlite3
- test/rails_root/log
- test/rails_root/log/test.log
- test/rails_root/log/untitled folder
- test/test_helper.rb
- test/unit
- test/unit/customer_detail_test.rb
- test/unit/customer_test.rb
- test/unit/employee_property_test.rb
- test/unit/employee_test.rb
- test/unit/manager_test.rb
- test/unit/person_test.rb
has_rdoc: false
homepage: http://github.com/dovadi/has_attributes_from
licenses: []

post_install_message: 
rdoc_options: []

require_paths: 
- lib
required_ruby_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
required_rubygems_version: !ruby/object:Gem::Requirement 
  requirements: 
  - - ">="
    - !ruby/object:Gem::Version 
      version: "0"
  version: 
requirements: []

rubyforge_project: 
rubygems_version: 1.3.2
signing_key: 
specification_version: 3
summary: Merge the attributes from another ActiveRecord class to an individual STI subclass.
test_files: []

