.PHONY: all clean program

TARGET=uart_test
MCU=atmega2560
F_CPU=16000000UL
SOURCES=main.c

CC=/usr/bin/avr-gcc
CFLAGS=-c -Os -DF_CPU=$(F_CPU)

PROGRAMMER=wiring
PORT=-P/dev/ttyACM0
BAUD=-b115200

OBJECTS=$(SOURCES:.c=.o)
LDFLAGS=

all: hex

hex: $(TARGET).hex

$(TARGET).hex: $(TARGET).elf
	avr-objcopy -O ihex -j .data -j .text $(TARGET).elf $(TARGET).hex

$(TARGET).elf: $(OBJECTS)
	avr-gcc $(LDFLAGS) -mmcu=$(MCU) $(OBJECTS) -o $(TARGET).elf

%.o: %.c
	$(CC) -mmcu=$(MCU) -c -o $@ $(CFLAGS) $<

program:
	avrdude -v -p$(MCU) $(PORT) $(BAUD) -c$(PROGRAMMER) -D -Uflash:w:$(TARGET).hex:i

clean_tmp:
	rm -rf *.o
	rm -rf *.elf

clean:
	rm -rf *.o
	rm -rf *.elf
	rm -rf *.hex
