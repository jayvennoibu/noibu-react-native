// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Noibu",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Noibu",
            targets: ["Noibu"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "Noibu",
            path: "Noibu.xcframework"
        )
    ]
) 