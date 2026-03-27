OUT_DIR=out
TESTS=$(wildcard tests/*.S)

AS = powerpc64-unknown-elf-as
LD = powerpc64-unknown-elf-ld

LDFLAGS = -T link.ld

ISS_BUILD=/root/gen/iss/build
VADL=$(ISS_BUILD)/qemu-system-ppc64sfs
QEMU=$(ISS_BUILD)/qemu-system-ppc64
STOPTRIGGER=$(ISS_BUILD)/contrib/plugins/libstoptrigger.so

all: prepare $(TESTS:tests/%.S=$(OUT_DIR)/%.elf)

prepare:
	mkdir -p $(OUT_DIR)

$(OUT_DIR)/%.o: tests/%.S
	$(AS) $< -o $@

$(OUT_DIR)/%.elf: $(OUT_DIR)/%.o link.ld
	$(LD) $(LDFLAGS) $< -o $@

run-vadl-%: $(OUT_DIR)/%.elf
	$(VADL) -nographic -monitor none -plugin $(STOPTRIGGER),addr=0xFC -bios $< 

run-qemu-%: $(OUT_DIR)/%.elf
	$(QEMU) -nographic -monitor none -plugin $(STOPTRIGGER),addr=0xFC -bios $< 

clean:
	rm -rf $(OUT_DIR)

.PHONY: all prepare clean