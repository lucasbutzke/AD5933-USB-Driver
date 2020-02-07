//prototipo funcao temperatura, impRep e impSpec
//fazer funçao calculadora de hexadecimais e separar cada unidade ao seu respectivo registrador
//verificar necessidade de funçoes no header
//funcao de chamar programa em python para plotar os resultados <Python.h>

//#pragma once

#ifndef HEADERPRINCIPAL_H_
#define HEADERPRINCIPAL_H_

#if !defined(__cplusplus) || (__cplusplus < 201103L)
#error A C++11 compiler is required!
#endif

#define _WIN32_WINNT 0x0A00  // definindo WINDOWS 10 para trabalhar com as threads

//#ifdef _WIN32

//#include "mingw-std-threads-master/mingw.thread.h"
//typedef unsigned int uint32;
//typedef signed int int32;

////////////////////////// VER COMO TRABALHAR COM ISSO/////////////////////////////////////////////
typedef unsigned int (*Search_For_Boards)(unsigned int,unsigned int, unsigned int *, char *);
typedef int (*Connect_Func)(unsigned int,unsigned int, char, unsigned int *);
typedef int (*Download_Firmware)(unsigned int, char *);
typedef int (*Vendor_Request) (unsigned int, char, unsigned short, unsigned short, char, unsigned short, unsigned char *);
typedef int (*Disconnect)(unsigned int);

Search_For_Boards search;
Connect_Func connect_func;
Download_Firmware download_firmware;
Vendor_Request vendor_request;
Disconnect disconnect;

// board indentification 
const unsigned int VID = 0x0456;
const unsigned int PID = 0xb203;

const char addr = 0x000d; // endereço I2C
const unsigned int ptr = 0xb0; // vai saber
const unsigned int f_p = 0x64; // numero de incrementos/repetiçoes

//registradores de definicao de espectroscopia
const unsigned short start_freq_1 = 0x82;
const unsigned short start_freq_2 = 0x83;
const unsigned short start_freq_3 = 0x84;
const unsigned short freq_inc_1 = 0x85;
const unsigned short freq_inc_2 = 0x86;
const unsigned short freq_inc_3 = 0x87;
const unsigned short num_freq_1 = 0x88;
const unsigned short num_freq_2 = 0x89;
const unsigned short settl_cycl1 = 0x8a;
const unsigned short settl_cycl2 = 0x8b;

//registradores de controle
const unsigned short cntrl_1 = 0x80;
const unsigned short cntrl_2 = 0x81;
const unsigned short status_reg = 0x8f;

//registradores de leitura de dados
const unsigned short temp_1 = 0x92;
const unsigned short temp_2 = 0x93;
const unsigned short real_1 = 0x94;
const unsigned short real_2 = 0x95;
const unsigned short imag_1 = 0x96;
const unsigned short imag_2 = 0x97;

const unsigned short rep = 0x40;
const unsigned short inc = 0x30;

unsigned int numBoards = 0; // typedef para cada placa encontrada

char path;

unsigned int Handle0 = 0;
unsigned int Handle1 = 0;

// each function returns an error, error ZERO means no error
int searchError = 0;
int connectError = 0;
int downloadError = 0;
int vendorRequestError = 0;
int disconnectError = 0;

float tempError = 0;

//downloadFunc seems to change firmware_path, that way below works to me
char firmware_path[] = "C:/Program Files (x86)/Analog Devices Inc/AD5933 Evaluation Software Rev 1.0/AD5933_34FW.HEX\0";

const char *MESSAGE = "Erro de conexao";

char * placa[] = {0};

unsigned char dataBuffer = {0};

unsigned int temp;
float tempf;

/* 
const char* DLL_FUNCTION_NAMES [DLL_FUNCTIONS_N] = 
{
  "dll_add",
  "dll_subtract",
  "dll_do_stuff",
  ...
};
*/

//typedef int (__stdcall *dll_func)();

//static const int PID = 0x0456;
//static const int VID = 0xb203;

//dll_func_t dll_func [DLL_FUNCTIONS_N];

/*
for(int i=0; i<DLL_FUNCTIONS_N; i++)
{
  func_ptr[i] = GetProcAddress(hinst_mydll, DLL_FUNCTION_NAMES[i]);

  if(func_ptr[i] == NULL)
  {
    // error handling, most likely you have to terminate the program here
  }
}

typedef struct
{
  int  (__stdcall* dll_add_ptr)(int, int);
  int  (__stdcall* dll_subtract_ptr)(int, int);
  void (__stdcall* dll_do_stuff_ptr)(something);
  ...
} functions_struct;

typedef union
{
  functions_struct  by_type;
  func_ptr_t        func_ptr [DLL_FUNCTIONS_N];
} functions_union;
*/

/*
-chamar dll na header e deixar pronto no principal apenas as funçoes prontas para o threading
-estudar como fazer o prototipo das funçoes e como fazer threading com dll
*/

//const char* DLL_FUNCTION_NAMES [DLL_FUNCTIONS_N] = 
//{
//  "Connect",
//  "Download_Firmware",
//  "Search_For_Boards",
//};

/*
template <typename T>
  T temperatura(T HandleT){
    vendorRequestError = vendor_request(HandleT, 0xde, 0xd, cntrl_1, 1, 1, &dataBuffer);
    //std::cerr << "erro retornado da leitura do regitrador cntrl_1: " << vendorRequestError <<std::endl;
    //std::cout << "lido do registrador cnrl_1: " << (int)dataBuffer << std::endl;

    vendorRequestError = vendor_request(HandleT, 0xde, 0xd, cntrl_1 | ((dataBuffer & 0x07 | 0x90 ) << 8), 0, 0, 0);
    //std::cerr << "erro retornado da escrita no regitrador cntrl_1: " << vendorRequestError <<std::endl;

    //ver estado do registrador status para continauar a leitura de temperatura
    vendorRequestError = vendor_request(HandleT, 0xde, 0xd, temp_1, 1, 1, &dataBuffer);
    //std::cerr << "erro retornado da leitura do regitrador temp_1: " << vendorRequestError <<std::endl;
    //std::cout << "lido do registrador temp_1: " << (int)dataBuffer << std::endl;
    temp = (int)dataBuffer << 8;

    vendorRequestError = vendor_request(HandleT, 0xde, 0xd, temp_2, 1, 1, &dataBuffer);
    //std::cerr << "erro retornado da leitura do regitrador temp_2: " << vendorRequestError <<std::endl;
    //std::cout << "lido do registrador temp_2: " << (int)dataBuffer << std::endl;
    temp |= (int)dataBuffer;
    tempf = ((float)temp)/32;

    //std::cout << temp << std::endl;

    vendorRequestError = vendor_request(HandleT, 0xde, 0xd, cntrl_1 | ((dataBuffer & 0x07 | 0xa0 ) << 8), 0, 0, 0);
    //std::cerr << "erro retornado da escrita no regitrador cntrl_1: " << vendorRequestError <<std::endl;

    return tempf;
}
*/
  /*
  T config(T HandleT){
    //configuracao dos registradores de leitura de impedancia: numero de pontos, freq incial..
    vendorRequestError = vendor_request(HandleT,0xde, addr, settl_cycl1 | (0x00 << 8), 0, 0, 0);
    std::cout << "lido do registrador settl_cycl1: " << databuffer[0] << sstd:endl;
    vendorRequestError = vendor_request(HandleT,0xde, addr, settl_cycl2 | (0xff << 8), 0, 0, 0);
    std::cout << "lido do registrador settl_cycl2: " << databuffer[0] << sstd:endl;

    vendorRequestError = vendor_request(HandleT,0xde, addr, start_freq_1 | (0x01 << 8), 0, 0, 0);
    std::cout << "lido do registrador start_freq_1: " << databuffer[0] << sstd:endl;
    vendorRequestError = vendor_request(HandleT,0xde, addr, start_freq_2 | (0x06 << 8), 0, 0, 0);
    std::cout << "lido do registrador start_freq_2: " << databuffer[0] << sstd:endl;
    vendorRequestError = vendor_request(HandleT,0xde, addr, start_freq_3 | (0x25 << 8), 0, 0, 0);
    std::cout << "lido do registrador start_freq_3: " << databuffer[0] << sstd:endl;

    vendorRequestError = vendor_request(HandleT,0xde, addr, freq_inc_1 | (0x00 << 8), 0, 0, 0);
    std::cout << "lido do registrador freq_inc_1: " << databuffer[0] << sstd:endl;
    vendorRequestError = vendor_request(HandleT,0xde, addr, freq_inc_2 | (0x83 << 8), 0, 0, 0);
    std::cout << "lido do registrador freq_inc_2: " << databuffer[0] << sstd:endl;
    vendorRequestError = vendor_request(HandleT,0xde, addr, freq_inc_3 | (0x13 << 8), 0, 0, 0);
    std::cout << "lido do registrador freq_inc_3: " << databuffer[0] << sstd:endl;

    vendorRequestError = vendor_request(HandleT,0xde, addr, num_freq_1 | (0x00 << 8), 0, 0, 0);
    std::cout << "lido do registrador num_freq_1: " << databuffer[0] << sstd:endl;
    vendorRequestError = vendor_request(HandleT,0xde, addr, num_freq_2 | (f_p << 8), 0, 0, 0);
    std::cout << "lido do registrador num_freq_2: " << databuffer[0] << sstd:endl;
  }
*/

#endif
