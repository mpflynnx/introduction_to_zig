const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const simple_array = [_]i32{ 0, 1, 2, 3 };
    const string_object: []const u8 = "A string object";

    try stdout.print("Type 1: {}\n", .{@TypeOf(simple_array)}); // Type 1: [4]i32
    try stdout.print("Type 2: {}\n", .{@TypeOf("A string literal")}); // Type 2: *const [16:0]u8
    try stdout.print("Type 3: {}\n", .{@TypeOf(&simple_array)}); // Type 3: *const [4]i32
    try stdout.print("Type 4: {}\n", .{@TypeOf(string_object)}); // Type 4: []const u8
    try stdout.flush();
}
