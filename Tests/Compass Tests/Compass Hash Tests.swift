import Compass
import Testing

@Suite
struct `Compass Hash Tests` {
    @Test
    func `cardinal directions are distinct set elements`() {
        #expect(Set(Compass.Cardinal.allCases).count == 4)
    }
}
