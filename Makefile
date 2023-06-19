all:
	true

install:
	mkdir -p $(DESTDIR)/usr/bin/
	curl https://sh.rustup.rs -sSf | CARGO_HOME=/root/.cargo HOME=/root RUSTUP_HOME=/root/.rustup sh -s -- --profile minimal -y --default-toolchain nightly
	. /root/.cargo/env
	PATH="/root/.cargo/bin:${PATH}" cargo build --release --no-default-features --features=x11
	install target/release/eww $(DESTDIR)/usr/bin/eww
	chmod +x $(DESTDIR)/usr/bin/eww
	chmod 755 $(DESTDIR)/usr/bin/eww
