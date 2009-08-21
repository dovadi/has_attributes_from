$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
require 'activerecord'
require 'has_attributes_from/base'

ActiveRecord::Base.send(:include, HasAttributesFrom::Base)