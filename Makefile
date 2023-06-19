all:
	true

install:
	mkdir -p $(DESTDIR)/usr/bin/
	rustup install nightly
	rustup default nightly
	cargo build --release --no-default-features --features=wayland
	install target/release/eww $(DESTDIR)/usr/bin/eww
	chmod +x $(DESTDIR)/usr/bin/eww
	chmod 755 $(DESTDIR)/usr/bin/eww
