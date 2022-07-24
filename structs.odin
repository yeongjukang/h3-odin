package h3

// latitude/longitude in radians
LatLng :: struct {
    lat: f64,
    lng: f64,
}

// cell boundary in latitude/longitude
CellBoundary :: struct {
    numVerts: int,
    verts: [MAX_CELL_BNDRY_VERTS]LatLng,
}

// similar to CellBoundary, but requires more alloc work
GeoLoop :: struct {
    numVerts: int,
    verts: ^LatLng,
}

// Simplified core of GeoJSON Polygon coordinates definition
GeoPolygon :: struct {
    geoLoop: GeoLoop,
    numHoles: int,
    holes: ^GeoLoop,
}

// Simplified core of GeoJSON MultiPolygon coordinates definition
GeoMultiPolygon :: struct {
    numPolygons: int,
    polygons: ^GeoPolygon,
}

// A coordinate node in a linked geo structure, part of a linked list 
LinkedLatLng :: struct{
    vertex: LatLng,
    next: ^LinkedLatLng,
}

// A loop node in a linked geo structure, part of a linked list
LinkedGeoLoop :: struct {
    first: ^LinkedLatLng,
    last: ^LinkedLatLng,
    next: ^LinkedGeoLoop,
}

// A polygon node in a linked geo structure, part of a linked list.
LinkedGeoPolygon :: struct{
    first: ^LinkedGeoLoop,
    last: ^LinkedGeoLoop,
    next: ^LinkedGeoPolygon,
}
 
// IJ hexagon coordinates, Each axis is spaced 120 degrees apart.
CoordIJ :: struct {
    i: int,
    j: int,
}
 