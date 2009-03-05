require "open-uri"

# HACK: this whole thing makes my eyes bleed

module Insinuate
  VERSION = "1.0.0"

  APP = File.dirname(__FILE__) + "/../bin/Insinuate.app"

  # HACK: this is manually copied to ../app/insinuate.rb
  STATES = %w(unknown bad iffy good off)

  STATES.each do |state|
    module_eval "def self.#{state}; insinuate #{state.inspect} end"
  end

  def self.insinuate(state)
    # professional software engineer at work
    if ps.empty?
      `open #{APP}`
      sleep 1
    end

    open("http://localhost:31313/#{state}") {}
  end

  def self.off
    pid = ps.split(' ')[1]
    Process.kill('TERM', pid.to_i) if pid
  end

  def self.ps
    `ps -ef | grep Insinuate.app | grep -v grep`
  end
end
