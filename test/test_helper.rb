# Using the STI example from 'Agile Web development with Rails' Second Edition - 18.4

$: << File.join(File.dirname(__FILE__), '..', 'lib')
$: << File.join(File.dirname(__FILE__))

ENV["RAILS_ENV"] = "test"

require 'with_properties'
require File.expand_path(File.dirname(__FILE__) + "/rails_root/config/environment")
require 'test_help'
require 'shoulda'
require 'factory_girl'
require 'test/factories/general'
require 'set'

