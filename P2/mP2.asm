section .data               
;Canviar Nom i Cognom per les vostres dades.
developer db "_Albert_Valldeperas_",0

;Constants que també estan definides en C.
ROWDIM  equ 4       ;files de la matriu.
COLDIM  equ 5       ;columnes de la matriu.

section .text            

;Variables definides en Assemblador.
global developer  

;Subrutines d'assemblador que es criden des de C.
global posCurScreenP2, showDigitsP2, updateBoardP2,
global moveCursorP2, openCardP2, checkPairsP2
global playP2

;Variables definides en C.
extern mCards, mOpenCards

;Funcions de C que es criden des de assemblador.
extern clearScreen_C, printBoardP2_C, gotoxyP2_C, getchP2_C, printchP2_C
extern printMessageP2_C


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ATENCIÓ: Recordeu que en assemblador les variables i els paràmetres 
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
;; Les subrutines en assemblador que heu de modificar per a 
;; implementar el pas de paràmetres són:
;;   posCurScreenP2, showDigitsP2, updateBoardP2,
;;   moveCursorP2, openCardP2.
;; La subrutina nova que s'ha d'implementar és:
;;   checkPairsP2.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aquesta subrutina es dóna feta. NO LA PODEU MODIFICAR.
; Situar el cursor en una fila i una columna de la pantalla
; en funció de la fila (edi) i de la columna (esi) rebuts com 
; a paràmetre cridant a la funció gotoxyP2_C.
; 
; Variables globals utilitzades:	
; Cap
; 
; Paràmetres d'entrada : 
; (rowScreen): rdi(edi): Fila
; (colScreen): rsi(esi): Columna;
;
; Paràmetres de sortida: 
; Cap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
gotoxyP2:
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

   ; Quan cridem la funció gotoxyP2_C(int rowScreen, int colScreen) des d'assemblador 
   ; el primer paràmetre (rowScreen) s'ha de passar pel registre rdi(edi), i
   ; el segon  paràmetre (colScreen) s'ha de passar pel registre rsi(esi)		
   call gotoxyP2_C
 
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aquesta subrutina es dóna feta. NO LA PODEU MODIFICAR.
; Mostrar un caràcter (dil) a la pantalla, rebut com a paràmetre, 
; en la posició on està el cursor cridant la funció printchP2_C.
; 
; Variables globals utilitzades:	
; Cap
; 
; Paràmetres d'entrada : 
; (c): rdi(dil): Caràcter que volem mostrar
; 
; Paràmetres de sortida: 
; Cap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
printchP2:
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

   ; Quan cridem la funció printchP2_C(char c) des d'assemblador, 
   ; el paràmetre (c) s'ha de passar pel registre rdi(dil).
   call printchP2_C
 
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
   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Aquesta subrutina es dóna feta. NO LA PODEU MODIFICAR.
; Llegir una tecla i retornar el caràcter associat (al) sense 
; mostrar-lo per pantalla, cridant la funció getchP2_C.
; 
; Variables globals utilitzades:	
; Cap
; 
; Paràmetres d'entrada : 
; Cap
; 
; Paràmetres de sortida: 
; (c): rax(al): Caràcter que llegim de teclat.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
getchP2:
   push rbp
   mov  rbp, rsp
   ;guardem l'estat dels registres del processador perquè
   ;les funcions de C no mantenen l'estat dels registres.
   
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

   mov rax, 0
   ; Cridem la funció getchP2_C des d'assemblador, 
   ; retorna sobre el registre rax(al) el caràcter llegit.
   call getchP2_C
 
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
   
   mov rsp, rbp
   pop rbp
   ret 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Posicionar el cursor a la pantalla, dins el tauler, en funció de la
; posició del cursor dins la matriu, indicada per la variable 
; (pos), rebuda com a paràmetre, de tipus int(DWORD)4bytes, a partir 
; de la posició [10,12] de la pantalla.
; Per a calcular la posició del cursor a pantalla (rScreen) i 
; (cScreen) utilitzar aquestes fórmules:
; rScreen=10+(pos/COLDIM)*2)
; cScreen=12+(pos%COLDIM)*4)
; Per a posicionar el cursor a la pantalla s'ha de cridar a la subrutina
; gotoxyP2.
;
; Variables globals utilitzades:	
; Cap
;
; Paràmetres d'entrada : 
; (pos): rdi(edi): Posició del cursor dins la matriu.
;
; Paràmetres de sortida: 
; Cap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
posCurScreenP2:
   push rbp
   mov  rbp, rsp
   
   push rax
   push rcx
   push rdx
   
   mov eax, edi
   mov ecx, COLDIM
   mov edx, 0 
   				
   div ecx 						;(pos/COLDIM) to rax, (pos%COLDIM) to rdx
								
   sal eax, 1 					;quotient multiplied x2 ((pos/COLDIM)*2)
   add eax, 10					;adds 10 to the total (10+((pos/COLDIM)*2))
   mov edi, eax					;rScreen passed to rdi
   
   sal edx, 2					;remainder multiplied x4 ((pos%COLDIM)*4)
   add edx, 12   				;adds 12 to the total (12+((pos%COLDIM)*4))
   mov esi, edx   				;cScreen passed to rsi
   
   call gotoxyP2				
   
   pop rdx
   pop rcx
   pop rax
   
   mov rsp, rbp
   pop rbp
   ret



;;;;;
; Converteix un valor (val) de tipus short(WORD)2bytes (entre 0 i 99)  
; en 2 caràcters ASCII que representin aquest valor. (27 -> '2' '7').
; S'ha de dividir el valor entre 10, el quocient representarà les 
; desenes i el residu les unitats, i després s'han de convertir a ASCII
; sumant '0' o 48(codi ASCII de '0') a les unitats i a les desenes.
; Mostrar els dígits (caràcter ASCII) a partir de la fila indicada
; per la variable (rScreen) i a la columna indicada per la variable
; (cScreen).
; Per a posicionar el cursor s'ha de cridar a la subrutina gotoxyP2 i 
; per a mostrar els caràcters a la subrutina printchP2.
;
; Variables globals utilitzades:   
; Cap.
;
; Paràmetres d'entrada : 
; (rScreen): rdi(edi): Fila de la pantalla on posicionem el cursor.
; (cScreen): rsi(esi): Columna de la pantalla on posicionem el cursor.
; (val)    : rdx(dx) : Valor que volem mostrar.
;
; Paràmetres de sortida: 
; Cap.
;;;;;
showDigitsP2:
   push rbp
   mov  rbp, rsp
   
   push rax
   push rbx
   push rcx
   
   mov ax, dx 						;dx == val, store it in bx
   
   mov dx, 0						;cleans bx to avoid floating point exp
   mov bx, 10						
   div bx							;val / 10 --> ax=tens, dx=units
   
   add ax, '0'    					;tens
   add dx, '0'						;units
     
   call gotoxyP2 					;rdi = 19, rsi = 15
   
   mov cl, dil						;store rScreen temp as dil is needed for character
   mov dil, al						;BYTE[charac] - print tens
   call printchP2
   
   mov dil, cl						;restoring previous rScreen
   inc esi							;colScreen - moves cursor to the right
   call gotoxyP2
   
   mov dil, dl 						;BYTE[charac] - print units
   call printchP2
   
   pop rcx
   pop rbx
   pop rax
   
   mov rsp, rbp
   pop rbp
   ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Mostrar els valors de la matriu (mOpenCards) dins el tauler, 
; a les posicions corresponents, eels moviments que es poden fer (moves)
; i les parelles que s'han de fer (pairs), rebuts com a paràmetre.
; S'ha de recórrer tota la matriu (mOpenCards), d'esquerra a dreta i 
; de dalt a baix, cada posició és de tipus char(BYTE)1byte, 
; i per a cada element de la matriu fer:
; Posicionar el cursor en el tauler en funció de les variables 
; (rScreen) fila i (cScreen) columan cridant la subrutina gotoxyP2.
; Les variables (rScreen) i (cScreen) s'inicialitzaran, a 10 i 14,
; respectivament i que és la posició a pantalla de la casella [0][0].
; Mostrar els caràcters de cada posició de la matriu (mOpenCards) 
; cridant la subrutina printchP2.
; Després, mostrar els moviments (moves) de tipus int(DWORD)4bytes, 
; a partir de la posició [19,15] de la pantalla i mostrar les parelles
; fetes (pairs) de tipus int(DWORD)4bytes, a partir de la 
; posició [19,24] de la pantalla cridant la subrutina showDigitsP2.
;
; Variables globals utilitzades:   
; (mOpenCards): Matriu on guardem les targetes del joc.
;
; Paràmetres d'entrada : 
; (moves): rdi(di): Intents que queden.
; (pairs): rsi(si): Parelles que falten fer.
;
; Paràmetres de sortida: 
; Cap.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
updateBoardP2:
   push rbp
   mov  rbp, rsp
   
   push rax
   push rbx
   push rcx
   push rdx
   push r8
   push r9
   push r10
   push r11
   
   mov rax, 0       			;i
   mov rbx, 0       			;j
   mov rcx, 0					;index to access matrix
   mov r10w, di					;store moves temp before override
   mov r11w, si					;store pairs temp before override

   loop_i:	
	cmp eax, ROWDIM
	jge end_loop_i

	mov ebx, 0					;set j=0
	mov edx, 12					;reset colScreenAux
	mov edi, 10					;rScreen parameter
   
	loop_j:
		cmp ebx, COLDIM				
		jge end_loop_j						;if j>=COLDIM, then next row

		mov esi, edx						;cScreen parameter
		call gotoxyP2
		
		mov r8b, BYTE[mOpenCards + ecx]		;charac = mOpenCards[i][j];
		mov dil, r8b						;pass character to subroutine
		call printchP2
												
		add esi, 4							;colScreen = colScreen + 4;
		inc ecx								;matrix index++
		inc ebx								;j++
		jmp loop_j
	
	end_loop_j:
	
	inc eax									;i++
	add edi, 2								;rowScreen = rowScreen + 2
	
	jmp loop_i
   
   end_loop_i:
	
							;print moves (19,15)
   mov edi, 19 				;rScreen 
   mov esi, 15				;cScreen
   mov dx, r10w				;restore moves and send it as parameter
   call showDigitsP2
   
							;print pairs (19,24)
   mov esi, 24				;cScreen
   mov dx, r11w				;pairs from si to send it as parameter 
   call showDigitsP2
   
   pop r11
   pop r10
   pop r9
   pop r8
   pop rdx
   pop rcx
   pop rbx
   pop rax
   
   mov rsp, rbp
   pop rbp
   ret


;;;;;  
; Actualitzar la posició del cursor dins la matriu indicada per la 
; variable (pos), de tipus int(DWORD)4bytes, rebuda com a paràmetre, 
; en funció de la tecla premuda (c), de tipus char(BYTE)1byte, 
; rebuda com a paràmetre, (i: amunt, j:esquerra, k:avall, l:dreta).
; Comprovar que no sortim de la matriu, (pos) només pot prendre valors
; de posicions dins de la matriu [0 : (ROWDIM*COLDIM)-1].
; Per comprovar-ho cal calcular la fila i columna dins la matriu:
; fila    = pos / COLDIM, que pot pendre valors [0 : (ROWDIM-1)].
; columna = pos % COLDIM, que pot pendre valors [0 : (COLDIM-1)].
; Per canviar de fila sumem o restem COLDIM a (pos) i per canviar de 
; columna sumem o restem 1 a (pos) perquè cada posició de la matriu 
; és de tipus char(BYTE)1byte i té ROWDIM files i COLDIM columnes.
; Si el moviment surt de la matriu, no fer el moviment.
; Retornar la posició del cursor (pos) actualitzada.
;
; NO s'ha de posicionar el cursor, es fa a posCurScreenP2.
;
; Variables globals utilitzades:   
; Cap.
;
; Paràmetres d'entrada : 
; (c)  : rdi(dil): Caràcter llegit de teclat.
; (pos): rsi(esi): Posició del cursor dins la matriu.
;
; Paràmetres de sortida: 
; (pos): rax(eax): Posició del cursor dins la matriu.
;;;;;
moveCursorP2:  
   push rbp
   mov  rbp, rsp

   
         
   mov rsp, rbp
   pop rbp
   ret


;;;;;  
; Obrir la targeta de la matriu (mCards) de la posició del
; cursor dins la matriu indicada per la variable (pos), rebuda com a 
; paràmetre.
; Guardar la posició de la targeta que estem obrint i que tenim a la
; variable (pos) de tipus int(DWORD)4bytes al vector (vPos), rebut com
; a paràmetre, de tipus int(DWORD)4bytes, on a la posició [0] és per 
; a guardar la posició de la 1a targeta que girem (quan status=0) i 
; a la posició [1] és per guardar la posició de la 2a targeta que 
; girem (quan status=1), la varaible (status) rebuda com a paràmetre.
; vPos[0]:[vPos+0]: Posició de la 1a targeta. 
; vPos[1]:[vPos+4]: Posició de la 2a targeta.
; Si la targeta no està girada (!='x') posar-la a la matriu
; (mOpenCards) per a que es mostri.
; Marcar-la amb una 'x'(minúscula) a la mateixa posició de la matriu 
; (mCards) per a saber que està girada.
; Passar al següent estat (status++) i retornar l'estat actualitzat.
; 
; No s'ha de mostrar la matriu amb els canvis, es fa a updateBoardP2().
; 
; Variables globals utilitzades:
; (mCards)    : Matriu on guardem les targetes del joc.
; (mOpenCards): Matriu on tenim les targetes obertes del joc.
; 
; Paràmetres d'entrada:
; (pos)   : rdi(edi): Posició del cursor dins la matriu.
; (status): rsi(esi): Estat del joc.
; (vPos)  : rdx(rdx): Adreça del vector amb les posicions de les targetes obertes.
; 
; Paràmetres de sortida: 
; (status): rax(eax): Estat del joc.
;;;;;
openCardP2:  
   push rbp
   mov  rbp, rsp

   
         
   mov rsp, rbp
   pop rbp
   ret


;;;;;  
; Comprovar si les dues targetes obertes són iguals.
; Si les targetes són iguals canviar a l'estat de 'hi ha parella' (status=3).
; Si no són iguals tornar a girar-les. Per a fer-ho cal tornar a posar
; els valors de les targetes que ara tenim a la matriu (mOpenCards), 
; a la matriu (mCards) i a la matriu (mOpenCards) posar-hi una 'X'
; (majúscula) per a indicar que estan tapades. Canviar a l'estat 
; de 'no hi ha parella' (status=4). Retornar l'estat actualizat.
; El vector (vPos) de tipus int(DWORD)4bytes, rebut com a paràmetre,
; conté les posicions de les targetes obertes.
; vPos[0]:[vPos+0]: Posició de la 1a targeta.
; vPos[1]:[vPos+4]: Posició de la 2a targeta.
; 
; Variables globals utilitzades:
; (mCards)    : Matriu on guardem les targetes del joc.
; (mOpenCards): Matriu on tenim les targetes obertes del joc.
; 
; Paràmetres d'entrada:
; (vPos)  : rdi(rdi): Adreça del vector amb les posicions de les targetes obertes.
; 
; Paràmetres de sortida: 
; (status): rax(eax): Estat del joc.
;;;;;  
checkPairsP2:
   push rbp
   mov  rbp, rsp

   
   
   mov rsp, rbp
   pop rbp
   ret   


;;;;;
; Aquesta subrutina es dóna feta. NO LA PODEU MODIFICAR.
; Mostrar un missatge a sota del tauler cridant la funció printMessageP2_C(status)
; segons el valor de la variable (state), rebuda com a paràmetre:
;         0: 0 targetes obertes.
;         1: 1 Targeta oberta.
;         2: 2 Targetes obertes.
;         3: Hi ha parella.
;         4: No hi ha parella.
;         5: Sortir, hem premut la tecla 'ESC' per a sortir.
;         6: Guanya, totes les parelles fetes.
;         7: Perd, s'han exhaurits els moviments .
; Si (state>1) demanar que es premi una tecla per a poder-lo llegir.
;  
; Variables globals utilitzades:	
; Cap.
; 
; Paràmetres d'entrada : 
; (status): rdi(edi): Estat del joc.
; 
; Paràmetres de sortida: 
; Cap.
;;;;;
printMessageP2:
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

   ; Quan cridem la funció printMessageP2_C(int status) des d'assemblador, 
   ; el paràmetre (status) s'ha de passar pel registre rdi(edi).
   call printMessageP2_C
 
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
; Funció principal del joc.
; Trobat totes les parelles del tauler (10 parelles), girant les
; targetes de dues en dues. Com a màxim es poden fer 15 intents.
; 
; Pseudo-codi:
; Inicialitzar l'estat del joc, (state=0).
; Esborrar la pantalla  (cridar la funció clearScreen_C).
; Mostrar el tauler de joc (cridar la funció printBoardP2_C).
; Actualitzar el tauler de joc, el valor dels intents que queden (moves)
; i de les parelles s'han de fer (pairs) cridant la subrutina updateBoardP2.
; Mentre (state<3) fer:
;   Mostrar un missatge,  segons el valor de la variable (state),
;   per a indicar que s'ha de fer, cridant la subrutina printMessageP2.
;   Actualitzar la posició del cursor a la pantalla a partir de la 
;   variable (pos) amb la posició del cursor dins la matriu, 
;   cridant la subrutina posCurScreenP2.
;   Llegir una tecla, cridar la subrutina getchP2. 
;   Segons la tecla llegida cridarem a les subrutines que corresponguin.
;     - ['i','j','k' o 'l'] desplaçar el cursor segons la direcció 
;       triada, cridant la subrutina moveCursorP2.
;     - '<SPACE>'(codi ASCII 32) girar la targeta on hi ha el cursor
;       cridant la subrutina openCardP2.
;       Actualitzar el tauler de joc, els valors dels intents que 
;       queden (moves) i de les parelles que queden per fer (pairs) 
;       cridant la subrutina updateBoardP2.
;       Si s'han girat dues targetes (state>1) decrementar el intents 
;       que queden (moves)
;       Verificar si les dues targetes que s'ha girant són iguales
;       cridant la subrutina checkPairsP2.
;       Si son iguals (state==3) decrementar les parelles que queden
;       per fer (pairs).
;       Si no queden intents (moves==0), canviar a l'estat 
;          de intents exhaurits (state=7). 
;       Si s'han fet totes les parelles (pairs==0), canviar a l'estat
;          de joc guanyat (state=6).
;       Mostrar un missatge,  segons el valor de la variable (state),
;       per a indicar que ha passat, cridant la subrutina printMessageP2. 
;       Si ho hem de sortir (state<5) posar (state=0) per a tornar a 
;       intentar fer una nova parella.
;       Actualitzar el tauler de joc els valors dels intents que 
;       queden (moves) i de les parelles que queden per fer (pairs) 
;       cridant la subrutina updateBoardP2.
;    - '<ESC>'  (codi ASCII 27) posar (state = 5) per a sortir.
;       No sortirà si només s'ha girat una targeta (state!=1).
; Fi mentre.
; Sortir: S'acaba el joc.
; Cal implementar correctament el pas de paràmetres tant a les crides de
; les funcions en C, com a les crides de les subrutines en assemblador.
; 
; Variables globals utilitzades:	
; Cap.
; 
; Paràmetres d'entrada : 
; Cap.
; 
; Paràmetres de sortida: 
; Cap.
;;;;;  
playP2:
   push rbp
   mov  rbp, rsp
   
   call clearScreen_C
   call printBoardP2_C   ;printBoard2_C();
   
					;Declaració de variables locals.
   sub  rsp, 8      ;Reservem espai per al vector vPos.
                    
   push rax
   push rbx
   push rcx
   push rdx         
   push rsi
   push rdi
   push r8
   push r9
   push r10
     
   mov rbx, rbp     
   sub rbx, 8       ;vPos
      
   mov ecx, 0       ;state = 0;//Estat per a començar a jugar
   mov r8w, 15      ;moves = 15;
   mov r9w, (ROWDIM * COLDIM)/2 ;pairs = (ROWDIM * COLDIM)/2; 
   mov r10d, 8       ;pos = 8;

   mov di, r8w
   mov si, r9w
   call updateBoardP2  
   
   playP2_Loop:               ;while  {  //Bucle principal.
   cmp  ecx, 3                ;(state < 3)
   jge  playP2_End
      
      mov  edi, ecx
      call printMessageP2     ;printMessageP2_C(state);
      
      mov  edi, r10d
      call posCurScreenP2     ;posCurScreenP2_C(pos); 

      call getchP2            ;al = charac = getchP2_C();   

      cmp al, 'i'             ;if (charac>='i'
      jl  playP2_TurnUp
      cmp al, 'l'             ;&& charac<='l') {
      jg  playP2_TurnUp
         mov dil, al
         mov esi, r10d
         call moveCursorP2    ;pos = moveCursorP2_C(charac, pos);
         mov r10d, eax
         jmp playP2_EndLoop
      playP2_TurnUp:
      cmp al, 32              ;else if (charac==32) {
      jne playP2_Esc
         mov  edi, r10d
         mov  esi, ecx
         mov  rdx, rbx 
         call openCardP2      ;state = openCardP2_C(pos, state, vPos);
         mov  ecx, eax
         mov  di, r8w
         mov  si, r9w
         call updateBoardP2   ;updateBoardP2_C(moves, pairs);
         
         cmp ecx, 1           ;if (state > 1) {
         jle playP2_EndLoop
			dec r8d           ;moves--;
			mov rdi, rbx
			call checkPairsP2 ;state = checkPairsP2_C(vPos);
			mov ecx, eax
			cmp ecx, 3        ;if (state == 3) 
			jne playP2_Moves
			   dec r9w        ;pairs--;
			playP2_Moves:
            cmp r8w, 0        ;if (moves == 0) 
            jne playP2_Pairs
               mov ecx, 7     ;state = 7;
            playP2_Pairs:
            cmp r9w, 0        ;if (pairs == 0) 
            jne playP2_Message
               mov ecx, 6     ;state = 6;
            playP2_Message:
            mov edi, ecx
			call printMessageP2;printMessageP2_C(state);
            cmp ecx, 5        ;if (state < 5) 
            jge playP2_UpdateBoard
               mov ecx, 0     ;state = 0;
            playP2_UpdateBoard:
			mov di, r8w
            mov si, r9w
            call updateBoardP2;updateBoardP2_C(moves, pairs);
            jmp playP2_EndLoop
      playP2_Esc:
      cmp al, 27              ;if ( (charac==27) 
      jne playP2_EndLoop
      cmp ecx, 1              ;&& (state!=1) ) {
      je  playP2_EndLoop
         mov ecx, 5          ;state = 5;
      playP2_EndLoop:
   jmp playP2_Loop
   
   playP2_End:
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
