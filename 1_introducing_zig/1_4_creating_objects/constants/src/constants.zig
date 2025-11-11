const std = @import("std");

pub fn main() !void {
    const age_multiplier: u32 = 7; // must used it if declared
    // age = 25; // will not compile
    // src/constants.zig:5:5: error: cannot assign to constant
    // age = 25;
    // ^~~

    var mut_dogs_age: u32 = 6; // var are mutable

    if (mut_dogs_age > 0) {
        mut_dogs_age *= age_multiplier; // using constants here
    } else {
        mut_dogs_age *= 0;
    }

    std.debug.print("{d}\n", .{mut_dogs_age});
}
