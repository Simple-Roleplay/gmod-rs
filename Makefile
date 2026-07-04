RUSTUP = rustup
CARGO = cargo

.PHONY: all help build build32 build64 build-all clean test check init

# Default target
all: build


clean:
	@$(CARGO) clean
	@rm -rf target

test:
	@$(CARGO) test $(build_type)

check: init
	@$(CARGO) +nightly fmt
	@$(CARGO) clippy
	@$(CARGO) deny check

init:
	@$(RUSTUP) component add rustfmt clippy
