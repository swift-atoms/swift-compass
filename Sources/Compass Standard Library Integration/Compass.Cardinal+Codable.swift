import Compass

#if !hasFeature(Embedded)
    extension Compass.Cardinal: Codable {

        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            let value = try container.decode(String.self)
            switch value {
            case "north": self = .north
            case "east": self = .east
            case "south": self = .south
            case "west": self = .west
            default:
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Unknown Compass.Cardinal value: \(value)"
                )
            }
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .north: try container.encode("north")
            case .east: try container.encode("east")
            case .south: try container.encode("south")
            case .west: try container.encode("west")
            }
        }
    }
#endif
