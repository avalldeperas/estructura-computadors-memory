section .data               
;Canviar Nom i Cognom per les vostres dades.
developer db "_Albert Valldeperas_",0

;Constants que també estan definides en C.
ROWDIM  equ 4       ;files de la matriu.
COLDIM  equ 5       ;columnes de la matriu.

section .text            

;Variables definides en Assemblador.
global developer  

;Subrutines d'assemblador que es criden des de C.
global posCurScreenP1, showDigitsP1, updateBoardP1,
global moveCursorP1, openCardP1
global playP1

;Variables definides en C.
extern charac, rowScreen, colScreen, value, state
extern pos, moves, pairs, vPos, mCards, mOpenCards

;Funcions de C que es criden des de assemblador
extern clearScreen_C,  gotoxyP1_C, getchP1_C, printchP1_C
extern printBoardP1_C, printMessageP1_C


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATENCIÓ: 
;;   Recordeu que en assemblador les variables i els paràmetres 
;;   de tipus 'char' s'han d'assignar a registres de tipus  
;;   BYTE (1 byte): al, ah, bl, bh, cl, ch, dl, dh, sil, dil, ..., r15b
;;   les de tipus 'short' s'han d'assignar a registres de tipus 
;;   WORD (2 bytes): ax, bx, cx, dx, si, di, ...., r15w
;;   les de tipus 'int' s'han d'assignar a registres de tipus 
;;   DWORD (4 bytes): eax, ebx, ecx, edx, esi, edi, ...., r15d
;;   les de tipus 'long' s'han d'assignar a registres de tipus 
;;   QWORD (8 bytes): rax, rbx, rcx, rdx, rsi, rdi, ...., r15
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Les subrutines en assemblador que heu d'implementar són:
;;   posCurScreenP1, showDigitsP1, updateBoardP1,
;;   moveCursorP1, openCardP1.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aquesta subrutina es dóna feta. NO LA PODEU MODIFICAR.
; Situar el cursor a la fila indicada per la variable (rowScreen) i a 
; la columna indicada per la variable (colScreen) de la pantalla,
; cridant la funció gotoxyP1_C.
; 
; Variables globals utilitzades:   
; (rowScreen): Fila de la pantalla on posicionem el cursor.
; (colScreen): Columna de la pantalla on posicionem el cursor.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gotoxyP1:
   push rbp
   mov  rbp, rsp
   ;guardem l'estat dels registres del processador perquè
   ;les funcions de C no mantenen l'estat dels registres.
   push rax
   push rbx
   push rcx
   push rdx
   push rsi
   push rdi
   push r8
   push r9
   push r10
   push r11
   push r12
   push r13
   push r14
   push r15

   call gotoxyP1_C
 
   pop r15
   pop r14
   pop r13
   pop r12
   pop r11
   pop r10
   pop r9
   pop r8
   pop rdi
   pop rsi
   pop rdx
   pop rcx
   pop rbx
   pop rax

   mov rsp, rbp
   pop rbp
   ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aquesta subrutina es dóna feta. NO LA PODEU MODIFICAR.
; Mostrar un caràcter guardat a la variable (charac) a la pantalla, 
; en la posició on està el cursor, cridant la funció printchP1_C.
; 
; Variables globals utilitzades:   
; (charac): Caràcter que volem mostrar.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printchP1:
   push rbp
   mov  rbp, rsp
   ;guardem l'estat dels registres del processador perquè
   ;les funcions de C no mantenen l'estat dels registres.
   push rax
   push rbx
   push rcx
   push rdx
   push rsi
   push rdi
   push r8
   push r9
   push r10
   push r11
   push r12
   push r13
   push r14
   push r15

   call printchP1_C
 
   pop r15
   pop r14
   pop r13
   pop r12
   pop r11
   pop r10
   pop r9
   pop r8
   pop rdi
   pop rsi
   pop rdx
   pop rcx
   pop rbx
   pop rax

   mov rsp, rbp
   pop rbp
   ret
   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aquesta subrutina es dóna feta. NO LA PODEU MODIFICAR.
; Llegir una tecla i guarda el caràcter associat a la variable (charac)
; sense mostrar-la per pantalla, cridant la funció getchP1_C. 
; 
; Variables globals utilitzades:   
; (charac): Caràcter que llegim de teclat.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getchP1:
   push rbp
   mov  rbp, rsp
   ;guardem l'estat dels registres del processador perquè
   ;les funcions de C no mantenen l'estat dels registres.
   push rax
   push rbx
   push rcx
   push rdx
   push rsi
   push rdi
   push r8
   push r9
   push r10
   push r11
   push r12
   push r13
   push r14
   push r15
   push rbp

   call getchP1_C
 
   pop rbp
   pop r15
   pop r14
   pop r13
   pop r12
   pop r11
   pop r10
   pop r9
   pop r8
   pop rdi
   pop rsi
   pop rdx
   pop rcx
   pop rbx
   pop rax
   
   mov rsp, rbp
   pop rbp
   ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Posicionar el cursor a la pantalla, dins el tauler, en funció de la
; posició del cursor dins la matriu, indicada per la variable 
; (pos) de tipus int(DWORD)4bytes, a partir de la posició [10,12]
; de la pantalla.
; Per a calcular la posició del cursor a pantalla (rowScreen) i 
; (colScreen) utilitzar aquestes fórmules:
; rowScreen=10+((pos/COLDIM)*2);
; colScreen=12+((pos%COLDIM)*4);
; Per a posicionar el cursor a la pantalla s'ha de cridar a la 
; subrutina gotoxyP1.
;
; Variables globals utilitzades:	
; (pos)      : Posició del cursor dins la matriu.
; (rowScreen): Fila de la pantalla on posicionem el cursor.
; (colScreen): Columna de la pantalla on posicionem el cursor.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
posCurScreenP1:
   push rbp
   mov  rbp, rsp
   
   push rax
   push rbx
   push rcx
   
   mov rbx, QWORD[pos]
   mov rcx, 0               
                             
   div_loop:                   	;calculates quotient and remainder 
      sub rbx, COLDIM  
      inc rcx                    
      cmp rbx, COLDIM
      jge div_loop
      
								;calculates rowScreen from quotient
   mov rax, rcx					;moves quotient to register (pos/COLDIM)
   sal rax, 1 					;multiplies x2 ((pos/COLDIM)*2)
   add rax, 10					;adds 10 to the total (10+((pos/COLDIM)*2))
   mov QWORD[rowScreen], rax
   
								;calculates colScreen from remainder
   mov rax, rbx 				;moves remainder to register (pos%COLDIM)
   sal rax, 2					;multiplies x4 	((pos%COLDIM)*4)
   add rax, 12   				;adds 12 to the total (12+((pos%COLDIM)*4))
   mov QWORD[colScreen], rax   
   
   call gotoxyP1
   
   pop rcx
   pop rbx
   pop rax
   
   mov rsp, rbp
   pop rbp
   ret



;;;;;
; Converteix un valor (value) de short int(2 bytes) (entre 0 i 99) en  
; dos caràcters ASCII que representin aquest valor. (27 -> '2' '7').
; S'ha de dividir el valor entre 10, el quocient representarà les 
; desenes i el residu les unitats, i després s'han de convertir a ASCII
; sumant '0' o 48(codi ASCII de '0') a les unitats i a les desenes.
; Mostrar els dígits (caràcter ASCII) a partir de la fila indicada
; per la variable (rowScreen) i a la columna indicada per la variable
; (colScreen).
; Per a posicionar el cursor es cridar a la subrutina gotoxyP1 i per a 
; mostrar els caràcters a la subrutina printchP1.
; 
; Variables globals utilitzades:	
; (rowScreen): Fila de la pantalla on posicionem el cursor.
; (colScreen): Columna de la pantalla on posicionem el cursor.
; (charac)   : Caràcter a escriure a pantalla.
; (value)    : Valor que volem mostrar.
;;;;;
showDigitsP1:
   push rbp
   mov  rbp, rsp
   
   push ax 
   push cx
   push dx
   
   mov ax, WORD[value]
   
   cmp ax, 0   						;avoid division by 0
   je end_division
   
   mov dx, 0						;cleans dx to avoid floating point exp
   mov cx, 10
   div cx
   
   add ax, '0'    					;tens
   add dx, '0'						;units
  
   end_division:
   
   mov BYTE[charac], al				;print tens
   call gotoxyP1 
   call printchP1
   
   inc DWORD[colScreen]				;moves cursor to the right
   
   mov BYTE[charac], dl 			; print units
   call gotoxyP1
   call printchP1
   
   pop dx
   pop cx
   pop ax
   
   mov rsp, rbp
   pop rbp
   ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Mostrar els valors de la matriu (mOpenCards) dins el tauler, 
; a les posicions corresponents, els intents que queden (moves)
; i les parelles que s'han de fer (pairs).
; S'ha de recórrer tota la matriu (mOpenCards), d'esquerra a dreta i 
; de dalt a baix, cada posició és de tipus char(BYTE)1byte, 
; i per a cada element de la matriu fer:
; Posicionar el cursor en el tauler en funció de les variables 
; (rowScreen) fila i (colScreen) columna cridant la subrutina gotoxyP1.
; Les variables (rowScreen) i (colScreen) s'inicialitzaran a 10 i 14
; respectivament, que és la posició a pantalla de la casella [0][0].
; Mostrar els caràcters de cada posició de la matriu (mOpenCards) 
; cridant la subrutina printchP1.
; Després, mostrar els intents que queden (moves) de tipus short(WORD)2bytes, 
; a partir de la posició [19,15] de la pantalla i mostrar les parelles
; que falten fer (pairs) de tipus short(WORD)2bytes, a partir de la 
; posició [19,24] de la pantalla cridant la subrutina showDigitsP1.
; 
; Variables globals utilitzades:		
; (rowScreen) : Fila de la pantalla on posicionem el cursor.
; (colScreen) : Columna de la pantalla on posicionem el cursor.
; (charac)    : Caràcter a escriure a pantalla.
; (value)     : Valor que volem mostrar.
; (mOpenCards): Matriu on guardem les targetes del joc.
; (moves)     : Intents que queden.
; (pairs)     : Parelles que falten fer.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
updateBoardP1:
   push rbp
   mov  rbp, rsp
   
   push rax
   push rbx
   push rcx
   push rdx
   push rsi
   
   mov eax, 0       			;i
   mov ebx, 0       			;j
   mov ecx, 10					;rowScreenAux
   mov edx, 12					;colScreenAux   
   mov esi, 0					;index to access matrix

   loop_i:	
	cmp eax, ROWDIM
	jge end_loop_i

	mov ebx, 0					;set j=0
	mov edx, 12					;reset colScreenAux
	mov DWORD[rowScreen], ecx	
   
	loop_j:
		cmp ebx, COLDIM				
		jge end_loop_j						;if j>=COLDIM, then next row

		mov DWORD[colScreen], edx		
		call gotoxyP1
		
		mov r8b, BYTE[mOpenCards + esi]		;charac = mOpenCards[i][j];
		mov BYTE[charac], r8b
		call printchP1
												
		add edx, 4							;colScreen = colScreen + 4;
		inc esi								;matrix index++
		inc ebx								;j++
		jmp loop_j
	
	end_loop_j:
	
	inc eax									;i++
	add ecx, 2								;rowScreen = rowScreen + 2
	
	jmp loop_i
   
   end_loop_i:
	
   mov DWORD[rowScreen], 19 				;print moves
   mov DWORD[colScreen], 15
   mov r8w, WORD[moves]
   mov WORD[value], r8w
   call showDigitsP1
   
   mov DWORD[colScreen], 24					;print pairs
   mov r8w, WORD[pairs]
   mov WORD[value], r8w
   call showDigitsP1
   
   pop rsi
   pop rdx
   pop rcx
   pop rbx
   pop rax
   
   mov rsp, rbp
   pop rbp
   ret   
   
   

;;;;;  
; Actualitzar la posició del cursor dins la matriu indicada per la 
; variable(pos), de tipus int(DWORD)4bytes, en funció de la tecla 
; premuda (charac), de tipus char(BYTE)1byte, 
; (i: amunt, j:esquerra, k:avall, l:dreta).
; Comprovar que no sortim de la matriu, (pos) només pot prendre valors
; de posicions dins de la matriu [0 : (ROWDIM*COLDIM)-1].
; Per comprovar-ho cal calcular la fila i columna dins la matriu:
; fila    = pos / COLDIM, que pot pendre valors [0 : (ROWDIM-1)].
; columna = pos % COLDIM, que pot pendre valors [0 : (COLDIM-1)].
; Per canviar de fila sumem o restem COLDIM a (pos) i per canviar de 
; columna sumem o restem 1 a (pos) perquè cada posició de la matriu 
; és de tipus char(BYTE)1byte i té ROWDIM files i COLDIM columnes.
; Si el moviment surt de la matriu, no fer el moviment.
; 
; NO s'ha de posicionar el cursor a la pantalla cridant posCurScreenP1.
; 
; Variables globals utilitzades:	
; (charac): Caràcter que llegim de teclat.
; (pos)   : Posició del cursor dins la matriu.
;;;;;
moveCursorP1:  
   push rbp
   mov  rbp, rsp
   
   push rax
   push rbx
   push rdx
   push rsi
   
   mov sil, BYTE[charac]
   mov eax, DWORD[pos]		; pos to be divided
   mov ebx, eax				; store temp pos
   mov edx, 0
   
   mov ecx, COLDIM
   div ecx					; dividend (i) on eax, remainder (j) on edx
   
   switch:
   
   case_i:
		cmp sil, 'i'				;UP
		jne case_k
		
		cmp eax, 0				  	;if (i > 0) 
		jle case_done
		sub ebx, COLDIM				;pos=pos-COLDIM
		
		jmp case_done
   
   case_k:
		cmp sil, 'k'				;DOWN
		jne case_j
		
		cmp eax, ROWDIM	- 1 		;if (i < (ROWDIM-1)) 
		jge case_done
		add ebx, COLDIM 			;pos=pos+COLDIM
		
		jmp case_done		   
   
   case_j:
		cmp sil, 'j'				;LEFT
		jne case_l
							
		cmp edx, 0					;if (j > 0) 
		jle case_done
		dec ebx 					;pos=pos-1
		jmp case_done
   
   case_l:
		cmp sil, 'l'				;RIGHT
		jne case_default
		
		cmp edx, COLDIM - 1			;if (j < (COLDIM-1)) 
		jge	case_done				
		inc ebx						;pos=pos+1
		
		jmp case_done
   
   case_default:
		; charac not supported
   
   case_done:
	
   mov DWORD[pos], ebx
   
   pop rsi
   pop rdx
   pop rbx
   pop rax
         
   mov rsp, rbp
   pop rbp
   ret


;;;;;  
; Obrir la targeta de la matriu (mCards) de la posició indicada pel
; cursor dins la matriu indicada per la variable (pos). 
; Guardar la posició de la targeta que estem obrint i que tenim a la
; variable (pos) de tipus int(DWORD)4bytes al vector (vPos), de tipus
; int(DWORD)4bytes, on a la posició [0] és per a guardar la posició de
; la 1a targeta que girem (quan state=0) i a la posició [1] és per 
; guardar la posició de la 2a targeta que girem (quan state=1).
; vPos[0]:[vPos+0]: Posició de la 1a targeta. 
; vPos[1]:[vPos+4]: Posició de la 2a targeta.
; Per accedir a la matriu en C cal calcular la fila i la columna:
; fila    = pos / COLDIM, que pot prendre valors [0 : (ROWDIM-1)].
; columna = pos % COLDIM, que pot prendre valors [0 : (COLDIM-1)].
; En assemblador no és necessari.
; Si la targeta no està girada (!='x') posar-la a la matriu 
; (mOpenCards) per a que es mostri.
; Marcar-la amb una 'x'(minúscula) a la mateixa posició de la matriu 
; (mCards) per a saber que està girada.
; Passar al següent estat (state++).
; 
; NO s'ha de mostrar la matriu amb els canvis, es fa a updateBoardP1().
; 
; Variables globals utilitzades:
; (mCards)    : Matriu on guardem les targetes del joc.
; (mOpenCards): Matriu on tenim les targetes obertes del joc.
; (pos)       : Posició del cursor dins la matriu.
; (state)     : Estat del joc.
; (vPos)      : Adreça del vector amb les posicions de les targetes obertes.
;;;;;
openCardP1:  
   push rbp
   mov  rbp, rsp
   
   push rax
   push rbx
   push rcx
   
   mov eax, DWORD[state]			;[vPos+state*4] = [vPos + 0*4] || [vPos + 1*4]
   sal eax, 2
   
   mov ebx, DWORD[pos]   
   
   mov [vPos + eax], ebx 				;vPos[state] = pos;
   
   mov ecx, [mCards + ebx]				;mCards[i][j] is equal to mCards[pos]
   
   cmp ecx, 'x'							;if (mCards[i][j] != 'x')
   jne end_if
   
   mov DWORD[mOpenCards + ebx], ecx 	;mOpenCards[i][j] = mCards[i][j];
   mov dl, 'x' 
   mov [mCards + ebx], dl				;mCards[i][j] = 'x';
   inc DWORD[state]						;state++
   
   end_if:
   
   pop rcx
   pop rbx
   pop rax
   
   mov rsp, rbp
   pop rbp
   ret


;;;;;
; Aquesta subrutina es dóna feta. NO LA PODEU MODIFICAR.
; Mostrar un missatge a sota del tauler segons el valor de la variable 
; (state) cridant la subrutina printMessageP1.
; (state) 0: 0 targetes obertes.
;         1: 1 Targeta oberta.
;         2: 2 Targetes obertes.
;         5: Sortir, hem premut la tecla 'ESC' per a sortir.
;         7: Perd, s'han exhaurits els intents .
; Si (state>1) demana que es premi una tecla per a poder-lo llegir.
;  
; Variables globals utilitzades:	
; (rowScreen) : Fila de la pantalla on posicionem el cursor.
; (colScreen) : Columna de la pantalla on posicionem el cursor.
; (state)     : Estat del joc.
;;;;;
printMessageP1:
   push rbp
   mov  rbp, rsp
   ;guardem l'estat dels registres del processador perquè
   ;les funcions de C no mantenen l'estat dels registres.
   push rax
   push rbx
   push rcx
   push rdx
   push rsi
   push rdi
   push r8
   push r9
   push r10
   push r11
   push r12
   push r13
   push r14
   push r15
   push rbp

   call printMessageP1_C
 
   pop rbp
   pop r15
   pop r14
   pop r13
   pop r12
   pop r11
   pop r10
   pop r9
   pop r8
   pop rdi
   pop rsi
   pop rdx
   pop rcx
   pop rbx
   pop rax

   mov rsp, rbp
   pop rbp
   ret

;;;;;
; Joc del Memory
; Subrutina principal del joc.
; Trobat totes les parelles del tauler (10 parelles), girant les
; targetes de dues en dues. Com a màxim es poden fer 10 intents.
; 
; Pseudo-codi:
; Inicialitzar l'estat del joc, (state=0).
; Esborrar la pantalla  (cridar la funció clearScreen_C).
; Mostrar el tauler de joc (cridar la funció printBoardP1_C).
; Actualitzar el tauler de joc, els valors dels intents que queden (moves)
; i de les parelles que falten fer (pairs) cridant la subrutina updateBoardP1.
; Mentre (state<3) fer:
;   Mostrar un missatge,  segons el valor de la variable (state),
;   per a indicar que s'ha de fer, cridant la subrutina printMessageP1.
;   Actualitzar la posició del cursor a la pantalla a partir de la 
;   variable (pos) amb la posició del cursor dins la matriu, cridant
;   la subrutina posCurScreenP1.
;   Llegir una tecla, cridar la subrutina getchP1. 
;   Segons la tecla llegida cridarem a les subrutines que corresponguin.
;     - ['i','j','k' o 'l'] desplaçar el cursor segons la direcció 
;       triada, cridant la subrutina moveCursorP1).
;     - '<SPACE>'(codi ASCII 32) girar la targeta on hi ha el cursor
;       cridant la subrutina openCardP1.
;       [No es comprova que es facin parelles]
;       Si s'han girat dues targetes (state>1) posar (state=1) i
;         decrementar els intents que queden (moves).
;         Si no queden intents (moves==0), canviar a l'estat 
;            d'intents exhaurits (state=7).
;         Mostrar un missatge, segons el valor de la variable (state)
;         per a indicar que ha passat, cridant la subrutina printMessageP2.     
;       Actualitzar el tauler de joc i els valors dels moviments que
;       queden (moves) i de les parelles que falten fer (pairs) cridant 
;       la subrutina updateBoardP1.
;    - '<ESC>'  (codi ASCII 27) posar (state = 5) per a sortir.
;       No sortira si només s'ha girat una targeta (state!=1).
; Fi mentre.
; Sortir: S'acaba el joc.
; 
; Variables globals utilitzades:	
; (state) : Estat del joc.
; (charac): Caràcter que llegim de teclat.
; (moves) : Intents que queden.
; (pairs) : Parelles que falten fer
;;;;;  
playP1:
   push rbp
   mov  rbp, rsp
   
   push rax
   
   mov DWORD[state], 0        ;state = 0;
   mov WORD[moves], 10        ;moves = 10;
   mov WORD[pairs], (ROWDIM * COLDIM)/2 ;pairs = (ROWDIM * COLDIM)/2;
   mov DWORD[pos], 8          ;pos = 8;
   
   call clearScreen_C
   call printBoardP1_C        ;printBoard1_C();
     
   call updateBoardP1

   playP1_Loop:               ;while  {  //Bucle principal.
   cmp  DWORD[state], 3       ;(state < 3)
   jge  playP1_End
      
      call printMessageP1     ;printMessageP1_C();
      call posCurScreenP1     ;posCurScreenP1_C();     
      call getchP1            ;charac = getchP1_C();   
      mov  al, BYTE[charac]
      
      playP2_ijkl:
      cmp al, 'i'             ;if (charac>='i' {
      jl  playP1_TurnUp
      cmp al, 'l'             ;&& charac<='l') 
      jg  playP1_TurnUp
         call moveCursorP1    ;moveCursorP1_C();
         jmp playP1_EndLoop
      playP1_TurnUp:
      cmp al, 32              ;if (charac==32) {
      jne playP1_Esc
         call openCardP1      ;state = openCardP1_C();
         cmp DWORD[state], 1       ;if (state > 1) {
         jle playP1_Update
			mov DWORD[state], 0    ;state = 0;
			dec WORD[moves]        ;moves--;
			cmp WORD[moves], 0     ;if (moves == 0) 
			jne playP1_EndIf
			   mov DWORD[state], 7 ;state = 7;
			playP1_EndIf:
			call printMessageP1    ;printMessageP1_C();
         playP1_Update:
         call updateBoardP1   ;updateBoardP1_C();
         jmp playP1_EndLoop
      playP1_Esc:
      cmp al, 27              ;if ( (charac==27)
      jne playP1_EndLoop
      cmp DWORD[state], 1     ;&& (state!=1) ) {
      je  playP1_EndLoop
         mov DWORD[state], 5  ;state = 5;
      playP1_EndLoop:
   jmp playP1_Loop
   
   playP1_End:
   pop rax  
   
   mov rsp, rbp
   pop rbp
   ret
