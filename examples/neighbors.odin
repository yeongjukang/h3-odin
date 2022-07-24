package examples

import "core:fmt"
import "core:mem"
import h3 "../"

neighbors :: proc() {
    indexed: h3.Index = 0x8a2a1072b59ffff
    // Distance away from the origin to find:
    k := 2

    maxNeighboring: i64
    h3.maxGridDiskSize(k, &maxNeighboring)
    neighboring := make([]u64, int(maxNeighboring))
    defer delete(neighboring)
    h3.gridDisk(indexed, k, &neighboring[0])

    fmt.printf("Neighbors:\n")
    for i := 0; i < int(maxNeighboring); i+=1 {
        if neighboring[i] != 0 {
            fmt.printf("%x\n", neighboring[i])
        }
    }
}