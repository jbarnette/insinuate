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

Hoe.new("insinuate", Insinuate::VERSION) do |p|
  p.developer("John Barnette", "jbarnette@rubyforge.org")
end

namespace :app do
  task :build do
    Dir.chdir("app") { Insinuate.xcodebuild(:build) }
    cp_r "app/build/#{Insinuate::CONFIGURATION}/Insinuate.app", "bin"
  end
  
  task :clean do
    Dir.chdir("app") { Insinuate.xcodebuild(:clean) }
  end
  
  task :rebuild => %w(clean build)
end

task :clean => "app:clean"
Rake::Task[:package].prerequisites.unshift "app:build"
