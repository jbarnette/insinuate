require "webrick"

module Insinuate
  # NOTE: this is copied from ../lib/insinuate.rb
  STATES = %w(unknown bad iffy good)
end

class InsinuateListener < OSX::NSObject
  ib_outlet :view

  include WEBrick

  def awakeFromNib
    log = WEBrick::Log.new(true)
    def log.log(*anything); end

    server = HTTPServer.new(:Port => 31313, :Logger => log)

    Insinuate::STATES.each do |state|
      server.mount_proc("/#{state}") do |request, response|
        @view.set_current_state(state)
      end
    end

    Thread.new { server.start }
  end
end

class InsinuateWindow < OSX::NSWindow
  attr_accessor :initial_location

  def initWithContentRect_styleMask_backing_defer(contentRect, aStyle, bufferingType, flag)
    result = super_initWithContentRect_styleMask_backing_defer_(
      contentRect, OSX::NSBorderlessWindowMask, OSX::NSBackingStoreBuffered, false)

    result.setBackgroundColor(OSX::NSColor.clearColor)
    result.setLevel(OSX::NSStatusWindowLevel)
    result.setAlphaValue(1.0)
    result.setOpaque(false)
    result.setHasShadow(true)

    result
  end

  def canBecomeKeyWindow
    true
  end

  def mouseDragged(theEvent)
    screenFrame = OSX::NSScreen.mainScreen.frame
    windowFrame = self.frame
    currentLocation = self.convertBaseToScreen(self.mouseLocationOutsideOfEventStream)

    newOrigin = OSX::NSPoint.new(
      currentLocation.x - @initial_location.x, currentLocation.y - @initial_location.y)

    # respect the menu bar
    if((newOrigin.y + windowFrame.size.height) > (screenFrame.origin.y + screenFrame.size.height))
      newOrigin.y = screenFrame.origin.y + (screenFrame.size.height - windowFrame.size.height)
    end

    setFrameOrigin(newOrigin)
  end

  def mouseDown(theEvent)
    windowFrame = frame

    @initial_location = convertBaseToScreen(theEvent.locationInWindow);
    @initial_location.x -= windowFrame.origin.x;
    @initial_location.y -= windowFrame.origin.y;
  end
end

class InsinuateView < OSX::NSView
  attr_reader :current_image_name

  def awakeFromNib
    @images = {}
    Insinuate::STATES.each { |c| @images[c] = OSX::NSImage.imageNamed(c) }
    set_current_state("unknown")
  end

  def set_current_state(name)
    @current_state = Insinuate::STATES.detect { |v| v == name } || "unknown"
    setNeedsDisplay(true)
  end

  def current_nsimage
    @images[@current_state]
  end

  def acceptsFirstMouse(event)
    true
  end

  def drawRect(rect)
    OSX::NSColor.clearColor.set
    OSX::NSRectFill(frame)
    current_nsimage.compositeToPoint_operation_([0,0], OSX::NSCompositeSourceOver)
    window.invalidateShadow
  end
end
