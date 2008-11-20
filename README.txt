= insinuate

* http://github.com/jbarnette/insinuate

== DESCRIPTION:

Two bits of delicious information. Insinuate puts a tiny little colored
circle on your desktop and lets you change its color. That's it.

== FEATURES/PROBLEMS:

* FOUR possible states! Unknown, bad, iffy, and good.
* Awesome, untested code!
* An ugly, default app icon!
* Pointless use of Webrick!

== SYNOPSIS:

From the command line:

  $ insinuate unknown|iffy|good|bad
  
From Ruby:

  require "rubygems"
  require "insinuate"
  
  Insinuate.good

The app will be launched the first time you insinuate anything.

== REQUIREMENTS:

* A Mac. RubyCocoa.

== INSTALL:

* sudo gem install insinuate

== INSTALL FROM SOURCE:

* git clone git://github.com/jbarnette/insinuate.git
* cd insinuate
* sudo rake install_gem

== LICENSE:

(The MIT License)

Copyright (c) 2008 John Barnette <jbarnette@rubyforge.org>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
