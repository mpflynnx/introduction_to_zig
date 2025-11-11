const std = @import("std");

pub fn main() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    const ns = [4]u8{ 0, 1, 2, 3 }; // length of array given [4]
    const ls = [_]f64{ 56.78, 34.56, 45.32 }; // infer length of array [_]

    try stdout.print("ns[2]:{d}\n", .{ns[2]});
    try stdout.print("ls[2]:{d}\n", .{ls[2]});

    // const slice_of_ns = ns[1..];

    try stdout.print("ns length:{any}\n", .{ns.len});

    try stdout.print("ns[1..]:{any}\n", .{ns[1..]});

    const ns2 = [4]u8{ 4, 5, 6, 8 }; // length of array given [4]

    const combined_arrays = ns ++ ns2;

    try stdout.print("combined_arrays:{any}\n", .{combined_arrays});

    const replicated_3_times = ls ** 3;

    try stdout.print("ls array replicated 3 times:{any}\n", .{replicated_3_times});

    try stdout.flush();
}
