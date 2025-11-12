const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const string_object = "Ⱥ";
    _ = try stdout.write("Bytes that represents the string object: ");
    for (string_object) |char| {
        try stdout.print("{X} ", .{char}); // Bytes that represents the string object: C8BA
    }

    try stdout.flush();
}
