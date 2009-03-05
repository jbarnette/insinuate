require "rubygems"
require "hoe"
require "./lib/insinuate.rb"

module Insinuate
  CONFIGURATION = "Release"

  def self.xcodebuild(*args)
    sh (%w(xcodebuild -target Insinuate) +
      ["-configuration", Insinuate::CONFIGURATION] + args).join(" ")
  end
end

HOE = Hoe.new("insinuate", Insinuate::VERSION) do |p|
  p.developer "John Barnette", "jbarnette@rubyforge.org"

  p.url              = "http://github.com/jbarnette/insinuate"
  p.history_file     = "CHANGELOG.rdoc"
  p.readme_file      = "README.rdoc"
  p.extra_rdoc_files = [p.readme_file]
  p.need_tar         = false
  p.test_globs       = %w(test/**/*_test.rb)
  p.testlib          = :minitest

  p.spec_extras = {
    :extensions => ["Rakefile"],
    :platform   => "universal-darwin-9"
  }
end

namespace :app do
  task :build do
    Dir.chdir("app") { Insinuate.xcodebuild(:build) }
    cp_r "app/build/#{Insinuate::CONFIGURATION}/Insinuate.app", "bin"
  end

  task :clean do
    Dir.chdir("app") { Insinuate.xcodebuild(:clean) }
    rm_rf "bin/Insinuate.app"
  end

  task :rebuild => %w(clean build)
end

task :clean => "app:clean"

# Evil evil hack.  Do not run tests when gem installs
if ENV['RUBYARCHDIR']
  prereqs = Rake::Task[:default].prerequisites
  prereqs.clear
  prereqs << "app:build"
end
