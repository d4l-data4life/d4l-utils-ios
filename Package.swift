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
          url: "https://github.com/d4l-data4life/d4l-utils-ios/releases/download/0.4.0/Data4LifeSDKUtils-xcframeworks-0.4.0.zip",
          checksum: "5ae14a7f2ea9257a3cf64d93c155dd1abc91fce84337156b082bf2f69bd0d6ab"
        ),
        .binaryTarget(
            name: "Data4LifeSDKUtils",
            url: "https://github.com/d4l-data4life/d4l-utils-ios/releases/download/0.4.0/Data4LifeSDKUtils-xcframeworks-0.4.0.zip",
            checksum: "5ae14a7f2ea9257a3cf64d93c155dd1abc91fce84337156b082bf2f69bd0d6ab"
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
