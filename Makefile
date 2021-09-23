

BUILD_DIR ?= build
.PHONY: build clean
# default: run


build: $(BUILD_DIR)/Makefile
	cd $(BUILD_DIR) && make

install: $(BUILD_DIR)/Makefile
	cd $(BUILD_DIR) && make install

$(BUILD_DIR)/Makefile: Makefile
	mkdir -p $(BUILD_DIR) \
	&& cmake -S . -B $(BUILD_DIR) 

clean:	
	rm -rf $(BUILD_DIR)

uninstall:
	-rm -rf /usr/local/lib/repo1
	-rm -rf /usr/local/lib/cmake/repo1
	-rm -rf /usr/local/include/repo1



run: build
	$(BUILD_DIR)/binary1/binary1
