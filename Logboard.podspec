Pod::Spec.new do |s|

  s.name         = "Logboard"
  s.version      = "2.5.0"
  s.summary      = "Simple Logging framework"
  s.swift_version = "5.8"

  s.description  = <<-DESC
  Simple Logging framework for your framework project.
  DESC

  s.homepage     = "https://github.com/shogo4405/Logboard"
  s.license      = "New BSD"
  s.author       = { "shogo4405" => "shogo4405@gmail.com" }
  s.authors      = { "shogo4405" => "shogo4405@gmail.com" }
  s.source       = { :git => "https://github.com/shogo4405/Logboard.git", :tag => "#{s.version}" }

  s.ios.deployment_target = "13.0"
  s.osx.deployment_target = "10.15"
  s.tvos.deployment_target = "13.0"
  s.watchos.deployment_target = "6.0"
  s.visionos.deployment_target = "1.0"

  s.source_files = "Sources/**/*.{h,swift}"

end
