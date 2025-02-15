# RISC-V bare metal "fake BIOS" example

This is a fork of the code accompanying the website article: https://popovicu.com/posts/bare-metal-programming-risc-v/ for the purpose of training in bare metal debugging.

To build the "fake BIOS", simply run `make hello` (you may want to change your cross compile make prefix with `CROSS_COMPILE`).

Run with QEMU: `make qemu` or `qemu-system-riscv64 -nographic -machine virt -bios hello`

Run with QEMU in debug mode:
- in a terminal, launch `make qemudbg` or `qemu-system-riscv64 -s -S -nographic -machine virt -bios hello` (the execution will start only after a 'continue' command in gdb)
- in another terminal, launch `riscv64-unknown-elf-gdb hello`
  - in the GDB console :
    ```
    target remote 127.0.0.1:1234
    b *0x0000000080000030 (for instance : set a breakpoint)
    c (continue command)

