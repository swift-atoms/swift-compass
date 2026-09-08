import Compass
import Hash
import Testing

@Suite
struct `Compass Hash Tests` {

    @Test
    func `Cardinal is natively hashable through the seam`() {
        let values: Set<Compass.Cardinal> = [.north, .east, .north]

        #expect(values.count == 2)
    }

    @Test
    func `Cardinal supplies Hash's domain-typed value`() {
        func hash<T: Hash.`Protocol`>(_ value: borrowing T) -> Hash.Value {
            value.hashValue
        }

        let first: Hash.Value = hash(Compass.Cardinal.north)
        let second: Hash.Value = hash(Compass.Cardinal.north)
        #expect(first == second)
    }
}
