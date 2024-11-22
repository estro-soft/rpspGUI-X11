CC = clang
CFLAGS = -Wall -Wextra -O3 -flto=thin 
LDFLAGS = -I/usr/include/freetype2 -lX11 -lXft -lXrender -lXext  
SRC = GUI.c
BIN = rpspGUI-X11
INSTALL_DIR = /usr/local/bin
TARGET = $(INSTALL_DIR)/$(BIN)

all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(BIN) $(LDFLAGS)
	strip $(BIN)

install: $(BIN)
	install -m 755 $(BIN) $(TARGET)

clean:
	@rm -f $(BIN)

clean-install: clean install

.PHONY: all install clean clean-install
