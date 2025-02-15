CROSS_COMPILE=riscv64-unknown-elf-

hello: hello.ld hello.o
	$(CROSS_COMPILE)ld -T hello.ld --no-dynamic-linker -m elf64lriscv -static -nostdlib -o hello hello.o

hello.o: hello.s
	$(CROSS_COMPILE)as -ggdb -march=rv64i -mabi=lp64 -o hello.o -c hello.s

qemu: hello
	qemu-system-riscv64 -nographic -machine virt -bios hello

qemugdb: hello
	qemu-system-riscv64 -s -S -nographic -machine virt -bios hello

clean:
	rm hello.o hello
