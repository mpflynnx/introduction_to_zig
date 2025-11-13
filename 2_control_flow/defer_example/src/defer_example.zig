// https://pedropark99.github.io/zig-book/Chapters/03-structs.html#sec-defer

const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

fn foo() !void {
    defer std.debug.print("Exiting function foo() ...\n", .{});
    try stdout.print("Adding some numbers ...\n", .{});
    const x = 2 + 2;
    _ = x;
    try stdout.print("Multiplying ...\n", .{});
    const y = 2 * 8;
    _ = y;
    try stdout.flush();
}

pub fn main() !void {
    try foo();
}
