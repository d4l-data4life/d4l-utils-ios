// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data4LifeSDKUtils",
    platforms: [.iOS(.v12), .macOS(.v10_12)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Data4LifeSDKUtils",
            targets: ["Data4LifeSDKUtils", "CryptoSwift"]),
    ],
    targets: [
        .binaryTarget(
            name: "CryptoSwift",
            path: "xcframeworks/CryptoSwift.xcframework"
        ),
        .binaryTarget(
            name: "Data4LifeSDKUtils",
            path: "xcframeworks/Data4LifeSDKUtils.xcframework"
        ),
        .testTarget(
            name: "Data4LifeSDKUtilsTests",
            dependencies: ["Data4LifeSDKUtils"],
            path: "Tests",
            exclude: ["SDKUtilsTests/Info.plist"],
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
