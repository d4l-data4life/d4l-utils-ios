# d4l-util-ios
Utilities library for iOS SDK projects

[![CocoaPods Compatible](https://img.shields.io/badge/pod-v0.6.0-blue.svg)](https://github.com/CocoaPods/CocoaPods)
[![Swift Package Manager compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg?style=flat&colorA=28a745&&colorB=4E4E4E)](https://github.com/apple/swift-package-manager)
[![License](https://img.shields.io/badge/license-PRIVATE-blue.svg)](https://github.com/d4l-data4life/d4l-utils-ios/blob/main/LICENSE)

## Usage
### Requirements
* Xcode 12.4+
* iOS 13.0+
* Swift 5.3+

## Management
SDK is handled by [Fastlane](https://fastlane.tools/) and all of the available functions are available in the [README](fastlane/README.md).

## Installation

#### CocoaPods

To install with [CocoaPods](https://cocoapods.org/) add the following line to the podfile.

```ruby
pod 'Data4LifeSDKUtils', '~> 0.6.0'
```

#### Swift Package Manager

To install with [Swift Package Manager](https://swift.org/package-manager/) add this package as a dependency in `Package.swift`:

```swift
.package(url: "https://github.com/d4l-data4life/d4l-utils-ios.git", .upToNextMinor(from: "0.5.0"))
```

## Building

### Install Fastlane and other dependencies using Bundler

```sh
bundle install
```
*Note*: Check [official page](https://bundler.io/) for info on how to install Bundler.

#### Build framework
*Note*: Use fastlane to build the utils xcframework.
```sh
fastlane ios build_xcframework
```
