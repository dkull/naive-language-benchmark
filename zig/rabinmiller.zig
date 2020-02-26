const std = @import("std");
const log = std.debug.warn;

fn powmod(_base: u32, _pow: u32, mod: u32) u32 {
    var result: u64 = 1;
    var base: u64 = _base;
    var pow: u64 = _pow;
    while (pow > 0) {
        if (pow & 1 == 1) {
            result = (result * base) % mod;
        }
        base = (base * base) % mod;
        pow >>= 1;
    }
    return @intCast(u32, result);
}

fn witness(n: u32, _s: u32, d: u32, a: u32) bool {
    var x: u64 = powmod(a, d, n);
    var y: u64 = 0;

    var s = _s;
    while (s > 0) {
        // powmod
        y = (x * x) % n;
        if (y == 1 and x != 1 and x != n - 1) {
            return false;
        }
        x = y;
        s -= 1;
    }
    if (y != 1) {
        return false;
    }
    return true;
}

fn is_rabin_miller_prime(n: u32, witnesses: [7]u8) bool {
    var d: u32 = n / 2;
    var s: u32 = 1;

    while (!(d & 1 == 1)) {
        d /= 2;
        s += 1;
    }

    for (witnesses) |row| {
        if (!witness(n, s, d, row)) {
            return false;
        }
    }

    return true;
}

pub fn main() void {
    const witnesses = [_]u8{ 2, 3, 5, 7, 11, 13, 17 };
    var prime_count: u32 = 0;
    var i: u32 = 3;
    while (i < 2500000) : (i += 2) {
        if (is_rabin_miller_prime(i, witnesses)) {
            prime_count += 1;
        }
    }
    log("|zig|rabinmiller|{}|{}|\n", .{ prime_count, "N/A" });
}
