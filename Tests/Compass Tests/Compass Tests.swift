import Compass
import Testing

enum `Compass Tests` {}

extension `Compass Tests` {
    @Suite
    struct `Compass directions preserve their structure under rotations and opposition` {
        @Test
        func `rotations and opposites preserve cardinal structure`() {
            for cardinal in Compass.Cardinal.allCases {
                #expect(cardinal.opposite.opposite == cardinal)
                #expect(cardinal.clockwise.counterclockwise == cardinal)
            }
        }
    }
}
