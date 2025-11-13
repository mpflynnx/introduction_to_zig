// the command below compiles user.zig as well
// zig build-exe src/pub_example.zig

// This works fine now!
const user = @import("user.zig");
pub fn main() !void {
    const u: user.User = user.User.init(1, "pedro", "email@gmail.com");
    // _ = u;

    try u.print_name();
    try u.print_email();
}
