const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

// marking struct pub, allow pub_example.zip to use it
pub const User = struct {
    id: u64,
    name: []const u8,
    email: []const u8,

    // marking methods with the pub keyword, makes them
    // both available to the outside world
    pub fn init(id: u64, name: []const u8, email: []const u8) User {
        return User{ .id = id, .name = name, .email = email };
    }

    pub fn print_name(self: User) !void {
        try stdout.print("{s}\n", .{self.name});
        try stdout.flush();
    }

    pub fn print_email(self: User) !void {
        try stdout.print("{s}\n", .{self.email});
        try stdout.flush();
    }
};
