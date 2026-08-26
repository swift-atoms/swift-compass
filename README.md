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

`Compass.Cardinal` conforms to `CaseIterable` and `Sendable`, is `Codable` outside Embedded, and witnesses the institute `Equation` / `Hash` / `Comparison` protocol twins alongside the stdlib `Equatable` / `Hashable` / `Comparable` conformances.

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

Import the `Compass` umbrella for the type plus every conformance, or depend on a single sub-namespace target to pay for only the conformance you need.

| Product | Target | Purpose |
|---------|--------|---------|
| `Compass Primitive` | `Sources/Compass Primitive/` | The `Compass` namespace and `Compass.Cardinal`: the four directions, `.opposite` / `.clockwise` / `.counterclockwise`, and the `==` / `<` / `hash(into:)` witnesses. Zero dependencies. |
| `Compass Equation` | `Sources/Compass Equation/` | Conforms `Compass.Cardinal` to the institute `Equation.Protocol` twin. |
| `Compass Hash` | `Sources/Compass Hash/` | Conforms `Compass.Cardinal` to the institute `Hash.Protocol` twin. |
| `Compass Comparison` | `Sources/Compass Comparison/` | Conforms `Compass.Cardinal` to the institute `Comparison.Protocol` twin, ordered by clockwise rank. |
| `Compass` | `Sources/Compass/` | Umbrella: re-exports the namespace and all three conformance modules. |
| `Compass Test Support` | `Tests/Support/` | Re-exports the umbrella for test consumers. |

Foundation-free.

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
