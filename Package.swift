// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
            url: "https://d4l-ios-artifact-repository.s3.eu-central-1.amazonaws.com/d4l-data4life/d4l-utils-ios/Data4LifeSDKUtils-xcframework-v0.7.0.zip",
            checksum: "2021-11-10 14:11:31.755 xcodebuild[96911:4065556] [MT] DVTPlugInManager: Required plug-in compatibility UUID F56A1938-53DE-493D-9D64-87EE6C415E4D for Kotlin.ideplugin (org.kotlinlang.xcode.kotlin) not present
2021-11-10 14:11:32.336 xcodebuild[96912:4065692] [MT] DVTPlugInManager: Required plug-in compatibility UUID F56A1938-53DE-493D-9D64-87EE6C415E4D for Kotlin.ideplugin (org.kotlinlang.xcode.kotlin) not present
91a2d43b886a827b6f1df6775196bef1a394a0a3f2ed1de412338b0604633495"
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
