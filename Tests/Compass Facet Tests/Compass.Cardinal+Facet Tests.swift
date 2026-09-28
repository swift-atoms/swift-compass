#if Facet
import Compass
import Testing

@Suite
struct `Compass.Cardinal Facet projection` {
    @Suite struct Unit {}


}

extension `Compass.Cardinal Facet projection`.Unit {
    @Test
    func `facet maps each bearing to its box facet`() {
        #expect(Compass.Cardinal.north.facet == Facet<2>(axis: .secondary, direction: .positive))
        #expect(Compass.Cardinal.east.facet == Facet<2>(axis: .primary, direction: .positive))
        #expect(Compass.Cardinal.south.facet == Facet<2>(axis: .secondary, direction: .negative))
        #expect(Compass.Cardinal.west.facet == Facet<2>(axis: .primary, direction: .negative))
    }

    @Test
    func `projection round-trips`() {
        for cardinal in Compass.Cardinal.allCases {
            #expect(Compass.Cardinal(facet: cardinal.facet) == cardinal)
        }
    }

    @Test
    func `opposite cardinal is opposite facet`() {
        for cardinal in Compass.Cardinal.allCases {
            #expect(cardinal.opposite.facet == cardinal.facet.opposite)
        }
    }
}
#endif
