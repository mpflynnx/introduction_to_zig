const std = @import("std");
var stdout_buffer: [1024]u8 = undefined;
var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
const stdout = &stdout_writer.interface;

const Role = enum { SE, DPE, DE, DA, PM, PO, KS };

pub fn main() !void {
    var area: []const u8 = undefined;
    const role = Role.DA; // Change the Role to see the different result

    // switch statements
    // https://pedropark99.github.io/zig-book/Chapters/03-structs.html#sec-switch

    switch (role) {
        .PM, .SE, .DPE, .PO => {
            area = "Platform";
        },
        .DE, .DA => {
            area = "Data & Analytics";
        },
        // Comment out below to view error: switch must handle all possibilities
        .KS => {
            area = "Sales";
        },
    }
    try stdout.print("{s}\n", .{area});

    // Using else with switch
    // https://pedropark99.github.io/zig-book/Chapters/03-structs.html#the-else-branch

    const level: u8 = 2; // change this to see the options a 4 runtime panic
    const category = switch (level) {
        1, 2 => "beginner",
        3 => "professional",
        else => {
            @panic("Not supported level!");
        },
    };
    try stdout.print("{s}\n", .{category});

    // Ranges in switch statements
    // https://pedropark99.github.io/zig-book/Chapters/03-structs.html#using-ranges-in-switch

    const level2: u8 = 26; // change this to see the options a 101 runtime panic
    const category2 = switch (level2) {
        0...25 => "beginner",
        26...75 => "intermediary",
        76...100 => "professional",
        else => {
            @panic("Not supported level!");
        },
    };
    try stdout.print("{s}\n", .{category2});

    try stdout.flush();
}
