# https://www.juliabloggers.com/julia-calling-c-a-minimal-example/

CC=gcc 
 
CFLAGS=-c -Wall -fPIC
 
SOURCES=linreg.c 
OBJECTS=$(SOURCES:.c=.o)
 
.c.o:
	$(CC) $(CFLAGS) $< -o $@ 
 
lib: $(OBJECTS)
	$(CC) -shared -fPIC -o linreg.so $(OBJECTS)
 
clean:
	rm *.o *.so
