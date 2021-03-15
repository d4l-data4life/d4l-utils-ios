// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data4LifeSDKUtils",
    platforms: [.iOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Data4LifeSDKUtils",
            targets: ["Data4LifeSDKUtils"]),
        .library(
            name: "CryptoSwift",
            targets: ["CryptoSwift"]),
    ],
    targets: [
        .binaryTarget(
          name: "CryptoSwift",
          url: "https://github.com/d4l-data4life/d4l-utils-ios/releases/download/0.4.0/CryptoSwift-xcframework-0.4.0.zip",
          checksum: "8e56c17c8b627e91478f347a11b6e0f9ec0fb8f590dd25034117d09d8c52af63"
        ),
        .binaryTarget(
            name: "Data4LifeSDKUtils",
            url: "https://github.com/d4l-data4life/d4l-utils-ios/releases/download/0.4.0/Data4LifeSDKUtils-xcframework-0.4.0.zip",
            checksum: "5d5a1ce6a8bfc39549d682ec48ceca0ac5d7c2816ad6656da238110ef28c679c"
        ),
        .testTarget(
            name: "Data4LifeSDKUtilsTests",
            dependencies: ["Data4LifeSDKUtils"],
            path: "Tests",
            exclude: [
                "SDKUtilsTests/Info.plist",
                "build",
                "fastlane",
                "vendor",
                "Gemfile",
                "Gemfile.lock"
            ],
            resources: [
                .copy("SDKUtilsTests/Resources/Data Samples/sample-jfif.jpg"),
                .copy("SDKUtilsTests/Resources/Data Samples/sample.dcm"),
                .copy("SDKUtilsTests/Resources/Data Samples/sample.jpg"),
                .copy("SDKUtilsTests/Resources/Data Samples/sample.pdf"),
                .copy("SDKUtilsTests/Resources/Data Samples/sample.png"),
                .copy("SDKUtilsTests/Resources/Data Samples/sample.tiff"),
            ]),

    ]
)
