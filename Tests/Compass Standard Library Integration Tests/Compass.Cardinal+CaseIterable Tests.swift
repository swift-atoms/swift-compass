import Compass
import Compass_Standard_Library_Integration
import Testing

@Suite
struct `Compass.Cardinal - CaseIterable` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Compass.Cardinal - CaseIterable`.Unit {
    @Test
    func `allCases has four directions in clockwise order`() {
        #expect(Compass.Cardinal.allCases == [.north, .east, .south, .west])
    }
}
