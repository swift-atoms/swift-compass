# Compass

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Cardinal compass directions for Swift — `Compass.Cardinal` (north, east, south, west) in clockwise canonical order, with rotation, opposites, and ordering, and zero platform dependencies.

---

## Quick Start

`Compass.Cardinal` is the four cardinal directions as a named view over the points of the compass: a payload-less enum whose canonical case order is the clockwise bearing north → east → south → west. It carries the directional vocabulary — turning, reversing, enumerating, ordering — without pulling in any geometry or platform machinery.

```swift
import Compass

let heading = Compass.Cardinal.north

heading.opposite          // .south
heading.clockwise         // .east
heading.counterclockwise  // .west

// Turn right (clockwise) three times, starting from north.
var bearing = Compass.Cardinal.north
for _ in 0..<3 { bearing = bearing.clockwise }
print(bearing)            // west
```

`allCases` is the clockwise sequence, and ordering follows the same clockwise rank — so directions sort and hash by bearing:

```swift
import Compass

Array(Compass.Cardinal.allCases)            // [.north, .east, .south, .west]

[Compass.Cardinal.west, .south, .north, .east].sorted()
// [.north, .east, .south, .west]

let visited: Set<Compass.Cardinal> = [.north, .east, .north]
visited.count                               // 2
```

`Compass.Cardinal` is `Sendable`, conforms to `CaseIterable` and (outside Embedded) `Codable` via the `Compass Standard Library Integration` product, and witnesses the institute `Equation` / `Hash` / `Comparison` protocol twins through the separate `swift-compass-equation` / `swift-compass-hash` / `swift-compass-comparison` packages.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-molecules/swift-compass.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Compass", package: "swift-compass"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

| Product | Target | Purpose |
|---------|--------|---------|
| `Compass` | `Sources/Compass/` | The `Compass` namespace and `Compass.Cardinal`: the four directions, `.opposite` / `.clockwise` / `.counterclockwise`, and the `==` / `<` / `hash(into:)` witnesses. Zero dependencies. |
| `Compass Standard Library Integration` | `Sources/Compass Standard Library Integration/` | Swift standard library conformances: `CaseIterable` and (outside Embedded) `Codable`. |
| `Compass Apple Foundation Integration` | `Sources/Compass Apple Foundation Integration/` | The only module allowed to import Foundation. Currently a seed. |

Institute protocol integrations live in their own packages: `swift-compass-equation`, `swift-compass-hash`, `swift-compass-comparison`.

Foundation-free at the core.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
