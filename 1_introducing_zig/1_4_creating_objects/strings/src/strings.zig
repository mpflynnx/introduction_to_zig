const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const string_object = "This is an example of string literal in Zig";
    try stdout.print("Number of elements in array: {d}\n", .{string_object.len});
    try stdout.flush();
}