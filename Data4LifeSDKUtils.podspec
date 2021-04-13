Pod::Spec.new do |s|
  s.name             = "Data4LifeSDKUtils"
  s.version          = "0.5.0"
  s.summary          = "Generic utilities functions used in the D4L SDK libraries"
  s.homepage         = "https://github.com/d4l-data4life/d4l-utils-ios.git"
  s.license          = { :type => 'LICENSE', :file => "LICENSE" }
  s.author           = { "D4L data4life gGmbH" => "contact@data4life.care" }

  s.source           = { :http => 'https://github.com/d4l-data4life/d4l-utils-ios/releases/download/' + s.version.to_s + '/XCFrameworks-' + s.version.to_s + '.zip' }
  s.swift_version    = '5.3'
  s.platform         = :ios, '12.0'
  s.requires_arc     = true
  s.cocoapods_version = '>= 1.10.0'

  s.default_subspec     = 'Core'
  s.subspec 'Core' do |core|
    core.preserve_paths      = 'Data4LifeSDKUtils.xcframework', 'CryptoSwift.xcframework', 'Data4LifeSDKUtils.dSYMs/Data4LifeSDKUtils.framework.ios-arm64.dSYM', 'Data4LifeSDKUtils.dSYMs/Data4LifeSDKUtils.framework.ios-arm64_x86_64-simulator.dSYM', 'CryptoSwift.dSYMs/CryptoSwift.framework.ios-arm64.dSYM', 'CryptoSwift.dSYMs/CryptoSwift.framework.ios-arm64_x86_64-simulator.dSYM'
    core.vendored_frameworks = 'Data4LifeSDKUtils.xcframework', 'CryptoSwift.xcframework'
  end
end
