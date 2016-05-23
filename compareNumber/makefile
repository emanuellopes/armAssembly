# Makefile
all: program
 
program: program.o
	gcc -o $@ $+
 
program.o : program.s
	as -o $@ $<
 
clean:
	rm -vf program *.o
