// Code generated by protoc-gen-zig
///! package schema
const std = @import("std");
const Allocator = std.mem.Allocator;
const ArrayList = std.ArrayList;

const protobuf = @import("protobuf");
const ManagedString = protobuf.ManagedString;
const fd = protobuf.fd;

pub const SearchRequest = struct {
    query: ManagedString = .Empty,
    page_number: i32 = 0,
    results_per_page: i32 = 0,

    pub const _desc_table = .{
        .query = fd(1, .String),
        .page_number = fd(2, .{ .Varint = .Simple }),
        .results_per_page = fd(3, .{ .Varint = .Simple }),
    };

    pub usingnamespace protobuf.MessageMixins(@This());
};