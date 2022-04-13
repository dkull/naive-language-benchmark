const std = @import("std");
const print = std.debug.print;

pub const RC4 = struct {
    s: [256]u8,
    i: u64,
    j: u64,

    pub fn new(key: []const u8) RC4 {
        const state = RC4.key_schedule(key);
        return RC4{ .s = state, .i = 0, .j = 0 };
    }

    fn key_schedule(key: []const u8) [256]u8 {
        var data: [256]u8 = undefined;
        for (data) |*ref, i| {
            ref.* = @intCast(u8, i);
        }

        var j: u32 = 0;
        for (data) |_, i| {
            j = @intCast(u32, j + data[i] + key[i % key.len]) % 256;
            const a = data[i];
            const b = data[j];
            data[j] = a;
            data[i] = b;
        }
        return data;
    }

    fn get_byte(self: *RC4) u8 {
        self.i = (self.i + 1) % 256;
        self.j = (self.j + self.s[self.i]) % 256;

        const a = self.s[self.i];
        const b = self.s[self.j];
        self.s[self.j] = a;
        self.s[self.i] = b;

        const idx = (@intCast(u32, self.s[self.i]) + self.s[self.j]) % 256;
        return self.s[idx];
    }
};

export fn bench() void {
    var start = std.time.milliTimestamp();

    const key = "Keyfobsrulethebestofall"[0..];
    var rc4 = RC4.new(key);
    var sum: u64 = 0;
    var i: u32 = 0;
    while (i < 250000000) : (i += 1) {
        sum += rc4.get_byte();
    }

    const end = std.time.milliTimestamp();
    const delta = end - start;
    print("|zig|rc4|{}|{}|\n", .{ sum, delta });
}

export fn prod(a: i64, b: i64) i64 {
    return a * b;
}

pub fn main() void {
    bench();
}
