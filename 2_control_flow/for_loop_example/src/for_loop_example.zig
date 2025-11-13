const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    // https://pedropark99.github.io/zig-book/Chapters/03-structs.html#for-loops

    const name = [_]u8{ 'P', 'e', 'd', 'r', 'o' };
    // Uses the value itself of each element in the array as our iterator
    for (name) |char| {
        try stdout.print("{d} | ", .{char}); // 80 | 101 | 100 | 114 | 111 |
    }

    const name_string = "Pedro";

    // Uses two different iterators at the same time in a for loop in Zig.
    // Provides a second set of items to iterate over.
    // Provide the range selector 0.. to the for loop

    // index iterator
    // Uses the index of each element in the array as our iterator
    // But i isn't used so discard by using underscore char

    for (name_string, 0..) |_, i| {
        try stdout.print("{d} | ", .{i}); // 0 | 1 | 2 | 3 | 4 |
    }

    try stdout.flush();
}
