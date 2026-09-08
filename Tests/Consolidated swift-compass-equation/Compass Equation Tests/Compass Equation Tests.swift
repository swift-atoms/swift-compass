import Compass
import Equation
import Testing

@Suite
struct `Compass Equation Tests` {
    @Test
    func `Compass Cardinal satisfies Equation Protocol`() {
        func acceptsEquationProtocol<T: Equation.`Protocol`>(_ value: T) -> T {
            value
        }

        let direction = Compass.Cardinal.north
        #expect(acceptsEquationProtocol(direction) == direction)
    }

    @Test
    func `Equal directions compare equal`() {
        #expect(Compass.Cardinal.north == .north)
    }

    @Test
    func `Different directions compare unequal`() {
        #expect(Compass.Cardinal.north != .south)
    }
}
