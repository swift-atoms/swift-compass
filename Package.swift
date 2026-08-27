// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-compass",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Compass",
            targets: ["Compass"]
        ),
        .library(
            name: "Compass Standard Library Integration",
            targets: ["Compass Standard Library Integration"]
        ),
        .library(
            name: "Compass Apple Foundation Integration",
            targets: ["Compass Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Compass",
            dependencies: []
        ),
        .target(
            name: "Compass Standard Library Integration",
            dependencies: ["Compass"]
        ),
        .target(
            name: "Compass Apple Foundation Integration",
            dependencies: [
                "Compass",
                "Compass Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Compass Tests",
            dependencies: ["Compass"]
        ),
        .testTarget(
            name: "Compass Standard Library Integration Tests",
            dependencies: [
                "Compass",
                "Compass Standard Library Integration",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
