// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Logboard",
    products: [
        .library(name: "Logboard", targets: ["Logboard"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "Logboard", dependencies: []),
        .testTarget(name: "LogboardTests", dependencies: ["Logboard"])
    ]
)
