const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

const User = struct {
    id: u64,
    name: []const u8,
    email: []const u8,

    fn init(id: u64, name: []const u8, email: []const u8) User {
        return User{ .id = id, .name = name, .email = email };
    }

    fn print_name(self: User) !void {
        try stdout.print("{s}\n", .{self.name});
        try stdout.flush();
    }

    fn print_email(self: User) !void {
        try stdout.print("{s}\n", .{self.email});
        try stdout.flush();
    }
};

// Uses User struct
const eu = User{ .id = 1, .name = "Jesus", .email = "jesusmail@gmail.com" };

pub fn main() !void {
    const u = User.init(1, "pedro", "email@gmail.com");
    try u.print_name();
    try u.print_email();

    try eu.print_name();
    try eu.print_email();
}
