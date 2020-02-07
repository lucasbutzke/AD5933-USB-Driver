/*
Fazer INCLUDE da biblioteca thread depois, ver como fazer o debug (Qdebug????) 
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

// declarar as variaveis e objetos das funcoes dentro das mesmas para irem junto a pilha
// templete classses eh tao eficiente quanto classes normais
// variaveis iniciadas fora de funcoes sao globais, necessarias para threads

#include "Bibliotecas/headerprincipal.h"
#include "iostream"
#include <sstream>
#include "fstream"
#include "Bibliotecas/mingw-std-threads-master/mingw.thread.h"
//#include <Python.h>

using namespace std;

// prototipos das funcoes do codigo principal para obter os dados
void temperatura(unsigned int Handle);
void temperaturaThread(unsigned int Handle0, unsigned int Handle1);

//void signalhandler(int sn) // retorna erro de saida no cmd
//{
//	cout<<"Interrupt signal ("<<sn<<") received\n";
//	exit(sn);
//}

//class myexception: public exception
//{
//  virtual const char* what() const throw()
//  {
//    return "My exception happened";
//  }
//} myex;

int main(){

	//signal(SIGINT, signalhandler); // debug de encerramento repentino pelo OS

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
    //std::cerr << "erro retornado do download do firmware: " << downloadError << std::endl;

    connectError |= connect_func(VID, PID, (&path)[1], &Handle1);
    //std::cerr << "erro retornado da conexao para a placa: " << connectError << std::endl;
    std::cout << "Handle1: " << Handle1 << std::endl;

    downloadError |= download_firmware(Handle1, firmware_path);
    //std::cerr << "erro retornado do download do firmware: " << downloadError << std::endl;

    if(!connectError || !downloadError){
    	std::cout << "placas conectadas\n******************\n" << std::endl;
	}
	else{
		return *MESSAGE;
	}

    std::cout << "* escolha o q fazer: " << std::endl;
    std::cout << "fazer download do firmware: d" << std::endl;
    std::cout << "ler temperatura: t" << std::endl;
    std::cout << "configurar sweep: c" << std::endl;
    std::cout << "fazer sweep: s" << std::endl;
    std::cout << "parar programa: o\n" << std::endl;

    //setar o clock correto para prover o msm para as duas placas 
    while(TRUE){
    	//switch sao como GOTO e esta eh a maneira mais limpa de nao dar erro nas inicializacoes das threads
    	switch(getchar()){  // getchar returns int instead of char -> scanf()
    		case 'd': // download
    			downloadError = download_firmware(Handle0, firmware_path);
    			std::cerr << "erro retornado do download do firmware: " << downloadError << std::endl;
    			break;

    		case 't': // ler temperatura, resolver o resultado errado mas lendo certo
    				  // fazer loop para verificar registrador de status para esperar conversao completa
    			std::cout << "lendo placa: " << Handle0 << std::endl;
				vendorRequestError = vendor_request(Handle0, 0xde, 0xd, cntrl_1, 1, 1, &dataBuffer);
				//std::cerr << "erro retornado da leitura do regitrador cntrl_1: " << vendorRequestError <<std::endl;
				//std::cout << "lido do registrador cnrl_1: " << (int)dataBuffer << std::endl;

				vendorRequestError = vendor_request(Handle0, 0xde, 0xd, cntrl_1 | ((dataBuffer & 0x07 | 0x90 ) << 8), 0, 0, 0);
				//std::cerr << "erro retornado da escrita no regitrador cntrl_1: " << vendorRequestError <<std::endl;
	
				//Sleep(200);
	
				//ver estado do registrador status para continauar a leitura de temperatura
				vendorRequestError = vendor_request(Handle0, 0xde, 0xd, temp_1, 1, 1, &dataBuffer);
				//std::cerr << "erro retornado da leitura do regitrador temp_1: " << vendorRequestError <<std::endl;
				//dataBufferHex << std::hex << dataBuffer;
				//std::cout << "lido do registrador temp_1: " << dataBuffer << std::endl;
				temp = dataBuffer << 8;
				//std::cout << temp << std::endl;

				vendorRequestError = vendor_request(Handle0, 0xde, 0xd, temp_2, 1, 1, &dataBuffer);
				//std::cerr << "erro retornado da leitura do regitrador temp_2: " << vendorRequestError <<std::endl;
				//dataBufferHex << std::hex << dataBuffer;
				//std::cout << "lido do registrador temp_2: " << dataBuffer << std::endl;
				temp |= dataBuffer;
				//std::cout << temp << std::endl;
				tempf = (static_cast<float>(temp))/32;

				std::cout << tempf << std::endl; //********* guardar variavel numa classe ou num thread-buffer para ser acessada pelas threads  *****************/////
				
				vendorRequestError = vendor_request(Handle0, 0xde, 0xd, cntrl_1 | ((dataBuffer & 0x07 | 0xa0 ) << 8), 0, 0, 0);
				//std::cerr << "erro retornado da escrita no regitrador cntrl_1: " << vendorRequestError <<std::endl;

				//return tempf;
				break;

			case 'c': // configuracao para fazer varredura
					//configuracao dos registradores de leitura de impedancia: numero de pontos, freq incial..
				
				vendorRequestError = vendor_request(Handle0,0xde, addr, settl_cycl1 | (0x00 << 8), 0, 0, 0);
				vendorRequestError = vendor_request(Handle0,0xde, addr, settl_cycl2 | (0xff << 8), 0, 0, 0);

				vendorRequestError = vendor_request(Handle0,0xde, addr, start_freq_1 | (0x01 << 8), 0, 0, 0);
				vendorRequestError = vendor_request(Handle0,0xde, addr, start_freq_2 | (0x06 << 8), 0, 0, 0);
				vendorRequestError = vendor_request(Handle0,0xde, addr, start_freq_3 | (0x25 << 8), 0, 0, 0);

				vendorRequestError = vendor_request(Handle0,0xde, addr, freq_inc_1 | (0x00 << 8), 0, 0, 0);
				vendorRequestError = vendor_request(Handle0,0xde, addr, freq_inc_2 | (0x83 << 8), 0, 0, 0);
				vendorRequestError = vendor_request(Handle0,0xde, addr, freq_inc_3 | (0x13 << 8), 0, 0, 0);

				vendorRequestError = vendor_request(Handle0,0xde, addr, num_freq_1 | (0x00 << 8), 0, 0, 0);
				vendorRequestError = vendor_request(Handle0,0xde, addr, num_freq_2 | (f_p << 8), 0, 0, 0);
				break;

			case 's': //sweep
				/*
				vendorRequestError = vendor_request(Handle,0xde, addr, settl_cycl1 | (0x00 << 8), 0, 0, 0);
				//std::cout << "lido do registrador settl_cycl1: " << dataBuffer[0] << std::endl;
				vendorRequestError = vendor_request(Handle,0xde, addr, settl_cycl2 | (0xff << 8), 0, 0, 0);
				//std::cout << "lido do registrador settl_cycl2: " << dataBuffer[0] << std::endl;

				vendorRequestError = vendor_request(Handle,0xde, addr, start_freq_1 | (0x01 << 8), 0, 0, 0);
				//std::cout << "lido do registrador start_freq_1: " << dataBuffer[0] << std::endl;
				vendorRequestError = vendor_request(Handle,0xde, addr, start_freq_2 | (0x06 << 8), 0, 0, 0);
				//std::cout << "lido do registrador start_freq_2: " << dataBuffer[0] << std::endl;
				vendorRequestError = vendor_request(Handle,0xde, addr, start_freq_3 | (0x25 << 8), 0, 0, 0);
				//std::cout << "lido do registrador start_freq_3: " << dataBuffer[0] << std:::endl;

				vendorRequestError = vendor_request(Handle,0xde, addr, freq_inc_1 | (0x00 << 8), 0, 0, 0);
				//std::cout << "lido do registrador freq_inc_1: " << dataBuffer[0] << std::endl;
				vendorRequestError = vendor_request(Handle,0xde, addr, freq_inc_2 | (0x83 << 8), 0, 0, 0);
				//std::cout << "lido do registrador freq_inc_2: " << dataBuffer[0] << std::endl;
				vendorRequestError = vendor_request(Handle,0xde, addr, freq_inc_3 | (0x13 << 8), 0, 0, 0);
				//std::cout << "lido do registrador freq_inc_3: " << dataBuffer[0] << std::endl;

				vendorRequestError = vendor_request(Handle,0xde, addr, num_freq_1 | (0x00 << 8), 0, 0, 0);
				//std::cout << "lido do registrador num_freq_1: " << dataBuffer[0] << std::endl;
				vendorRequestError = vendor_request(Handle,0xde, addr, num_freq_2 | (f_p << 8), 0, 0, 0);
				//std::cout << "lido do registrador num_freq_2: " << dataBuffer[0] << std::endl;
				*/
				break;

			case 'o': //out
				disconnectError = disconnect(Handle0);
    			std::cerr << "erro retornado da desconexao: " << downloadError << std::endl;

    			std::cout << "ultimo erro foi: " << GetLastError() << std::endl;

    			//vendorRequestError = vendor_request(Handle, vendor_request, )
    			//std::cout << GetTickCount() << std::endl;
    			FreeLibrary(hGetProcIDDLL);	 
				return FALSE;

			case 'p':  // executar plot em python

					break;

			default:
            	puts("Invalid key pressed. Press (o) to exit");
            	break;
		}
	}
    //system("pause");
    return 0;
}

/*
void temperaturaThread(unsigned int Handle0, unsigned int Handle1){

	std::thread temp1 (temperatura, Handle1);    
	temp1.join();
	std::thread temp2 (temperatura, Handle0);  
	temp2.join();
}

void temperatura(unsigned int Handle){
	std::cout << "lendo placa: " << Handle << std::endl;
	vendorRequestError = vendor_request(Handle, 0xde, 0xd, cntrl_1, 1, 1, &dataBuffer);
	//std::cerr << "erro retornado da leitura do regitrador cntrl_1: " << vendorRequestError <<std::endl;
	//std::cout << "lido do registrador cnrl_1: " << (int)dataBuffer << std::endl;

	vendorRequestError = vendor_request(Handle, 0xde, 0xd, cntrl_1 | ((dataBuffer & 0x07 | 0x90 ) << 8), 0, 0, 0);
	//std::cerr << "erro retornado da escrita no regitrador cntrl_1: " << vendorRequestError <<std::endl;
	
	//Sleep(200);
	
	//ver estado do registrador status para continauar a leitura de temperatura
	vendorRequestError = vendor_request(Handle, 0xde, 0xd, temp_1, 1, 1, &dataBuffer);
	//std::cerr << "erro retornado da leitura do regitrador temp_1: " << vendorRequestError <<std::endl;
	//dataBufferHex << std::hex << dataBuffer;
	//std::cout << "lido do registrador temp_1: " << dataBuffer << std::endl;
	temp = dataBuffer << 8;
	//std::cout << temp << std::endl;

	vendorRequestError = vendor_request(Handle, 0xde, 0xd, temp_2, 1, 1, &dataBuffer);
	//std::cerr << "erro retornado da leitura do regitrador temp_2: " << vendorRequestError <<std::endl;
	//dataBufferHex << std::hex << dataBuffer;
	//std::cout << "lido do registrador temp_2: " << dataBuffer << std::endl;
	temp |= dataBuffer;
	//std::cout << temp << std::endl;
	tempf = ((float)temp)/32;

	std::cout << temp << std::endl;
				
	vendorRequestError = vendor_request(Handle, 0xde, 0xd, cntrl_1 | ((dataBuffer & 0x07 | 0xa0 ) << 8), 0, 0, 0);
	//std::cerr << "erro retornado da escrita no regitrador cntrl_1: " << vendorRequestError <<std::endl;

	//return tempf;
}
*/