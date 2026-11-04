# swift-compass

Use this package when a value is one of the four compass bearings, such as a heading on a grid or the side of a tile, and you need to turn it a quarter step or reverse it. Start from `Compass.Cardinal`. With the `Cyclic` trait a bearing converts to and from an element of the cyclic group of order 4, so you can do rotation arithmetic. With the `Facet` trait it converts to and from `Facet<2>`, a side of a rectangle. For a sense along a single axis, such as left or right, use swift-direction. For a side of a box in any number of dimensions, use swift-facet.

## Laws

- `opposite` is an involution. `clockwise` and `counterclockwise` are inverses. Applying `clockwise` twice gives `opposite`.
- Bearings are ordered clockwise starting at north: `north < east < south < west`. `allCases` lists them in that sorted order. Equality, hashing and comparison all use this ranking.
- `cyclic` maps `north` to 0 and counts clockwise, so adding one in the group is `clockwise`. `init(cyclic:)` is its inverse and accepts every group element.
- `facet` puts east-west on the primary axis and north-south on the secondary axis, with east and north positive. `init(facet:)` is its inverse and accepts every `Facet<2>`. `opposite` on a bearing is `opposite` on its facet.
