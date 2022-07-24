package examples

import "core:testing"
@test
test_edge :: proc(t: ^testing.T){
    edge()
}

@test
test_distance :: proc(t: ^testing.T){
    distance()
}

@test
test_index :: proc(t: ^testing.T){
    index()
}

@test
test_cstringTest :: proc(t: ^testing.T){
    cstringTest()
}

@test
test_neighbors :: proc(t: ^testing.T){
    neighbors()
}

@test
test_compactCells ::proc(t: ^testing.T){
    compactCells()
}