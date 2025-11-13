const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {

    // https://pedropark99.github.io/zig-book/Chapters/03-structs.html#using-break-and-continue

    var i: usize = 0;

    // break keyword usage example
    while (true) { // infinite loop
        if (i == 10) { // change 10 to 9 to force assertion error
            break;
        }
        i += 1;
    }

    // checks if the logical test provided is equal to true.
    // If so, the function do nothing. Otherwise (i.e., the
    // logical test is equal to false), the function raises
    // an assertion error.
    try std.testing.expect(i == 10);

    try stdout.print("Everything worked!", .{});
    try stdout.flush();

    // continue keyword usage example
    const ns = [_]u8{ 1, 2, 3, 4, 5, 6 };
    for (ns) |ii| {
        if ((ii % 2) == 0) { // is even check
            continue; // jump to next iteration
        }
        try stdout.print("{d} | ", .{ii}); // 1 | 3 | 5 | prints odd numbers
    }
    try stdout.flush();
}
