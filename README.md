# hc-sdk-util-ios
Utilities library for iOS SDK projects

(https://codecov.io/gh/gesundheitscloud/hc-sdk-util-ios) [![CocoaPods Compatible](https://img.shields.io/badge/pod-v0.2.3-blue.svg)](https://github.com/CocoaPods/CocoaPods) [![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Usage
### Requirements
* Xcode 12.0+
* iOS 12.0+
* Swift 5.3+

## Management
SDK is handled by [Fastlane](https://fastlane.tools/) and all of the available functions are available in the [README](fastlane/README.md).

### Install Fastlane and other dependencies using Bundler

```sh
bundle install
```
*Note*: Check [official page](https://bundler.io/) for info on how to install Bundler.

#### Install Carthage

```sh
brew install carthage
```
*Note*: For other installation methods check [README](https://github.com/Carthage/Carthage#installing-carthage).

#### Build frameworks
*Note*: Since from XCode 12 Carthage packaging does not work anymore, please use the script.
```sh
./wcarthage.sh bootstrap --use-ssh --platform iOS
```
