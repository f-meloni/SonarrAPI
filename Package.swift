// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SonarrAPI",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SonarrAPI",
            targets: ["SonarrAPI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: Version(4, 0, 0)),
        .package(url: "https://github.com/f-meloni/ProcedureKit.git", .branch("development")),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "1.2.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "7.0.2")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SonarrAPI",
            dependencies: ["Alamofire", "ProcedureKit"]),
        .testTarget(
            name: "SonarrAPITests",
            dependencies: ["SonarrAPI", "Quick", "Nimble"]),
    ]
)
