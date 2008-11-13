require "rubygems"
require "hoe"
require "./lib/insinuate.rb"

Hoe.new("insinuate", Insinuate::VERSION) do |p|
  p.developer("John Barnette", "jbarnette@rubyforge.org")
  
end

task :clean do
  Dir.chdir("app") { sh "rake clean" }
end
