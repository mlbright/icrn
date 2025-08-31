.PHONY: build install uninstall clean

build: main.go
	go build -o icrn main.go

install: build
	sudo cp icrn /usr/local/bin/
	sudo cp icrn.service /usr/lib/systemd/system/
	sudo systemctl daemon-reload
	sudo systemctl enable icrn.service
	sudo systemctl start icrn.service

uninstall:
	sudo systemctl stop icrn.service
	sudo systemctl disable icrn.service
	sudo rm -f /usr/lib/systemd/system/icrn.service
	sudo rm -f /usr/local/bin/icrn

clean:
	rm -f icrn

package: build
	./build-deb.sh
