import Compass_Comparison
import Testing

@Suite
struct `Compass Comparison Tests` {
    @Test
    func `cardinal directions retain compass ordering`() {
        #expect(Compass.Cardinal.allCases.sorted() == Compass.Cardinal.allCases)
    }
}
