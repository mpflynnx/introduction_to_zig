const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {

    // A string value being interpreted as a slice
    const str: []const u8 = "A string value";

    try stdout.print("{any}\n", .{@TypeOf(str)}); // []const u8
    try stdout.flush();
}
