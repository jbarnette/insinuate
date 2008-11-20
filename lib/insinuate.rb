require "open-uri"

module Insinuate
  VERSION = "0.0.0"
  
  # NOTE: this is manually copied to ../app/insinuate.rb
  STATES = %w(unknown bad iffy good)

  STATES.each do |state|
    module_eval "def self.#{state}; insinuate #{state.inspect}; end"    
  end
  
  APP = File.dirname(__FILE__) + "/../bin/Insinuate.app"
  
  def self.insinuate(state)
    # professional software engineer at work
    if ps.empty?
      `open #{APP}` 
      sleep 1
    end

    open("http://localhost:31313/#{state}") {}    
  end
  
  class << self
    def off
      pid = ps.split(' ')[1]
      Process.kill('TERM', pid.to_i) if pid
    end
    
    private
    def ps
      `ps -ef | grep Insinuate.app | grep -v grep`
    end
  end
end
