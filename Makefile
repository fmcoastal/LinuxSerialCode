
all:  linux_serial

CCFLAGS = -c -g -O0 -D_GNU_SOURCE -Wall -pthread
LDFLAGS = -Wl,-v -Wl,-Map=a.map -Wl,--cref -Wl,-t -lpthread -pthread
ARFLAGS = -rcs

CC = gcc
LD = gcc
AR = ar

#CC = aarch64-marvell-linux-gnu-gcc
#LD = aarch64-marvell-linux-gnu-gcc
#AR = aarch64-marvell-linux-gnu-ar


fs_expect: fln_serial.o Makefile main.o ffile.o frbuff.o fprintbuff.o fln_serial.o
	$(CROSS)$(LD) $(LDFLAGS) -o linux_serial  fln_serial.o main.o ffile.o fprintbuff.o frbuff.o 

main.o: main.c
	$(CROSS)$(CC)  $(CCFLAGS) -o main.o  main.c
fln_serial.o: fln_serial.c fln_serial.h
	$(CROSS)$(CC)  $(CCFLAGS) -o fln_serial.o  fln_serial.c
ffile.o: ffile.c  ffile.h
	$(CROSS)$(CC)  $(CCFLAGS) -o ffile.o  ffile.c
frbuff.o: frbuff.c frbuff.h
	$(CROSS)$(CC)  $(CCFLAGS) -o frbuff.o  frbuff.c

fprintbuff.o: fprintbuff.c fprintbuff.h
	$(CROSS)$(CC)  $(CCFLAGS) -o fprintbuff.o  fprintbuff.c




clean:
	rm -rf *.o
	rm -rf *.map
	rm -rf linux_serial

.phony x:
x:
	./linux_serial


