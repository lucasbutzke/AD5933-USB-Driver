#if !defined(__cplusplus) || (__cplusplus < 201103L)
#error A C++11 compiler is required!
#endif

#define _WINRT_DLL

#define _WIN32_WINNT 0x0A00  // definindo WINDOWS 10 para trabalhar com as threads

#include "iostream"
#include "windows.h"
#include "Bibliotecas/mingw-std-threads-master/mingw.thread.h"
#include "Bibliotecas/mingw-std-threads-master/mingw.mutex.h"


using namespace std;
std::mutex mtx;

bool a = FALSE;

void escrever(int j){
	mtx.lock();
	while(!a){
	std::cout << j << " thread indo\n" << std::endl;
	if(i>1){
		a = TRUE;
	}
	std::cout << GetTickCount() << "\n" << std::endl;
	i++;
	}
	mtx.unlock();
}

int main(){
	std::cout << "comecanco programa" << std::endl;

	std::thread threads[10];

	for(int i = 0; i < 10; i++)
		threads[i] = std::thread(escrever, i + 1); 

	for(auto& th : threads) th.join();

	return 0;
}