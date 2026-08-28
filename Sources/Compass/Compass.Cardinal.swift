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
    extension Compass.Cardinal: Codable {}
#endif
