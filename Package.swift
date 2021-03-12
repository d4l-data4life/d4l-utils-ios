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
          checksum: "068b3a650c09ebf71cc1f7a2dff6a8f5d3d683cd59a355edc1ec0a3843c082fc"
        ),
        .binaryTarget(
            name: "Data4LifeSDKUtils",
            url: "https://github.com/d4l-data4life/d4l-utils-ios/releases/download/0.4.0/Data4LifeSDKUtils-xcframework-0.4.0.zip",
            checksum: "ccd9a642b4103819ba7663650655429ff3438671b4c0d9ee7a8b0c3e25d83ea0"
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
