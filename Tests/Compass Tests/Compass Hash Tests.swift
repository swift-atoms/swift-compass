import Compass
import Testing

@Suite
struct `Compass directions remain distinct in sets` {
    @Test
    func `cardinal directions are distinct set elements`() {
        #expect(Set(Compass.Cardinal.allCases).count == 4)
    }
}
