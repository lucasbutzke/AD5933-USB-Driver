# AD5933 USB COMMUNICATION

<!-- POR CITACAO AO ARTIGO (AINDA EM PROCESSO DE PUBLICACAO) -->

For simplify the AD5933 development board communication was chosen to do all the communication just in the USB port, just like the programm demo made by Analog Devices.

This C++ project was made for my final year project and it should have some portuguese comments in it, if there is any questions fell free to ask.

## AD5933 Funcionamento

This IC is controlled by a I2C interface, on the development board this bus is conected to an I2C to USB converter. If the board is powered by the PC so is more confortable to use the USB to only use one cable. This development kit comes with a demo programm to make tests, that progamm have some DLL files to download the firmware to the board and also communicate. 

## DLL Explanation

Funtions and callings

a biblioteca DLL na maioria dos foruns e repositorios está incorreta sua declaracao das funcoes para utilizar mais de uma placa de uma só vez
- ver novamente o erro para mostrar a defirenca e por o arquivo errado se possivel

por fonte dos pipelines do USB no windows

https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/usb-endpoints-and-their-pipes

## Clock Sharing for Two Boards

I used two boards for voltage and current measuring in my analog interface, it's hard do to and the demo programm comes with wrong DLL files that doesn't work for more that one board. After a lot of time researching in Analog Device's foruns I found the correct DLL file with the correct functions declarations in it.

For two boards measuring it must have a shared clock to work properly, 

IMAGE PHASE RIGHT

IMAGE PHASE WRONG

Phase
