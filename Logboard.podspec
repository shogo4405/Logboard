Pod::Spec.new do |s|

  s.name         = "Logboard"
  s.version      = "1.1.5"
  s.summary      = "Simple Logging framework"

  s.description  = <<-DESC
  Simple Logging framework for your framework project.
  DESC

  s.homepage     = "https://github.com/shogo4405/Logboard"
  s.license      = "New BSD"
  s.author       = { "shogo4405" => "shogo4405@gmail.com" }
  s.authors      = { "shogo4405" => "shogo4405@gmail.com" }
  s.source       = { :git => "https://github.com/shogo4405/Logboard.git", :tag => "#{s.version}" }
  s.social_media_url = "http://twitter.com/shogo4405"

  s.ios.deployment_target = "8.0"
  s.ios.source_files = "Platforms/iOS/*.{h,swift}"

  s.osx.deployment_target = "10.9"
  s.osx.source_files = "Platforms/macOS/*.{h,swift}"

  s.tvos.deployment_target = "9.0"
  s.tvos.source_files = "Platforms/tvOS/*.{h,swift}"

  s.watchos.deployment_target = "2.0"
  s.watchos.source_files = "Platforms/watchOS/*.{h,swift}"

  s.source_files = "Sources/*.swift"

end

