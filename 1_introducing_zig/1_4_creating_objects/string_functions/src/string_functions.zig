// https://pedropark99.github.io/zig-book/Chapters/01-zig-weird.html#sec-strings-useful-funs

const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

pub fn main() !void {
    const name: []const u8 = "Pedro";

    // eql function
    try stdout.print("{any}\n", .{std.mem.eql(u8, name, "Pedro")}); // true

    // startsWith function
    try stdout.print("{any}\n", .{std.mem.startsWith(u8, name, "Pe")}); // true

    // concat function
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const str1 = "Hello";
    const str2 = " you!";
    const str3 = try std.mem.concat(allocator, u8, &[_][]const u8{ str1, str2 });
    try stdout.print("{s}\n", .{str3});

    // replace function
    var buffer: [5]u8 = undefined;
    const nrep = std.mem.replace(u8, str1, "el", "34", buffer[0..]);
    try stdout.print("New string: {s}\n", .{buffer});
    try stdout.print("N of replacements: {d}\n", .{nrep});

    try stdout.flush();
}
