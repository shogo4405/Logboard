import PackageDescription

let package = Package(
    name: "Logboard",
    products: [
        .library(
            name: "Logboard",
            targets: ["Logboard"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Logboard",
            dependencies: []),
        .testTarget(
            name: "LogboardTests",
            dependencies: ["Logboard"])
    ]
)
