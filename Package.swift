// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Cre8WithVS_Package",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Cre8WithVS_Package",
            targets: ["Cre8WithVS_Package"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Cre8WithVS_Package"),
        .testTarget(
            name: "Cre8WithVS_PackageTests",
            dependencies: ["Cre8WithVS_Package"]
        ),
    ]
)
