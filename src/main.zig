const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    // This pool can only create and destroy our User
    var user_pool = std.heap.MemoryPool(User).init(allocator);
    defer user_pool.deinit();

    const user1 = try user_pool.create();
    defer user_pool.destroy(user1);
    std.debug.print("user1: {any}\n", .{user1});
}

const User = struct { id: i32 };
