const std = @import("std");

pub fn main() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    var y: i32 = 123;
    const x = add_one: { // label is add_one:
        y += 1;
        break :add_one y;
    };

    if (x == 124 and y == 124) {
        try stdout.print("Hey!", .{});
        try stdout.flush();
    }
}
