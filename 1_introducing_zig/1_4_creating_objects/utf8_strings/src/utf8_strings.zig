const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const bytes = [_]u8{ 0x48, 0x65, 0x6C, 0x6C, 0x6F }; // UTF-8 codes for H E L L O
    try stdout.print("{s}\n", .{bytes});
    try stdout.flush();
}
