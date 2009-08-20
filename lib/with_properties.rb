$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
require 'activerecord'
require 'with_properties/core'

ActiveRecord::Base.send(:include, WithProperties::Core)