#AD5933 USB COMMUNICATION

For simplify the AD5933 development board communication was chosen to do all the communication just in the USB port, just like the programm demo made by Analog Devices.

This C++ project was made for my final year project and it should have some portuguese comments in it, if there is any questions fell free to ask.

## DLL Explanation

Funtions and callings

a biblioteca DLL na maioria dos foruns e repositorios está incorreta sua declaracao das funcoes para utilizar mais de uma placa de uma só vez
- ver novamente o erro para mostrar a defirenca e por o arquivo errado se possivel

por fonte dos pipelines do USB no windows

https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/usb-endpoints-and-their-pipes

## Clock Sharing

For two boards measuring it must have a shared clock to work properly, 

IMAGE PHASE RIGHT

IMAGE PHASE WRONG

Phase 
