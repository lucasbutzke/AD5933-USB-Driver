	.file	"final.cpp"
	.text
	.globl	_search
	.bss
	.align 4
_search:
	.space 4
	.globl	_connect_func
	.align 4
_connect_func:
	.space 4
	.globl	_download_firmware
	.align 4
_download_firmware:
	.space 4
	.globl	_vendor_request
	.align 4
_vendor_request:
	.space 4
	.globl	_disconnect
	.align 4
_disconnect:
	.space 4
	.section .rdata,"dr"
	.align 4
__ZL3VID:
	.long	1110
	.align 4
__ZL3PID:
	.long	45571
__ZL4addr:
	.byte	13
	.align 4
__ZL3ptr:
	.long	176
	.align 4
__ZL3f_p:
	.long	100
	.align 2
__ZL12start_freq_1:
	.word	130
	.align 2
__ZL12start_freq_2:
	.word	131
	.align 2
__ZL12start_freq_3:
	.word	132
	.align 2
__ZL10freq_inc_1:
	.word	133
	.align 2
__ZL10freq_inc_2:
	.word	134
	.align 2
__ZL10freq_inc_3:
	.word	135
	.align 2
__ZL10num_freq_1:
	.word	136
	.align 2
__ZL10num_freq_2:
	.word	137
	.align 2
__ZL11settl_cycl1:
	.word	138
	.align 2
__ZL11settl_cycl2:
	.word	139
	.align 2
__ZL7cntrl_1:
	.word	128
	.align 2
__ZL7cntrl_2:
	.word	129
	.align 2
__ZL10status_reg:
	.word	143
	.align 2
__ZL6temp_1:
	.word	146
	.align 2
__ZL6temp_2:
	.word	147
	.align 2
__ZL6real_1:
	.word	148
	.align 2
__ZL6real_2:
	.word	149
	.align 2
__ZL6imag_1:
	.word	150
	.align 2
__ZL6imag_2:
	.word	151
	.align 2
__ZL3rep:
	.word	64
	.align 2
__ZL3inc:
	.word	48
	.globl	_numBoards
	.bss
	.align 4
_numBoards:
	.space 4
	.globl	_path
_path:
	.space 1
	.globl	_Handle0
	.align 4
_Handle0:
	.space 4
	.globl	_Handle1
	.align 4
_Handle1:
	.space 4
	.globl	_searchError
	.align 4
_searchError:
	.space 4
	.globl	_connectError
	.align 4
_connectError:
	.space 4
	.globl	_downloadError
	.align 4
_downloadError:
	.space 4
	.globl	_vendorRequestError
	.align 4
_vendorRequestError:
	.space 4
	.globl	_disconnectError
	.align 4
_disconnectError:
	.space 4
	.globl	_tempError
	.align 4
_tempError:
	.space 4
	.globl	_firmware_path
	.data
	.align 32
_firmware_path:
	.ascii "C:/Program Files (x86)/Analog Devices Inc/AD5933 Evaluation Software Rev 1.0/AD5933_34FW.HEX\0\0"
	.globl	_MESSAGE
	.section .rdata,"dr"
LC0:
	.ascii "Erro de conexao\0"
	.data
	.align 4
_MESSAGE:
	.long	LC0
	.globl	_placa
	.bss
	.align 4
_placa:
	.space 4
	.globl	_dataBuffer
_dataBuffer:
	.space 1
	.globl	_temp
	.align 4
_temp:
	.space 4
	.globl	_tempf
	.align 4
_tempf:
	.space 4
	.section .rdata,"dr"
__ZStL19piecewise_construct:
	.space 1
.lcomm __ZStL8__ioinit,1,1
	.def	___main;	.scl	2;	.type	32;	.endef
	.align 4
LC1:
	.ascii "C:\\Program Files\\Analog Devices\\USB Drivers\\ADI_CYUSB_USB4.dll\0"
LC2:
	.ascii "Missing dll\0"
LC3:
	.ascii "Search_For_Boards\0"
LC4:
	.ascii "Connect\0"
LC5:
	.ascii "Download_Firmware\0"
LC6:
	.ascii "Vendor_Request\0"
LC7:
	.ascii "Disconnect\0"
	.align 4
LC8:
	.ascii "Factory function could not be resolved. \0"
	.align 4
LC9:
	.ascii "erro retornado da procura das placas: \0"
	.align 4
LC10:
	.ascii "**********************\12numero de placas: \0"
LC11:
	.ascii "path 1: \0"
LC12:
	.ascii "path 2: \0"
LC13:
	.ascii "Handle0: \0"
	.align 4
LC14:
	.ascii "erro retornado do download do firmware: \0"
LC15:
	.ascii "Handle1: \0"
	.align 4
LC16:
	.ascii "erro retornado da desconexao: \0"
LC17:
	.ascii "ultimo erro foi: \0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB1684:
	.cfi_startproc
	.cfi_personality 0,___gxx_personality_v0
	.cfi_lsda 0,LLSDA1684
	leal	4(%esp), %ecx
	.cfi_def_cfa 1, 0
	andl	$-16, %esp
	pushl	-4(%ecx)
	pushl	%ebp
	.cfi_escape 0x10,0x5,0x2,0x75,0
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	.cfi_escape 0xf,0x3,0x75,0x70,0x6
	.cfi_escape 0x10,0x7,0x2,0x75,0x7c
	.cfi_escape 0x10,0x6,0x2,0x75,0x78
	.cfi_escape 0x10,0x3,0x2,0x75,0x74
	subl	$40, %esp
	call	___main
	movl	$LC1, (%esp)
LEHB0:
	call	_LoadLibraryA@4
LEHE0:
	subl	$4, %esp
	movl	%eax, -28(%ebp)
	cmpl	$0, -28(%ebp)
	jne	L2
	movl	$4, (%esp)
	call	___cxa_allocate_exception
	movl	%eax, %ebx
	movl	$8, (%esp)
LEHB1:
	call	__Znwj
LEHE1:
	movl	%eax, %esi
	movl	$LC2, (%esp)
	movl	%esi, %ecx
LEHB2:
	call	__ZNSt13runtime_errorC1EPKc
LEHE2:
	subl	$4, %esp
	movl	%esi, (%ebx)
	movl	$0, 8(%esp)
	movl	$__ZTIPSt13runtime_error, 4(%esp)
	movl	%ebx, (%esp)
LEHB3:
	call	___cxa_throw
L2:
	movl	$LC3, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetProcAddress@8
	subl	$8, %esp
	movl	%eax, _search
	movl	$LC4, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetProcAddress@8
	subl	$8, %esp
	movl	%eax, _connect_func
	movl	$LC5, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetProcAddress@8
	subl	$8, %esp
	movl	%eax, _download_firmware
	movl	$LC6, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetProcAddress@8
	subl	$8, %esp
	movl	%eax, _vendor_request
	movl	$LC7, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_GetProcAddress@8
	subl	$8, %esp
	movl	%eax, _disconnect
	movl	_search, %eax
	testl	%eax, %eax
	je	L3
	movl	_download_firmware, %eax
	testl	%eax, %eax
	je	L3
	movl	_connect_func, %eax
	testl	%eax, %eax
	je	L3
	movl	_vendor_request, %eax
	testl	%eax, %eax
	je	L3
	movl	_disconnect, %eax
	testl	%eax, %eax
	jne	L4
L3:
	movl	$LC8, 4(%esp)
	movl	$__ZSt4cerr, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %ebx
	call	_GetLastError@0
	movl	%eax, (%esp)
	movl	%ebx, %ecx
	call	__ZNSolsEm
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_MESSAGE, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	jmp	L10
L4:
	movl	_search, %eax
	movl	$_path, 12(%esp)
	movl	$_numBoards, 8(%esp)
	movl	$45571, 4(%esp)
	movl	$1110, (%esp)
	call	*%eax
	movl	%eax, _searchError
	movl	$LC9, 4(%esp)
	movl	$__ZSt4cerr, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	_searchError, %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	$LC10, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	_numBoards, %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEj
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	$LC11, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movzbl	_path, %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	$LC12, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	$_path+1, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_connect_func, %eax
	movzbl	_path, %edx
	movsbl	%dl, %edx
	movl	$_Handle0, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$45571, 4(%esp)
	movl	$1110, (%esp)
	call	*%eax
	movl	%eax, %edx
	movl	_connectError, %eax
	orl	%edx, %eax
	movl	%eax, _connectError
	movl	$LC13, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	_Handle0, %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEj
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_download_firmware, %eax
	movl	_Handle0, %edx
	movl	$_firmware_path, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _downloadError
	movl	$LC14, 4(%esp)
	movl	$__ZSt4cerr, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	_downloadError, %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_connect_func, %eax
	movl	$_path+1, %edx
	movzbl	(%edx), %edx
	movsbl	%dl, %edx
	movl	$_Handle1, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$45571, 4(%esp)
	movl	$1110, (%esp)
	call	*%eax
	movl	%eax, %edx
	movl	_connectError, %eax
	orl	%edx, %eax
	movl	%eax, _connectError
	movl	$LC15, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	_Handle1, %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEj
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_download_firmware, %eax
	movl	_Handle1, %edx
	movl	$_firmware_path, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, %edx
	movl	_downloadError, %eax
	orl	%edx, %eax
	movl	%eax, _downloadError
	movl	$LC14, 4(%esp)
	movl	$__ZSt4cerr, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	_downloadError, %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_Handle0, %eax
	movl	%eax, (%esp)
	call	__Z6configj
	movl	_Handle1, %eax
	movl	%eax, (%esp)
	call	__Z6configj
	movl	_Handle1, %edx
	movl	_Handle0, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	__Z5sweepjj
	movl	_disconnect, %eax
	movl	_Handle0, %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _disconnectError
	movl	$LC16, 4(%esp)
	movl	$__ZSt4cerr, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	_downloadError, %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_disconnect, %eax
	movl	_Handle1, %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _disconnectError
	movl	$LC16, 4(%esp)
	movl	$__ZSt4cerr, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	_downloadError, %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	$LC17, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %ebx
	call	_GetLastError@0
	movl	%eax, (%esp)
	movl	%ebx, %ecx
	call	__ZNSolsEm
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	_FreeLibrary@4
	subl	$4, %esp
	movl	$0, %eax
	jmp	L10
L9:
	movl	%eax, %edi
	movl	$8, 4(%esp)
	movl	%esi, (%esp)
	call	__ZdlPvj
	movl	%edi, %esi
	jmp	L7
L8:
	movl	%eax, %esi
L7:
	movl	%ebx, (%esp)
	call	___cxa_free_exception
	movl	%esi, %eax
	movl	%eax, (%esp)
	call	__Unwind_Resume
LEHE3:
L10:
	leal	-16(%ebp), %esp
	popl	%ecx
	.cfi_restore 1
	.cfi_def_cfa 1, 0
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
	.cfi_restore 5
	leal	-4(%ecx), %esp
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1684:
	.def	___gxx_personality_v0;	.scl	2;	.type	32;	.endef
	.section	.gcc_except_table,"w"
LLSDA1684:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 LLSDACSE1684-LLSDACSB1684
LLSDACSB1684:
	.uleb128 LEHB0-LFB1684
	.uleb128 LEHE0-LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 LEHB1-LFB1684
	.uleb128 LEHE1-LEHB1
	.uleb128 L8-LFB1684
	.uleb128 0
	.uleb128 LEHB2-LFB1684
	.uleb128 LEHE2-LEHB2
	.uleb128 L9-LFB1684
	.uleb128 0
	.uleb128 LEHB3-LFB1684
	.uleb128 LEHE3-LEHB3
	.uleb128 0
	.uleb128 0
LLSDACSE1684:
	.text
	.section .rdata,"dr"
LC18:
	.ascii "lendo placa: \0"
	.text
	.globl	__Z7celsiusj
	.def	__Z7celsiusj;	.scl	2;	.type	32;	.endef
__Z7celsiusj:
LFB1685:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	$LC18, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEj
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$128, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	andl	$7, %edx
	orl	$-112, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%edx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$146, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, _temp
	movl	_temp, %eax
	movl	%eax, (%esp)
	movl	$__ZSt4cout, %ecx
	call	__ZNSolsEj
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$147, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %edx
	movl	_temp, %eax
	orl	%edx, %eax
	movl	%eax, _temp
	movl	_temp, %eax
	movl	%eax, (%esp)
	movl	$__ZSt4cout, %ecx
	call	__ZNSolsEj
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_temp, %eax
	movl	%eax, -24(%ebp)
	movl	$0, -20(%ebp)
	fildq	-24(%ebp)
	fstps	-12(%ebp)
	flds	-12(%ebp)
	flds	LC19
	fdivrp	%st, %st(1)
	fstps	_tempf
	flds	_tempf
	fstps	(%esp)
	movl	$__ZSt4cout, %ecx
	call	__ZNSolsEf
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	andl	$7, %edx
	orl	$-96, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%edx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1685:
	.globl	__Z6configj
	.def	__Z6configj;	.scl	2;	.type	32;	.endef
__Z6configj:
LFB1686:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$138, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$65419, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$386, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$1667, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$9604, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$133, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$33670, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$4999, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$136, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	$25737, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1686:
	.section .rdata,"dr"
LC21:
	.ascii "lendo impedancia\0"
LC22:
	.ascii "real: \0"
LC23:
	.ascii ":: imag: \0"
LC24:
	.ascii ":: freq: \0"
	.text
	.globl	__Z5sweepjj
	.def	__Z5sweepjj;	.scl	2;	.type	32;	.endef
__Z5sweepjj:
LFB1687:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	_vendor_request, %eax
	movl	_Handle0, %edx
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$128, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	orl	$-80, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %ecx
	movl	_Handle0, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	_Handle0, %edx
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$128, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	orl	$16, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %ecx
	movl	_Handle0, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	_Handle1, %edx
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$128, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	orl	$-80, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %ecx
	movl	_Handle1, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movl	_Handle1, %edx
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$128, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	orl	$16, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %ecx
	movl	_Handle1, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z12iniciarSweepj
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z12iniciarSweepj
	movl	$1, -12(%ebp)
	movl	$LC21, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
L16:
	cmpl	$100, -12(%ebp)
	jg	L17
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$143, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	movl	%eax, -16(%ebp)
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$143, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	12(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	andl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L16
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$148, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, -20(%ebp)
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$149, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	orl	%eax, -20(%ebp)
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$150, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, -24(%ebp)
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$151, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	orl	%eax, -24(%ebp)
	movl	$LC22, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$LC23, 4(%esp)
	movl	%eax, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$LC24, 4(%esp)
	movl	%eax, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$148, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	12(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, -28(%ebp)
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$149, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	12(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	orl	%eax, -28(%ebp)
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$150, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	12(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, -32(%ebp)
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$151, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	12(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movzbl	_dataBuffer, %eax
	movzbl	%al, %eax
	orl	%eax, -32(%ebp)
	movl	$LC22, 4(%esp)
	movl	$__ZSt4cout, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$LC23, 4(%esp)
	movl	%eax, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$LC24, 4(%esp)
	movl	%eax, (%esp)
	call	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	movl	%edx, %ecx
	call	__ZNSolsEi
	subl	$4, %esp
	movl	$__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_, (%esp)
	movl	%eax, %ecx
	call	__ZNSolsEPFRSoS_E
	subl	$4, %esp
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z12repFreqSweetj
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	__Z12repFreqSweetj
	addl	$1, -12(%ebp)
	jmp	L16
L17:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1687:
	.globl	__Z12iniciarSweepj
	.def	__Z12iniciarSweepj;	.scl	2;	.type	32;	.endef
__Z12iniciarSweepj:
LFB1688:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$128, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	orl	$32, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%edx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1688:
	.globl	__Z12incFreqSweepj
	.def	__Z12incFreqSweepj;	.scl	2;	.type	32;	.endef
__Z12incFreqSweepj:
LFB1689:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$128, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	orl	$48, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%edx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1689:
	.globl	__Z12repFreqSweetj
	.def	__Z12repFreqSweetj;	.scl	2;	.type	32;	.endef
__Z12repFreqSweetj:
LFB1690:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	_vendor_request, %eax
	movl	$_dataBuffer, 24(%esp)
	movl	$1, 20(%esp)
	movl	$1, 16(%esp)
	movl	$128, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	movl	_vendor_request, %eax
	movzbl	_dataBuffer, %edx
	orl	$64, %edx
	movzbl	%dl, %edx
	sall	$8, %edx
	orb	$-128, %dl
	movzwl	%dx, %edx
	movl	$0, 24(%esp)
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%edx, 12(%esp)
	movl	$13, 8(%esp)
	movl	$-34, 4(%esp)
	movl	8(%ebp), %edx
	movl	%edx, (%esp)
	call	*%eax
	movl	%eax, _vendorRequestError
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE1690:
	.globl	__ZTIPSt13runtime_error
	.section	.rdata$_ZTIPSt13runtime_error,"dr"
	.linkonce same_size
	.align 4
__ZTIPSt13runtime_error:
	.long	__ZTVN10__cxxabiv119__pointer_type_infoE+8
	.long	__ZTSPSt13runtime_error
	.long	0
	.long	__ZTISt13runtime_error
	.globl	__ZTSPSt13runtime_error
	.section	.rdata$_ZTSPSt13runtime_error,"dr"
	.linkonce same_size
	.align 4
__ZTSPSt13runtime_error:
	.ascii "PSt13runtime_error\0"
	.globl	__ZTISt13runtime_error
	.section	.rdata$_ZTISt13runtime_error,"dr"
	.linkonce same_size
__ZTISt13runtime_error:
	.long	__ZTVN10__cxxabiv120__si_class_type_infoE+8
	.long	__ZTSSt13runtime_error
	.long	__ZTISt9exception
	.globl	__ZTSSt13runtime_error
	.section	.rdata$_ZTSSt13runtime_error,"dr"
	.linkonce same_size
	.align 4
__ZTSSt13runtime_error:
	.ascii "St13runtime_error\0"
	.globl	__ZTISt9exception
	.section	.rdata$_ZTISt9exception,"dr"
	.linkonce same_size
__ZTISt9exception:
	.long	__ZTVN10__cxxabiv117__class_type_infoE+8
	.long	__ZTSSt9exception
	.globl	__ZTSSt9exception
	.section	.rdata$_ZTSSt9exception,"dr"
	.linkonce same_size
	.align 4
__ZTSSt9exception:
	.ascii "St9exception\0"
	.text
	.def	___tcf_0;	.scl	3;	.type	32;	.endef
___tcf_0:
LFB2190:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	$__ZStL8__ioinit, %ecx
	call	__ZNSt8ios_base4InitD1Ev
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE2190:
	.def	__Z41__static_initialization_and_destruction_0ii;	.scl	3;	.type	32;	.endef
__Z41__static_initialization_and_destruction_0ii:
LFB2189:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	cmpl	$1, 8(%ebp)
	jne	L24
	cmpl	$65535, 12(%ebp)
	jne	L24
	movl	$__ZStL8__ioinit, %ecx
	call	__ZNSt8ios_base4InitC1Ev
	movl	$___tcf_0, (%esp)
	call	_atexit
L24:
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE2189:
	.def	__GLOBAL__sub_I_search;	.scl	3;	.type	32;	.endef
__GLOBAL__sub_I_search:
LFB2191:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	$65535, 4(%esp)
	movl	$1, (%esp)
	call	__Z41__static_initialization_and_destruction_0ii
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE2191:
	.section	.ctors,"w"
	.align 4
	.long	__GLOBAL__sub_I_search
	.section .rdata,"dr"
	.align 4
LC19:
	.long	1107296256
	.ident	"GCC: (MinGW.org GCC-8.2.0-3) 8.2.0"
	.def	_LoadLibraryA@4;	.scl	2;	.type	32;	.endef
	.def	___cxa_allocate_exception;	.scl	2;	.type	32;	.endef
	.def	__Znwj;	.scl	2;	.type	32;	.endef
	.def	__ZNSt13runtime_errorC1EPKc;	.scl	2;	.type	32;	.endef
	.def	___cxa_throw;	.scl	2;	.type	32;	.endef
	.def	_GetProcAddress@8;	.scl	2;	.type	32;	.endef
	.def	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc;	.scl	2;	.type	32;	.endef
	.def	_GetLastError@0;	.scl	2;	.type	32;	.endef
	.def	__ZNSolsEm;	.scl	2;	.type	32;	.endef
	.def	__ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_;	.scl	2;	.type	32;	.endef
	.def	__ZNSolsEPFRSoS_E;	.scl	2;	.type	32;	.endef
	.def	__ZNSolsEi;	.scl	2;	.type	32;	.endef
	.def	__ZNSolsEj;	.scl	2;	.type	32;	.endef
	.def	__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_c;	.scl	2;	.type	32;	.endef
	.def	_FreeLibrary@4;	.scl	2;	.type	32;	.endef
	.def	__ZdlPvj;	.scl	2;	.type	32;	.endef
	.def	___cxa_free_exception;	.scl	2;	.type	32;	.endef
	.def	__Unwind_Resume;	.scl	2;	.type	32;	.endef
	.def	__ZNSolsEf;	.scl	2;	.type	32;	.endef
	.def	__ZNSt8ios_base4InitD1Ev;	.scl	2;	.type	32;	.endef
	.def	__ZNSt8ios_base4InitC1Ev;	.scl	2;	.type	32;	.endef
	.def	_atexit;	.scl	2;	.type	32;	.endef
