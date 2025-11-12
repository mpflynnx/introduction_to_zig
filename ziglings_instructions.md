## Ziglings instructions

1. Download and extract [zig-x86_64-linux-0.16.0-dev.1301+cbfa87cbe.tar.xz](https://ziglang.org/download/) to folder `zig_exercises`.

1. Rename folder extracted folder to `zig_dev`
1. Check version of zig

```bash
cd zig_dev
./zig version
0.16.0-dev.1301+cbfa87cbe
```

4. Clone [Ziglings](https://codeberg.org/ziglings/exercises) into `zig` folder.

```bash
cd zig_exercises
git clone https://codeberg.org/ziglings/exercises.git ziglings
cd ziglings
# Build ziglings using zig dev compiler
../zig_dev/zig build
```

5. Open `ziglings` folder in `vscode` and edit the exercise
5. Run `../zig_dev/zig` build to check the exercise compiles successfully.
5. Or skip the build system entirely and interact directly with the compiler
```bash
$ cd ziglings
$ ../zig_dev/zig run exercises/025_errors5.zig
a=0, b=19, c=0
```

**Note:** Once you have a build of the Zig compiler that works with Ziglings, they'll continue to work together. But keep in mind that if you update one, you may need to also update the other.
