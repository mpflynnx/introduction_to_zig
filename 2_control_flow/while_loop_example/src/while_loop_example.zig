const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    // https://pedropark99.github.io/zig-book/Chapters/03-structs.html#while-loops

    var i: u8 = 1;

    // while (i < 5) {
    //     try stdout.print("{d} | ", .{i}); // 1 | 2 | 3 | 4 |
    //     i += 1; // increment expression
    // }

    // try stdout.flush();

    // Alternative to above
    // Uses increment expression at beginning of while loop : ()
    while (i < 5) : (i += 1) {
        try stdout.print("{d} | ", .{i});
    }

    try stdout.flush();
}
