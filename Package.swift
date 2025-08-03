// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription
let package = Package(
    name: "Cre8WithVS_Package",
    platforms: [
            .iOS(.v16), // 👈 Change to your minimum supported iOS version
            //.macOS(.v12),
            //.tvOS(.v13),
            //.watchOS(.v6)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Cre8WithVS_Package",
            targets: ["Cre8WithVS_Package"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/Program8/SPiOSCommonP8", branch: "main"),
        .package(path: "../SPiOSCommonP8")
        
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Cre8WithVS_Package",
            dependencies: [
                .product(name: "SPiOSCommonP8", package: "SPiOSCommonP8")
            ]),
        .testTarget(
            name: "Cre8WithVS_PackageTests",
            dependencies: ["Cre8WithVS_Package"]
        ),
    ]
)
