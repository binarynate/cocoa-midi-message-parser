Pod::Spec.new do |s|

  s.name         = "cocoa-midi-flex-messenger"
  s.version      = "0.0.1"
  s.summary      = "Objective-C MIDI message parser."

  s.description  = <<-DESC
                   Objective-C MIDI message parser.
                   DESC

  s.homepage     = "https://bitbucket.org/binarynate/cocoa-midi-message-parser"
  s.license      = "MIT"
  s.author       = { "Nathan Hill" => "binarynate@gmail.com" }

  s.source       = { :git => "git@bitbucket.org:binarynate/cocoa-midi-message-parser.git", :submodules => true }

  s.public_header_files = 'cocoa-midi-message-parser/*.{h}'
  s.source_files  = 'cocoa-midi-message-parser', 'cocoa-midi-message-parser/*.{h,m}', 'midi-message-parser/src', 'midi-message-parser/src/*.{h,c}'

end
