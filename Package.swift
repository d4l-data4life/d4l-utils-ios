// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "0.6.0"
let frameworkUrl = "https://github.com/d4l-data4life/d4l-utils-ios/releases/download/\(version)/Data4LifeSDKUtils-xcframework-\(version).zip"

let package = Package(
    name: "Data4LifeSDKUtils",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Data4LifeSDKUtils",
            targets: ["Data4LifeSDKUtils"])
    ],
    targets: [
        .binaryTarget(
            name: "Data4LifeSDKUtils",
            url: frameworkUrl,
            checksum: "e4951af015f653f54d66654158765197a729249e75aa6f238397b23efa3213aa"
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
