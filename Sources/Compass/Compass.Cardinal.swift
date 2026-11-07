extension Compass {

    public enum Cardinal: Sendable, CaseIterable {

        case north

        case east

        case south

        case west
    }
}

extension Compass.Cardinal {

    @inlinable
    public var opposite: Compass.Cardinal {
        switch self {
        case .north: .south
        case .east: .west
        case .south: .north
        case .west: .east
        }
    }

    @inlinable
    public var clockwise: Compass.Cardinal {
        switch self {
        case .north: .east
        case .east: .south
        case .south: .west
        case .west: .north
        }
    }

    @inlinable
    public var counterclockwise: Compass.Cardinal {
        switch self {
        case .north: .west
        case .west: .south
        case .south: .east
        case .east: .north
        }
    }
}

extension Compass.Cardinal {
    @usableFromInline
    var _rank: Int {
        switch self {
        case .north: 0
        case .east: 1
        case .south: 2
        case .west: 3
        }
    }

    @inlinable
    public static func == (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank == rhs._rank
    }

    @inlinable
    public static func < (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank < rhs._rank
    }

    @inlinable
    public static func <= (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank <= rhs._rank
    }

    @inlinable
    public static func > (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank > rhs._rank
    }

    @inlinable
    public static func >= (lhs: Compass.Cardinal, rhs: Compass.Cardinal) -> Bool {
        lhs._rank >= rhs._rank
    }

    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(_rank)
    }
}

#if !hasFeature(Embedded)
    extension Compass.Cardinal: Swift::Codable {}
#endif

extension Compass::Compass.Cardinal: Swift::Comparable {}

extension Compass::Compass.Cardinal: Swift::Hashable {}

#if Cyclic
    public import Cyclic
    public import Ordinal

    extension Compass.Cardinal {

        @inlinable
        public var cyclic: Cyclic.Group.Static<4>.Element {
            let rank: UInt =
                switch self {
                case .north: 0
                case .east: 1
                case .south: 2
                case .west: 3
                }

            return Cyclic.Group.Static<4>.Element(__unchecked: Ordinal(rank))
        }

        @inlinable
        public init(cyclic: Cyclic.Group.Static<4>.Element) {
            switch cyclic.position.rawValue {
            case 0: self = .north
            case 1: self = .east
            case 2: self = .south
            default: self = .west
            }
        }
    }
#endif

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
