const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {

    // https://pedropark99.github.io/zig-book/Chapters/03-structs.html#labeled-switch-statements

    xsw: switch (@as(u8, 4)) { // change this to see the options
        1 => {
            try stdout.print("First branch\n", .{});
            continue :xsw 2;
        },
        2 => continue :xsw 3,
        3 => return,
        4 => {},
        else => {
            try stdout.print("Unmatched case, value: {d}\n", .{@as(u8, 1)});
            try stdout.flush();
        },
    }
}
