const std = @import("std");
const log = std.debug.warn;

const MOD_ADLER: u32 = 65521;

pub fn main() void {
    var a: u32 = 1;
    var b: u32 = 0;
    var i: u32 = 0;
    while (i < 250000000) : (i += 1) {
        a = (a + i) % MOD_ADLER;
        b = (b + a) % MOD_ADLER;
    }
    const result = b << 16 | a;

    log("|zig|adler32|{x}|N/A|\n", .{result});
}
