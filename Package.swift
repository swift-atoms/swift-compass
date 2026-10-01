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
    traits: [
        .trait(name: "Cyclic", description: "Cyclic integration"),
        .trait(name: "Facet", description: "Facet integration"),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-atoms/swift-ordinal.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-cyclic.git", branch: "main"),
        .package(url: "https://github.com/swift-atoms/swift-facet.git", branch: "main"),


    ],
    targets: [
        .target(
            name: "Compass",
            dependencies: [
                .product(name: "Ordinal", package: "swift-ordinal", condition: .when(traits: ["Cyclic"])),
                .product(name: "Cyclic", package: "swift-cyclic", condition: .when(traits: ["Cyclic"])),
                .product(name: "Facet", package: "swift-facet", condition: .when(traits: ["Facet"])),

            ],
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
        .testTarget(
            name: "Compass Facet Tests",
            dependencies: [
                .target(name: "Compass"),
                .product(name: "Facet", package: "swift-facet", condition: .when(traits: ["Facet"])),
            ],
            path: "Tests/Compass Facet Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
