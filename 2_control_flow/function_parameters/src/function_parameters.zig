const std = @import("std");

// function parameters are immutable in Zig
// compile error: trying to change the value of a immutable
// fn add2(x: u32) u32 {
//     x = x + 2;
//     return x;
// }

// Changes value of your function argument directly
// Usually zig will create copies of primitive type arguments
fn add2(x: *u32) void {
    const d: u32 = 2;
    x.* = x.* + d;
}

pub fn main() !void {
    var x: u32 = 4;
    add2(&x);
    std.debug.print("Result: {d}\n", .{x});
}
