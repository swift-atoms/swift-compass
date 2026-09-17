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

        .library(name: "Compass Foundation Integration", targets: ["Compass Foundation Integration"]),
        .library(name: "Compass Test Support", targets: ["Compass Test Support"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Compass",
            dependencies: [],
            path: "Sources/Compass"
        ),
        
        .target(
            name: "Compass Foundation Integration",
            dependencies: [
                .target(name: "Compass"),
            ],
            path: "Sources/Compass Foundation Integration"
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
                .target(name: "Compass Foundation Integration"),
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
