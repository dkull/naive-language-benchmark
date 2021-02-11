import strutils

proc main() =
    const mod_adler: int32 = 65521
    var a: int32 = 1
    var b: int32 = 0
    for i in 0i32..<250000000:
        a = (a + i) %% mod_adler
        b = (b + a) %% mod_adler
    let result = uint32(b) * uint32(65536) + uint32(a)
    echo "|nim|adler32|", result.toHex, "|N/A|"

when isMainModule:
    main()

