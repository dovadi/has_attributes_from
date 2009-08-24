require 'rake/testtask'

namespace :test do
  desc "Run the with_properties tests"
  Rake::TestTask.new(:has_attributes_from) do |t|
    t.libs << "test"
    t.test_files = FileList['test/unit/*_test.rb']
    t.verbose = true
  end
end

desc "Run the tests"
task :default => ['test:has_attributes_from']

namespace :has_attributes_from do
  gem_spec = Gem::Specification.new do |gem_spec|
    gem_spec.name        = "has_attributes_from"
    gem_spec.version     = "0.1.6"
    gem_spec.summary     = "Merge the attributes from another ActiveRecord class to an individual STI subclass."
    gem_spec.email       = "frank.oxener@dovadi.com"
    gem_spec.homepage    = "http://github.com/dovadi/has_attributes_from"
    gem_spec.description = "Merge the attributes from another ActiveRecord class to an individual STI subclass."
    gem_spec.authors     = ["Frank Oxener"]
    gem_spec.files       = FileList["[A-Z]*", "{lib,tasks,test}/**/*"]
  end

  desc "Generate a gemspec file"
  task :gemspec do
    File.open("#{gem_spec.name}.gemspec", 'w') do |f|
      f.write gem_spec.to_yaml
    end
  end
end