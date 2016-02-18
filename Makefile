
SRC=src/
BOOT=isofiles/boot/

.PHONY: clean run iso

clean:
	@rm os.iso
	@rm $(BOOT)kernel.bin
	@rm $(SRC)*.o
	

iso: $(BOOT)kernel.bin
	grub-mkrescue -o os.iso isofiles

$(BOOT)kernel.bin: $(SRC)boot.o $(SRC)multiboot_header.o
	ld -nmagic -o $(BOOT)kernel.bin -T $(SRC)linker.ld $(SRC)multiboot_header.o $(SRC)boot.o

$(SRC)multiboot_header.o: $(SRC)multiboot_header.asm
	nasm -f elf64 $(SRC)multiboot_header.asm

$(SRC)boot.o: $(SRC)boot.asm
	nasm -f elf64 $(SRC)boot.asm

run: iso
	qemu-system-x86_64 -cdrom os.iso


