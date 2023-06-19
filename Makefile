all:
	true

install:
	mkdir -p $(DESTDIR)/usr/bin/
	curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal -y --default-toolchain nightly
	cargo build --release --no-default-features --features=wayland
	install target/release/eww $(DESTDIR)/usr/bin/eww
	chmod +x $(DESTDIR)/usr/bin/eww
	chmod 755 $(DESTDIR)/usr/bin/eww
