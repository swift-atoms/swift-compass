import Compass
import Testing

@Suite
struct `Compass.Cardinal - Semantics` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Compass.Cardinal - Semantics`.Unit {
    @Test
    func `opposite swaps along each axis`() {
        #expect(Compass.Cardinal.north.opposite == .south)
        #expect(Compass.Cardinal.south.opposite == .north)
        #expect(Compass.Cardinal.east.opposite == .west)
        #expect(Compass.Cardinal.west.opposite == .east)
    }

    @Test
    func `clockwise cycles north to east to south to west`() {
        #expect(Compass.Cardinal.north.clockwise == .east)
        #expect(Compass.Cardinal.east.clockwise == .south)
        #expect(Compass.Cardinal.south.clockwise == .west)
        #expect(Compass.Cardinal.west.clockwise == .north)
    }

    @Test
    func `counterclockwise inverts clockwise`() {
        for c in [Compass.Cardinal.north, .east, .south, .west] {
            #expect(c.clockwise.counterclockwise == c)
        }
    }

    @Test
    func `opposite is involution`() {
        for c in [Compass.Cardinal.north, .east, .south, .west] {
            #expect(c.opposite.opposite == c)
        }
    }
}

@Suite
struct `Compass.Cardinal - Conformances` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Compass.Cardinal - Conformances`.Unit {
    @Test
    func `Hashable distinguishes the four directions`() {
        let set: Set<Compass.Cardinal> = [.north, .east, .south, .west, .north]
        #expect(set.count == 4)
    }

    @Test
    func `Ordering operators order clockwise`() {
        #expect(Compass.Cardinal.north < .east)
        #expect(Compass.Cardinal.east < .south)
    }
}
