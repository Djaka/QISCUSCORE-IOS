// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "QiscusCore",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "QiscusCore",
            targets: ["QiscusCore"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        
        // SwiftyJSON untuk JSON parsing (REQUIRED - digunakan di banyak model)
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.2"),
        
        // QiscusRealtime untuk real-time messaging (REQUIRED)
        .package(path: "../QiscusRealtime-iOS"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "QiscusCore",
            dependencies: [
                "SwiftyJSON",
                .product(name: "QiscusRealtime", package: "QiscusRealtime-iOS")
            ],
            path: "Source/QiscusCore",
            exclude: [],
            resources: [
                .process("Resources"),
                .copy("Database/QiscusDatabase/Qiscus.xcdatamodeld")
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE"),
                .define("SPM_BUILD")
            ],
            linkerSettings: [
                // System frameworks yang diperlukan
                .linkedFramework("SystemConfiguration"), // untuk QiscusReachability
                .linkedFramework("CoreData"),            // untuk database
                .linkedFramework("Security"),            // untuk keychain
                .linkedFramework("CFNetwork"),           // untuk networking
                .linkedFramework("MobileCoreServices"),  // untuk file handling
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation")
            ]
        ),
        .testTarget(
            name: "QiscusCoreTests",
            dependencies: ["QiscusCore"],
            path: "QiscusCoreTests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)
