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

        .library(name: "Compass", targets: ["Compass"]),

        .library(name: "Compass Hash", targets: ["Compass Hash"]),
        .library(name: "Compass Comparison", targets: ["Compass Comparison"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-comparison.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(name: "Compass", dependencies: []),

        .target(
            name: "Compass Hash",
            dependencies: [
                .target(name: "Compass"),
                .product(name: "Hash Protocol", package: "swift-hash"),
            ]
        ),
        .target(
            name: "Compass Comparison",
            dependencies: [
                .target(name: "Compass"),
                .product(name: "Comparison Protocol", package: "swift-comparison"),
            ]
        ),
        .testTarget(
            name: "Compass Tests",
            dependencies: [
                .target(name: "Compass"),
            ]
        ),
        .testTarget(
            name: "Compass Hash Tests",
            dependencies: [
                .target(name: "Compass"),
                .target(name: "Compass Hash"),
            ]
        ),
        .testTarget(
            name: "Compass Comparison Tests",
            dependencies: [
                .target(name: "Compass"),
                .target(name: "Compass Comparison"),
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
