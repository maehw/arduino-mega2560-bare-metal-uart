# Usage

This example blinks the built-in LED (Arduino pin 13) connected to an Arduino MEGA2560 (which is based on an ATmega2560 MCU). Additionally, it also sends "hello\n" and "world\n" messages via UART0. These serial messages can received on the PC-side via the USB CDC thanks to the additional ATmega 16U2 on the Arduino board.

This code is not using the Arduino IDE and libraries, but the `gcc-avr` toolchain, `avr-libc` libraries, a pretty bare-metal C program and `avrdude` to flash it to the target.

* `make`: to compile and link `main.c`

* `make program`: to flash the program with `avrdude`

# Dependencies

* Installation of `gcc-avr`
* Installation of `avr-libc`
* Installation of `avrdude`
* Installation of `make`

