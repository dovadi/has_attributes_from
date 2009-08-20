require 'rake/testtask'

namespace :test do
  desc "Run the with_properties tests"
  Rake::TestTask.new(:with_properties) do |t|
    t.libs << "test"
    t.test_files = FileList['test/unit/*_test.rb']
    t.verbose = true
  end
end

desc "Run the tests"
task :default => ['test:with_properties']

namespace :with_properties do
  gem_spec = Gem::Specification.new do |gem_spec|
    gem_spec.name        = "with_properties"
    gem_spec.version     = "0.1"
    gem_spec.summary     = "Add extra properties to individual STI subclasses (ActiveRecord)."
    gem_spec.email       = "frank.oxener@dovadi.com"
    gem_spec.homepage    = "http://github.com/dovadi/with_properties"
    gem_spec.description = "Add extra properties to individual STI subclasses (ActiveRecord)"
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