import Compass
import Testing

@Suite
struct `Compass.Cardinal - Comparison` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Compass.Cardinal - Comparison`.Unit {
    @Test
    func `Compass Cardinal satisfies Comparison Protocol`() {
        func acceptsComparisonProtocol<T: Comparison.`Protocol`>(_ value: T) -> T {
            value
        }

        let direction = Compass.Cardinal.north
        #expect(acceptsComparisonProtocol(direction) == direction)
    }

    @Test
    func `Comparison orders clockwise`() {
        #expect(Compass.Cardinal.north < .east)
        #expect(Compass.Cardinal.east < .south)
        #expect(
            [Compass.Cardinal.west, .north, .south, .east].sorted() == [
                .north, .east, .south, .west,
            ]
        )
    }

    @Test
    func `Comparison reports clockwise ordering`() {
        #expect(Comparison(Compass.Cardinal.north, .east) == .less)
        #expect(Comparison(Compass.Cardinal.south, .south) == .equal)
        #expect(Comparison(Compass.Cardinal.west, .east) == .greater)
    }
}
