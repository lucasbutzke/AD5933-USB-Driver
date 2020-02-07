/*
dos envios USB e manter o clock das placas o msm

Fazer funcao calculadora para converter os dados de frequencia desejados para os registradores
freq & 0b110000 = freq1
freq1 = freq1 >> 8
desse modo para escrever 
*/

/*
DLL correta no baixada, fazer do modo como está
pedir para substituir apos fazer instalacao
anexar arquivo hex ou fazer o usuario ir no local de instalacao do programa
 */

//escrever as funoces de configuracao e leitura em outros arquivos para diminuir programa principal
//declarar a funcao e programar a funcao num arquivo cpp na mesma pasta deve bastar para a funcao

// declarar as variaveis e objetos das funcoes dentro das mesmas para irem junto a pilha
// templete classses eh tao eficiente quanto classes normais
// variaveis iniciadas fora de funcoes sao globais, necessarias para threads

#include <windows.h>
#include "Bibliotecas/headerprincipal.h"
#include "iostream"
#include <sstream>
#include "fstream"
//#include "Bibliotecas/mingw-std-threads-master/mingw.thread.h"

using namespace std;

// prototipos das funcoes do codigo principal para obter os dados
void celsius(unsigned int placa);
void config(unsigned int placa);
void sweep(unsigned int placa0, unsigned int placa1);
void iniciarSweep(unsigned int placa);
void incFreqSweep(unsigned int placa);
void repFreqSweet(unsigned int placa);

int main(){

    HMODULE hGetProcIDDLL = LoadLibrary("C:\\Program Files\\Analog Devices\\USB Drivers\\ADI_CYUSB_USB4.dll");

    //std::cout << *hGetProcIDDLL << std::endl;

    if (!hGetProcIDDLL) throw new runtime_error("Missing dll");

    search = (Search_For_Boards)GetProcAddress(hGetProcIDDLL, "Search_For_Boards");
    connect_func = (Connect_Func)GetProcAddress(hGetProcIDDLL, "Connect");
    download_firmware = (Download_Firmware)GetProcAddress(hGetProcIDDLL, "Download_Firmware");
    vendor_request = (Vendor_Request)GetProcAddress(hGetProcIDDLL, "Vendor_Request");
    disconnect = (Disconnect)GetProcAddress(hGetProcIDDLL, "Disconnect");

    //em operacoes boleanas eh melhor deixar a variavel q provavelmente possa aparecer mais 
    //falsa por ultimo na operacao &&, na operacao || eh melhor deixar a TRUE 
    if (!search || !download_firmware || !connect_func || !vendor_request || !disconnect) {
        std::cerr << "Factory function could not be resolved. " << GetLastError() << std::endl;
        return *MESSAGE;
    }

    searchError = search(VID, PID, &numBoards, &path);
    std::cerr << "erro retornado da procura das placas: " << searchError << std::endl;
    std::cout << "**********************\nnumero de placas: " << numBoards << std::endl;
    std::cout << "path 1: " << (&path)[0] << std::endl;
    std::cout << "path 2: " << (&path)[1] << std::endl;

    // de algum modo nao esta conectando com as duas placas, somente uma recebe o handle
    connectError |= connect_func(VID, PID, (&path)[0], &Handle0);
    //std::cerr << "erro retornado da conexao para a placa: " << connectError << std::endl;
    std::cout << "Handle0: " << Handle0 << std::endl;

    downloadError = download_firmware(Handle0, firmware_path);
    std::cerr << "erro retornado do download do firmware: " << downloadError << std::endl;

    connectError |= connect_func(VID, PID, (&path)[1], &Handle1);
    //std::cerr << "erro retornado da conexao para a placa: " << connectError << std::endl;
    std::cout << "Handle1: " << Handle1 << std::endl;

    downloadError |= download_firmware(Handle1, firmware_path);
    std::cerr << "erro retornado do download do firmware: " << downloadError << std::endl;

    //setar o clock correto para prover o msm para as duas placas 
    // ler temperatura, resolver o resultado errado mas lendo certo
    // fazer loop para verificar registrador de status para esperar conversao completa

    //funcao de leitura individual das temperaturas nas placas
    /*
    temp(Handle0);
    temp(Handle1);
	*/

    //configura cada placa individualmente
    config(Handle0);
    config(Handle1);

	/********************************************************************************/
	// esta funcao ja gerencia a leitura das placas e salva os dados em TXT
	sweep(Handle0, Handle1);

	disconnectError = disconnect(Handle0);
   	std::cerr << "erro retornado da desconexao: " << downloadError << std::endl;
   	disconnectError = disconnect(Handle1);
   	std::cerr << "erro retornado da desconexao: " << downloadError << std::endl;

   	std::cout << "ultimo erro foi: " << GetLastError() << std::endl;

   	//vendorRequestError = vendor_request(Handle, vendor_request, )
   	//std::cout << GetTickCount() << std::endl;
   	FreeLibrary(hGetProcIDDLL);	 
    //system("pause");
    return 0;
}

void celsius(unsigned int placa){
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

	iniciarSweep(placa0);
	iniciarSweep(placa1);

	//std::thread inicio1(iniciarSweep, placa0);
	//std::thread inicio2(iniciarSweep, placa1);

	//inicio1.join();
	//inicio2.join();

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

			repFreqSweet(placa0);
			repFreqSweet(placa1);
			//std::thread next1(repFreqSweet, placa0);
			//std::thread next2(repFreqSweet, placa1);

			//next1.join();
			//next2.join();

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

