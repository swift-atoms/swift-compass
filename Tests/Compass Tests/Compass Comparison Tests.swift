import Compass
import Testing

enum `Compass Comparison Tests` {}

extension `Compass Comparison Tests` {
    @Suite
    struct `Compass directions compare according to compass order` {
        @Test
        func `cardinal directions retain compass ordering`() {
            #expect(Compass.Cardinal.allCases.sorted() == Compass.Cardinal.allCases)
        }
    }
}
