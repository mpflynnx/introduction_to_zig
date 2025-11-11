const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {

    // This is a string literal value
    _ = "A literal string value"; // Type is *const [22:0]u8
    // 22: is length of array, 0 is the sentinel like in C strings.
    try stdout.print("{any}\n", .{@TypeOf("A literal string value")});
    try stdout.flush();
}
