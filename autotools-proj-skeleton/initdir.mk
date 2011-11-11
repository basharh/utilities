DIRS=config lib test doc src
FILES=Makefile README configure.in

init:
	mkdir $(DIRS)
	touch $(FILES)

clean:
	rm $(FILES)
	rm -rf $(DIRS)
