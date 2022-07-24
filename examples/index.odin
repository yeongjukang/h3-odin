package examples
import "core:fmt"
import h3 "../"

index :: proc(){
    // Get the H3 index of some location and print it.
    location: h3.LatLng
    location.lat = h3.degsToRads(40.689167)
    location.lng = h3.degsToRads(-74.044444)
    resolution := 10
    indexed: h3.Index

    if (h3.latLngToCell(&location, resolution, &indexed) != u32(h3.error_codes.E_SUCCESS)) {
        fmt.println("Failed")
        return
    }

    fmt.printf("The index is: %x\n", indexed)

    // Get the vertices of the H3 index.
    boundary: h3.CellBoundary
    if (h3.cellToBoundary(indexed, &boundary) != u32(h3.error_codes.E_SUCCESS)) {
        fmt.println("Failed")
        return
    }
    
    // Indexes can have different number of vertices under some cases,
    // which is why boundary.numVerts is needed.
    for v := 0; v < boundary.numVerts; v+=1 {
        fmt.printf("Boundary vertex #%d: %.6f, %.6f\n",
                v,
                h3.radsToDegs(boundary.verts[v].lat),
                h3.radsToDegs(boundary.verts[v].lng))
    }

    // Get the center coordinates.
    center: h3.LatLng
    if (h3.cellToLatLng(indexed, &center) != u32(h3.error_codes.E_SUCCESS)) {
        fmt.println("Failed")
        return
    }
    
    fmt.printf("Center coordinates: %.6f, %.6f\n", h3.radsToDegs(center.lat),
           h3.radsToDegs(center.lng))
}