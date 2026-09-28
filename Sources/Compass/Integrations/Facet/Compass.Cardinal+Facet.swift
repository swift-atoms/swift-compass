#if Facet
public import Facet

extension Compass.Cardinal {

    @inlinable
    public var facet: Facet<2> {
        switch self {
        case .north: Facet(axis: .secondary, direction: .positive)
        case .east: Facet(axis: .primary, direction: .positive)
        case .south: Facet(axis: .secondary, direction: .negative)
        case .west: Facet(axis: .primary, direction: .negative)
        }
    }

    @inlinable
    public init(facet: Facet<2>) {
        switch (facet.axis.underlying, facet.direction) {
        case (1, .positive): self = .north
        case (0, .positive): self = .east
        case (1, .negative): self = .south
        default: self = .west
        }
    }
}
#endif
