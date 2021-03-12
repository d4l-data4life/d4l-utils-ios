Pod::Spec.new do |s|
  s.name             = "Data4LifeSDKUtils"
  s.version          = "0.4.0"
  s.summary          = "Generic utilities functions used in the D4L SDK libraries"
  s.homepage         = "https://github.com/d4l-data4life/d4l-utils-ios.git"
  s.license          = { :type => 'LICENSE', :file => "LICENSE" }
  s.author           = { "D4L data4life gGmbH" => "contact@data4life.care" }
  s.swift_version    = '5.3'

  s.platform         = :ios, '12.0'
  s.requires_arc     = true
  s.source           = { :http => 'https://github.com/d4l-data4life/d4l-utils-ios/releases/download/0.4.0/Data4LifeSDKUtils-xcframeworks-0.4.0.zip' }

  s.vendored_frameworks = 'Data4LifeSDKUtils.xcframework', 'CryptoSwift.xcframework'

end
