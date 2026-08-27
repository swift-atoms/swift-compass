import Compass

#if !hasFeature(Embedded)
    extension Compass.Cardinal: Codable {}
#endif
