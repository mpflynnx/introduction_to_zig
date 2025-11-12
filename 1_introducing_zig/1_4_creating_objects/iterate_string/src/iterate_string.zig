const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const string_object = "This is a string object";
    try stdout.print("Bytes that represent the string object:\n", .{});
    for (string_object) |byte| {
        try stdout.print("{X} ", .{byte});
    }
    try stdout.print("\n", .{});
    try stdout.flush();
}
