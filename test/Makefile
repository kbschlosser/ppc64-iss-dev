OUT_DIR=out
OUT_BE=$(OUT_DIR)/be
OUT_LE=$(OUT_DIR)/le
TESTS=$(wildcard tests/*.S)

AS_BE = powerpc64-unknown-elf-as
LD_BE = powerpc64-unknown-elf-ld
AS_LE = powerpc64le-unknown-elf-as
LD_LE = powerpc64le-unknown-elf-ld

LDFLAGS = -T link.ld

ISS_BUILD=/root/gen/iss/build
VADL=$(ISS_BUILD)/qemu-system-ppc64sfs
QEMU=$(ISS_BUILD)/qemu-system-ppc64
STOPTRIGGER=$(ISS_BUILD)/contrib/plugins/libstoptrigger.so

all: prepare $(TESTS:tests/%.S=$(OUT_BE)/%.elf) $(TESTS:tests/%.S=$(OUT_LE)/%.elf)

prepare:
	mkdir -p $(OUT_BE) $(OUT_LE)

$(OUT_BE)/%.o: tests/%.S
	$(AS_BE) $< -o $@

$(OUT_BE)/%.elf: $(OUT_BE)/%.o link.ld
	$(LD_BE) $(LDFLAGS) $< -o $@

$(OUT_LE)/%.o: tests/%.S
	$(AS_LE) $< -o $@

$(OUT_LE)/%.elf: $(OUT_LE)/%.o link.ld
	$(LD_LE) $(LDFLAGS) $< -o $@

run-vadl-%: $(OUT_LE)/%.elf
	$(VADL) -nographic -monitor none -plugin $(STOPTRIGGER),addr=0xFC -bios $< 

run-qemu-%: $(OUT_BE)/%.elf
	$(QEMU) -nographic -monitor none -plugin $(STOPTRIGGER),addr=0xFC -bios $< 

clean:
	rm -rf $(OUT_DIR)

.PHONY: all prepare clean