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

        .library(name: "Compass Primitive", targets: ["Compass Primitive"]),

        .library(name: "Compass Equation", targets: ["Compass Equation"]),
        .library(name: "Compass Hash", targets: ["Compass Hash"]),
        .library(name: "Compass Comparison", targets: ["Compass Comparison"]),

        .library(name: "Compass", targets: ["Compass"]),

        .library(
            name: "Compass Test Support",
            targets: ["Compass Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-equation.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-comparison.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(name: "Compass Primitive", dependencies: []),

        .target(
            name: "Compass Equation",
            dependencies: [
                "Compass Primitive",
                .product(name: "Equation", package: "swift-equation"),
            ]
        ),
        .target(
            name: "Compass Hash",
            dependencies: [
                "Compass Primitive",
                .product(name: "Hash", package: "swift-hash"),
            ]
        ),
        .target(
            name: "Compass Comparison",
            dependencies: [
                "Compass Primitive",
                .product(name: "Comparison", package: "swift-comparison"),
            ]
        ),

        .target(
            name: "Compass",
            dependencies: [
                "Compass Primitive",
                "Compass Equation",
                "Compass Hash",
                "Compass Comparison",
            ]
        ),

        .target(
            name: "Compass Test Support",
            dependencies: [
                "Compass"
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "Compass Tests",
            dependencies: [
                "Compass",
                "Compass Test Support",
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
