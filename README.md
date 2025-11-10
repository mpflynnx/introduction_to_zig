# Introduction to Zig

My repository for learning the **Zig programming language** using various resources listed below:

- [Introduction to Zig by Pedro Duarte Faria](https://github.com/pedropark99/zig-book)

## Zig version used
```bash
$ zig version
0.16.0-dev.1262+be4eaed7c
```

## Hello world simple demo
- Make folder `hello_world_simple/src`
- Create source file `src/main.zig`

***main.zig***
```zig
const std = @import("std");

pub fn main() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;
    try stdout.print("Hello, {s}!\n", .{"world"});
    try stdout.flush();
}
```
```bash
$ cd hello_world_simple
$ zig build-exec
```
- Run binary executable `main`
```bash
$ ./main
```


## Hello world full demo
- Use `zig init` to generate a hello_world demo
```bash
$ mkdir hello_world && cd hello_world
$ zig init
```
- Build the demo
```bash
$ zig build
```
- Build and run any tests
```bash
$ zig build test
```
- Run the binary executable 
```bash
$ ./zig-out/bin/hello_word
All your codebase are belong to us.
Run `zig build test` to run the tests. 
```
