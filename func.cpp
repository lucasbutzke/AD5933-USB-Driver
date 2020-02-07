/*
g++ -o final.cpp func.cpp
*/

#include "Bibliotecas/headerprincipal.h"
#include "iostream"
#include "Bibliotecas/mingw-std-threads-master/mingw.thread.h"


void temp(unsigned int placa){
	std::cout << "lendo placa: " << placa << std::endl;
	vendorRequestError = vendor_request(placa, 0xde, 0xd, cntrl_1, 1, 1, &dataBuffer);
	//std::cerr << "erro retornado da leitura do regitrador cntrl_1: " << vendorRequestError <<std::endl;
	//std::cout << "lido do registrador cnrl_1: " << (int)dataBuffer << std::endl;

	vendorRequestError = vendor_request(placa, 0xde, 0xd, cntrl_1 | ((dataBuffer & 0x07 | 0x90 ) << 8), 0, 0, 0);
	//std::cerr << "erro retornado da escrita no regitrador cntrl_1: " << vendorRequestError <<std::endl;

	//Sleep(200);
	
	//ver estado do registrador status para continauar a leitura de temperatura
	vendorRequestError = vendor_request(placa, 0xde, 0xd, temp_1, 1, 1, &dataBuffer);
	//std::cerr << "erro retornado da leitura do regitrador temp_1: " << vendorRequestError <<std::endl;
	//dataBufferHex << std::hex << dataBuffer;
	//std::cout << "lido do registrador temp_1: " << dataBuffer << std::endl;
	temp = dataBuffer << 8;
	std::cout << temp << std::endl;

	vendorRequestError = vendor_request(placa, 0xde, 0xd, temp_2, 1, 1, &dataBuffer);
	//std::cerr << "erro retornado da leitura do regitrador temp_2: " << vendorRequestError <<std::endl;
	//dataBufferHex << std::hex << dataBuffer;
	//std::cout << "lido do registrador temp_2: " << dataBuffer << std::endl;
	temp |= dataBuffer;
	std::cout << temp << std::endl;
	tempf = (static_cast<float>(temp))/32;

	std::cout << tempf << std::endl;
				
	vendorRequestError = vendor_request(placa, 0xde, 0xd, cntrl_1 | ((dataBuffer & 0x07 | 0xa0 ) << 8), 0, 0, 0);
	//std::cerr << "erro retornado da escrita no regitrador cntrl_1: " << vendorRequestError <<std::endl;
}

void config(unsigned int placa){
	//sweep config
	vendorRequestError = vendor_request(placa,0xde, addr, settl_cycl1 | (0x00 << 8), 0, 0, 0);
	vendorRequestError = vendor_request(placa,0xde, addr, settl_cycl2 | (0xff << 8), 0, 0, 0);

	vendorRequestError = vendor_request(placa,0xde, addr, start_freq_1 | (0x01 << 8), 0, 0, 0);
	vendorRequestError = vendor_request(placa,0xde, addr, start_freq_2 | (0x06 << 8), 0, 0, 0);
	vendorRequestError = vendor_request(placa,0xde, addr, start_freq_3 | (0x25 << 8), 0, 0, 0);

	vendorRequestError = vendor_request(placa,0xde, addr, freq_inc_1 | (0x00 << 8), 0, 0, 0);
	vendorRequestError = vendor_request(placa,0xde, addr, freq_inc_2 | (0x83 << 8), 0, 0, 0);
	vendorRequestError = vendor_request(placa,0xde, addr, freq_inc_3 | (0x13 << 8), 0, 0, 0);

	vendorRequestError = vendor_request(placa,0xde, addr, num_freq_1 | (0x00 << 8), 0, 0, 0);
	vendorRequestError = vendor_request(placa,0xde, addr, num_freq_2 | (f_p << 8), 0, 0, 0);
}

//*****************************************ARRUMAR OS HANDLES************///////////
/***************************************************************************/
void sweep(unsigned int placa0, unsigned int placa1){
	vendorRequestError = vendor_request(Handle0,0xde, addr, cntrl_1, 1, 1, &dataBuffer);
	//std::cout << "lido do registrador num_freq_1: " << dataBuffer[0] << std::endl;
	vendorRequestError = vendor_request(Handle0,0xde, addr, cntrl_1 | ((0xb0 | dataBuffer) << 8), 0, 0, 0);
	//std::cout << "lido do registrador num_freq_2: " << dataBuffer[0] << std::endl;

	vendorRequestError = vendor_request(Handle0,0xde, addr, cntrl_1, 1, 1, &dataBuffer);
	//std::cout << "lido do registrador num_freq_1: " << dataBuffer[0] << std::endl;
	vendorRequestError = vendor_request(Handle0,0xde, addr, cntrl_1 | ((0x10 | dataBuffer) << 8), 0, 0, 0);
	//std::cout << "lido do registrador num_freq_2: " << dataBuffer[0] << std::endl;

	vendorRequestError = vendor_request(Handle1,0xde, addr, cntrl_1, 1, 1, &dataBuffer);
	//std::cout << "lido do registrador num_freq_1: " << dataBuffer[0] << std::endl;
	vendorRequestError = vendor_request(Handle1,0xde, addr, cntrl_1 | ((0xb0 | dataBuffer) << 8), 0, 0, 0);
	//std::cout << "lido do registrador num_freq_2: " << dataBuffer[0] << std::endl;

	vendorRequestError = vendor_request(Handle1,0xde, addr, cntrl_1, 1, 1, &dataBuffer);
	//std::cout << "lido do registrador num_freq_1: " << dataBuffer[0] << std::endl;
	vendorRequestError = vendor_request(Handle1,0xde, addr, cntrl_1 | ((0x10 | dataBuffer) << 8), 0, 0, 0);
	//std::cout << "lido do registrador num_freq_2: " << dataBuffer[0] << std::endl;

	std::thread inicio1(iniciarSweep, placa0);
	std::thread inicio2(iniciarSweep, placa1);

	inicio1.join();
	inicio2.join();

	int status;
	int real1;
	int real2;
	int imag1;
	int imag2;
	int freq = 1;

	std::cout << "lendo impedancia" << std::endl;

	while(freq <= 100){
		vendorRequestError = vendor_request(placa0,0xde, addr, status_reg, 1, 1, &dataBuffer);
		status = dataBuffer;
		vendorRequestError = vendor_request(placa1,0xde, addr, status_reg, 1, 1, &dataBuffer);
		status &= dataBuffer;

		if (status & 2 == 2){
			vendorRequestError = vendor_request(placa0,0xde, addr, real_1, 1, 1, &dataBuffer);
			real1 = dataBuffer << 8;
			vendorRequestError = vendor_request(placa0,0xde, addr, real_2, 1, 1, &dataBuffer);
			real1 |= dataBuffer;

			vendorRequestError = vendor_request(placa0,0xde, addr, imag_1, 1, 1, &dataBuffer);
			imag1 = dataBuffer << 8;
			vendorRequestError = vendor_request(placa0,0xde, addr, imag_2, 1, 1, &dataBuffer);
			imag1 |= dataBuffer;

			std::cout << "real: " << real1 << ":: imag: " << imag1 << ":: freq: " << freq << std::endl;

			vendorRequestError = vendor_request(placa1,0xde, addr, real_1, 1, 1, &dataBuffer);
			real2 = dataBuffer << 8;
			vendorRequestError = vendor_request(placa1,0xde, addr, real_2, 1, 1, &dataBuffer);
			real2 |= dataBuffer;

			vendorRequestError = vendor_request(placa1,0xde, addr, imag_1, 1, 1, &dataBuffer);
			imag2 = dataBuffer << 8;
			vendorRequestError = vendor_request(placa1,0xde, addr, imag_2, 1, 1, &dataBuffer);
			imag2 |= dataBuffer;

			std::cout << "real: " << real2 << ":: imag: " << imag2 << ":: freq: " << freq << std::endl;

			std::thread next1(repFreqSweet, placa0);
			std::thread next2(repFreqSweet, placa1);

			next1.join();
			next2.join();

			freq += 1;
		}
	} 
}

void iniciarSweep(unsigned int placa){
	vendorRequestError = vendor_request(placa,0xde, addr, cntrl_1, 1, 1, &dataBuffer);
	//std::cout << "lido do registrador num_freq_1: " << dataBuffer[0] << std::endl;
	vendorRequestError = vendor_request(placa,0xde, addr, cntrl_1 | ((0x20 | dataBuffer) << 8), 0, 0, 0);
	//std::cout << "lido do registrador num_freq_2: " << dataBuffer[0] << std::endl;
}

void incFreqSweep(unsigned int placa){
	vendorRequestError = vendor_request(placa,0xde, addr, cntrl_1, 1, 1, &dataBuffer);
	//std::cout << "lido do registrador num_freq_1: " << dataBuffer[0] << std::endl;
	vendorRequestError = vendor_request(placa,0xde, addr, cntrl_1 | ((inc | dataBuffer) << 8), 0, 0, 0);
	//std::cout << "lido do registrador num_freq_2: " << dataBuffer[0] << std::endl;
}

void repFreqSweet(unsigned int placa){
	vendorRequestError = vendor_request(placa,0xde, addr, cntrl_1, 1, 1, &dataBuffer);
	//std::cout << "lido do registrador num_freq_1: " << dataBuffer[0] << std::endl;
	vendorRequestError = vendor_request(placa,0xde, addr, cntrl_1 | ((rep | dataBuffer) << 8), 0, 0, 0);
	//std::cout << "lido do registrador num_freq_2: " << dataBuffer[0] << std::endl;
}
