
package h3

import c "core:c"

Index :: u64
Error :: u32

when ODIN_OS == .Darwin && ODIN_ARCH == .amd64{
	foreign import lib "_gen/libh3_osx_amd64.a"
} else when ODIN_OS == .Linux && ODIN_ARCH == .amd64 {
	foreign import lib "_gen/libh3_linux_amd64.a"
}

@(default_calling_convention="c")
foreign lib {

	latLngToCell :: proc ( g: ^LatLng, res: int, out: ^Index ) -> Error ---
	cellToLatLng :: proc ( h3: Index, g: ^LatLng ) -> Error ---
	cellToBoundary :: proc ( h3: Index, gp: ^CellBoundary ) -> Error ---
	maxGridDiskSize :: proc ( k: int, out: ^i64 ) -> Error ---
	gridDiskUnsafe :: proc ( origin: Index, k: int, out: ^Index ) -> Error ---
	gridDiskDistancesUnsafe :: proc ( origin: Index, k: int, out: ^Index, distances: ^int ) -> Error ---
	gridDiskDistancesSafe :: proc ( origin: Index, k: int, out: ^Index, distances: ^int ) -> Error ---
	gridDisksUnsafe :: proc ( h3Set: ^Index, length: int, k: int, out: ^Index ) -> Error ---
	gridDisk :: proc ( origin: Index, k: int, out: ^Index ) -> Error ---
	gridDiskDistances :: proc ( origin: Index, k: int, out: ^Index, distances: ^int ) -> Error ---
	gridRingUnsafe :: proc ( origin: Index, k: int, out: ^Index ) -> Error ---
	maxPolygonToCellsSize :: proc ( geoPolygon: ^GeoPolygon, res: int, flags: u32, out: ^i64 ) -> Error ---
	polygonToCells :: proc ( geoPolygon: ^GeoPolygon, res: int, flags: u32, out: ^Index ) -> Error ---
	cellsToLinkedMultiPolygon :: proc ( h3Set: ^Index, numHexes: int, out: ^LinkedGeoPolygon ) -> Error ---
	destroyLinkedMultiPolygon :: proc ( polygon: ^LinkedGeoPolygon ) ---
	degsToRads :: proc ( degrees: f64 ) -> f64 ---
	radsToDegs :: proc ( radians: f64 ) -> f64 ---
	distanceRads :: proc ( a: ^LatLng, b: ^LatLng ) -> f64 ---
	distanceKm :: proc ( a: ^LatLng, b: ^LatLng ) -> f64 ---
	distanceM :: proc ( a: ^LatLng, b: ^LatLng ) -> f64 ---
	getHexagonAreaAvgKm2 :: proc ( res: int, out: ^f64 ) -> Error ---
	getHexagonAreaAvgM2 :: proc ( res: int, out: ^f64 ) -> Error ---
	cellAreaRads2 :: proc ( h: Index, out: ^f64 ) -> Error ---
	cellAreaKm2 :: proc ( h: Index, out: ^f64 ) -> Error ---
	cellAreaM2 :: proc ( h: Index, out: ^f64 ) -> Error ---
	getHexagonEdgeLengthAvgKm :: proc ( res: int, out: ^f64 ) -> Error ---
	getHexagonEdgeLengthAvgM :: proc ( res: int, out: ^f64 ) -> Error ---
	exactEdgeLengthRads :: proc ( edge: Index, length: ^f64 ) -> Error ---
	exactEdgeLengthKm :: proc ( edge: Index, length: ^f64 ) -> Error ---
	exactEdgeLengthM :: proc ( edge: Index, length: ^f64 ) -> Error ---
	getNumCells :: proc ( res: int, out: ^i64 ) -> Error ---
	res0CellCount :: proc (  ) -> int ---
	getRes0Cells :: proc ( out: ^Index ) -> Error ---
	pentagonCount :: proc (  ) -> int ---
	getPentagons :: proc ( res: int, out: ^Index ) -> Error ---
	getResolution :: proc ( h: Index ) -> int ---
	getBaseCellNumber :: proc ( h: Index ) -> int ---
	stringToH3 :: proc ( str: cstring, out: ^Index ) -> Error ---
	h3ToString :: proc ( h: Index, str: []u8, sz: u64 ) -> Error ---
	isValidCell :: proc ( h: Index ) -> int ---
	cellToParent :: proc ( h: Index, parentRes: int, parent: ^Index ) -> Error ---
	cellToChildrenSize :: proc ( h: Index, childRes: int, out: ^i64 ) -> Error ---
	cellToChildren :: proc ( h: Index, childRes: int, children: ^Index ) -> Error ---
	cellToCenterChild :: proc ( h: Index, childRes: int, child: ^Index ) -> Error ---
	compactCells :: proc ( h3Set: ^Index, compactedSet: ^Index, numHexes: i64 ) -> Error ---
	uncompactCellsSize :: proc ( compactedSet: ^Index, numCompacted: i64, res: int, out: ^i64 ) -> Error ---
	uncompactCells :: proc ( compactedSet: ^Index, numCompacted: i64, outSet: ^Index, numOut: i64, res: int ) -> Error ---
	isResClassIII :: proc ( h: Index ) -> int ---
	isPentagon :: proc ( h: Index ) -> int ---
	maxFaceCount :: proc ( h3: Index, out: ^int ) -> Error ---
	getIcosahedronFaces :: proc ( h3: Index, out: ^int ) -> Error ---
	areNeighborCells :: proc ( origin: Index, destination: Index, out: ^int ) -> Error ---
	cellsToDirectedEdge :: proc ( origin: Index, destination: Index, out: ^Index ) -> Error ---
	isValidDirectedEdge :: proc ( edge: Index ) -> int ---
	getDirectedEdgeOrigin :: proc ( edge: Index, out: ^Index ) -> Error ---
	getDirectedEdgeDestination :: proc ( edge: Index, out: ^Index ) -> Error ---
	directedEdgeToCells :: proc ( edge: Index, originDestination: ^Index ) -> Error ---
	originToDirectedEdges :: proc ( origin: Index, edges: ^Index ) -> Error ---
	directedEdgeToBoundary :: proc ( edge: Index, gb: ^CellBoundary ) -> Error ---
	cellToVertex :: proc ( origin: Index, vertexNum: int, out: ^Index ) -> Error ---
	cellToVertexes :: proc ( origin: Index, vertexes: ^Index ) -> Error ---
	vertexToLatLng :: proc ( vertex: Index, point: ^LatLng ) -> Error ---
	isValidVertex :: proc ( vertex: Index ) -> int ---
	gridDistance :: proc ( origin: Index, h3: Index, distance: ^i64 ) -> Error ---
	gridPathCellsSize :: proc ( start: Index, end: Index, size: ^i64 ) -> Error ---
	gridPathCells :: proc ( start: Index, end: Index, out: ^Index ) -> Error ---
	cellToLocalIj :: proc ( origin: Index, h3: Index, mode: u32, out: ^CoordIJ ) -> Error ---
	localIjToCell :: proc ( origin: Index, ij: ^CoordIJ, mode: u32, out: ^Index ) -> Error ---

}
