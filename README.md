# Introduction to Zig

My repository for learning the **Zig programming language** using various resources listed below:

- [Introduction to Zig by Pedro Duarte Faria](https://pedropark99.github.io/zig-book/)

## Zig install with Visual Studio Code extension
Keeps the language server in sync with the installed Zig version.
- In Visual Studio Code, add extension named [Zig Language by zigland](https://marketplace.visualstudio.com/items?itemName=ziglang.vscode-zig)
- Zig will automatically be downloaded to:

```bash
~/.config/Code/User/globalStorage/ziglang.vscode-zig/zig/x86_64-linux-0.15.2/zig
```
- To use this version of Zig in any terminal emulator
- Create a symbolic link in ~/zig
- Update shell configs for Zig path
```bash
$ cd ~
$ mkdir ~/zig
$ ln -s ~/.config/Code/User/globalStorage/ziglang.vscode-zig/zig/x86_64-linux-0.15.2/zig ~/zig/zig
```

## Zig version used

- [zig-x86_64-linux-0.15.2.tar.xz](https://ziglang.org/download/0.15.2/zig-x86_64-linux-0.15.2.tar.xz)
```bash
$ zig version
0.15.2
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
- Check syntax using `zig fmt`. No output == no problem.
```bash
$ cd hello_world_simple
$ zig fmt src/main.zig
```
- Build binary executable with **debug symbols** by default
```bash
$ zig build-exe src/main.zig
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

### Compiling C source file using Zig

Compile C source files using [zic cc](https://zig.guide/working-with-c/zig-cc/) a drop in replacement for Clang compiler.

```bash
$ zig cc main.c -o my_executable
```