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
        .package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.0.0"),
        .package(url: "https://github.com/ProcedureKit/ProcedureKit.git", .branch("master"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SonarrAPI",
            dependencies: ["Alamofire", "ProcedureKit"],
            exclude:["TestingProcedureKit"]),
        .testTarget(
            name: "SonarrAPITests",
            dependencies: ["SonarrAPI"]),
    ]
)
