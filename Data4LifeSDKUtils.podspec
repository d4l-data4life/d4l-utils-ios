Pod::Spec.new do |s|
  s.name             = "Data4LifeSDKUtils"
  s.version          = "0.6.0"
  s.summary          = "Generic utilities functions used in the D4L SDK libraries"
  s.homepage         = "https://github.com/d4l-data4life/d4l-utils-ios.git"
  s.license          = { :type => 'LICENSE', :file => 'Data4LifeSDKUtils.xcframework/LICENSE' }
  s.author           = { "D4L data4life gGmbH" => "contact@data4life.care" }

  s.source           = { :http => 'https://github.com/d4l-data4life/d4l-utils-ios/releases/download/' + s.version.to_s + '/Data4LifeSDKUtils-xcframework-' + s.version.to_s + '.zip' }
  s.swift_version    = '5.3'
  s.platform         = :ios, '13.0'
  s.requires_arc     = true
  s.cocoapods_version = '>= 1.10.0'

  s.preserve_paths      = 'Data4LifeSDKUtils.xcframework'
  s.vendored_frameworks = 'Data4LifeSDKUtils.xcframework'

end
