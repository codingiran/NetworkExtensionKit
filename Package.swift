// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkExtensionKit",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkExtensionKit",
            targets: ["NetworkExtensionKit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NetworkExtensionKit",
            dependencies: [
                "NetworkExtensionKitObjC",
            ],
            path: "Sources/NetworkExtensionKit",
            resources: [.copy("Resources/PrivacyInfo.xcprivacy")],
            linkerSettings: [
                .linkedFramework("NetworkExtension", .when(platforms: [.iOS, .macOS, .tvOS])),
            ]),
        .target(
            name: "NetworkExtensionKitObjC",
            path: "Sources/NetworkExtensionKitObjC",
            publicHeadersPath: "include",
            linkerSettings: [
                .linkedFramework("NetworkExtension", .when(platforms: [.iOS, .macOS, .tvOS])),
            ]),
        .testTarget(
            name: "NetworkExtensionKitTests",
            dependencies: ["NetworkExtensionKit"]),
    ])
