// https://pedropark99.github.io/zig-book/Chapters/03-structs.html#sec-errdefer1

const std = @import("std");

fn foo() !void {
    return error.FooError;
}

pub fn main() !void {
    var i: usize = 1;
    defer i = 2;
    errdefer std.debug.print("Value of i: {d}\n", .{i});
    // defer i = 2;
    try foo();
}
