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
        .library(name: "Compass Standard Library Integration", targets: ["Compass Standard Library Integration"]),
        .library(name: "Compass Foundation Library Integration", targets: ["Compass Foundation Library Integration"]),
        .library(name: "Compass Test Support", targets: ["Compass Test Support"]),
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
        .target(
            name: "Compass",
            dependencies: [
                .product(name: "Hash", package: "swift-hash"),
                .product(name: "Comparison", package: "swift-comparison"),
            ],
            path: "Sources/Compass"
        ),
        .target(
            name: "Compass Standard Library Integration",
            dependencies: [
                .target(name: "Compass"),
            ],
            path: "Sources/Compass Standard Library Integration"
        ),
        .target(
            name: "Compass Foundation Library Integration",
            dependencies: [
                .target(name: "Compass"),
                .target(name: "Compass Standard Library Integration"),
            ],
            path: "Sources/Compass Foundation Library Integration"
        ),
        .target(
            name: "Compass Test Support",
            dependencies: [
                .target(name: "Compass"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Compass Tests",
            dependencies: [
                .target(name: "Compass"),
                .target(name: "Compass Test Support"),
                .target(name: "Compass Standard Library Integration"),
                .target(name: "Compass Foundation Library Integration"),
            ],
            path: "Tests/Compass Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
