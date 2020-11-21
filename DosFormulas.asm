;;librerias para E/S nativas de VC++
includelib libcmt.lib
includelib libucrt.lib
includelib legacy_stdio_definitions.lib
extrn scanf : proc
extrn printf : proc

.data
    a REAL8 0.0
    b REAL8 0.0
    c REAL8 0.0
    negativo REAL8 -1.0
    CONST1_5 REAL8 1.5
    CONST2 REAL8 2.0
    CONST3 REAL8 3.0
    CONST5 REAL8 5.0
    temp1 REAL8 0.0
    temp2 REAL8 0.0
    res1 REAL8 0.0
    res2 REAL8 0.0
    cod_sal REAL8 0.0
    pedirEntrada DB "Ingrese los valores para a, b , c: ", 0
    printResults DB "res1 = %f y res2 = %f ", 0
    fmt2 DB "%lf", 0

.code
main proc
    lea rcx, pedirEntrada
    sub rsp, 32
    call printf
    add rsp, 32

    lea rdx, a
    lea rcx, fmt2
    sub rsp ,32
    call scanf
    add rsp ,32

    lea rdx, b
    lea rcx, fmt2
    sub rsp ,32
    call scanf
    add rsp ,32

    lea rdx, c
    lea rcx, fmt2
    sub rsp ,32
    call scanf
    add rsp ,32
	
	;; calculamos 2a y lo guardamos en temp1
    finit ;; Inicializamos la FPU
    fld a ;; st (0)= a
    fld CONST2 ;; st (0)= CONST2 ,st (1)= a
    fmul ;;st(0) = st(0) * st(1) ; st(0) = CONST2 * a
    fstp temp1 ;; temp1 = 2 * a

	;; calculamos 3b y lo guardamos en temp2
    finit ;; Inicializamos la FPU
    fld b ;; st (0)= b
    fld CONST3 ;; st (0)= CONST3 ,st (1)= b
    fmul ;;st(0) = st(0) * st(1) ; st(0) = CONST3 * b
    fstp temp2 ;; temp2 = 3 * b
	
	;; calculamos 2a + 3b y lo guardamos en temp1
    finit ;; Inicializamos la FPU
    fld temp1 ;; st (0)= temp1 (2*a)
    fld temp2 ;; st (0)= temp1 (3*b), st (1) = temp1 (2*a)
    fadd ;;st(0) = st(0) + st(1) ; st(0) = temp1 + temp2
    fstp temp1 ;; temp1 = 2a + 3b
	
	;; calculamos 5c y lo guardamos en temp2
    finit ;; Inicializamos la FPU
    fld c ;; st (0)= c
    fld CONST5 ;; st (0)= CONST5 ,st (1)= c
    fmul ;;st(0) = st(0) * st(1) ; st(0) = CONST5 * c
    fstp temp2 ;; temp2 = 5*c 
	
	;; hacemos 5c negativo y lo guardamos en temp2
    finit ;; Inicializamos la FPU
    fld temp2  ;; st (0) = temp2
    fld negativo ;; st (0) = negativo , st (1) = temp2 
    fmul ;;st(0) = st(0) * st(1) ; st(0) = negativo * temp2
    fstp temp2 ;; temp2 = -1*5c 
	
	;; dividimos (2a + 3b) / -5c y lo guardamos en res1
    finit ;; Inicializamos la FPU
    fld temp1 ;; st (0) = temp1
    fld temp2 ;; st (0) = temp2 , st (1) = temp1
    fdiv ;;st(0) = st(0) / st(1) ; st(0) = temp2 / temp1
    fstp res1 ;; res1 = (2a+3b)/(-5c) 
	
	;; calculamos 3b y lo guardamos en temp1
    finit ;; Inicializamos la FPU
    fld b ;; st (0) = b
    fld CONST3 ;; st (0) = CONST3 , st (1) = b
    fmul ;;st(0) = st(0) * st(1) ; st(0) = CONST3 * b
    fstp temp1 ;; temp1 = 3*b 
	
	;; calculamos 5a y lo guardamos en temp2
    finit ;; Inicializamos la FPU
    fld a ;; st (0) = a
    fld CONST5 ;; st (0) = CONST5 , st (1) = a
    fmul ;;st(0) = st(0) * st(1) ; st(0) = CONST5 * a
    fstp temp2 ;; temp2 = 5*a 
	
	;; calculamos 3b - 5a y lo guardamos en temp1
    finit ;; Inicializamos la FPU
    fld temp1 ;; st (0) = temp1 
    fld temp2 ;; st (0) = temp2 , st (1) = temp1
    fsub ;;st(0) = st(0) - st(1) ; st(0) = temp1 - temp2
    fstp temp1 ;; temp2 = 3b-5a 

	;; calculamos 2b y lo guardamos en temp2
    finit ;; Inicializamos la FPU
    fld b ;; st (0) = b
    fld CONST2 ;; st (0) = CONST2 , st (1) = b
    fmul ;;st(0) = st(0) * st(1) ; st(0) = CONST2 * b
    fstp temp2 ;; temp2 = 2*b
	
	;; hacemos 2b negativo y lo guardamos en temp2
    finit ;; Inicializamos la FPU
    fld temp2 ;; st (0) = temp2
    fld negativo ;; st (0) = negativo , st (1) = temp2
    fmul ;;st(0) = st(0) * st(1) ; st(0) = negativo * temp2
    fstp temp2 ;; temp2 = -1*2b
	
	;; calculamos (3b - 5a) / -2b y lo guardamos en temp1
    finit ;; Inicializamos la FPU
    fld temp1 ;; st (0) = temp1
    fld temp2 ;; st (0) = temp2 , st (1) = temp1
    fdiv ;;st(0) = st(0) / st(1) ; st(0) = temp2 / temp1
    fstp temp1 ;; temp1 = (3b - 5a) / -2b
	
	;; calculamos 1.5 * ((3b - 5a) / -2b) y lo guardamos en temp1
    finit ;; Inicializamos la FPU
    fld temp1 ;; st (0) = temp1
    fld CONST1_5 ;; st (0) = CONST1_5 , st (1) = temp1
    fmul ;;st(0) = st(0) * st(1) ; st(0) = CONST1_5 * temp1
    fstp temp1 ;; temp2 = 1.5 * ((3b - 5a) / -2b)
	
	;; calculamos res1 - 1.5 * ((3b - 5a) / -2b) y lo guardamos en res2
    finit ;; Inicializamos la FPU
    fld res1 ;; st (0) = res1
    fld temp1 ;; st (0) = temp1 , st (1) = res1
    fsub ;;st(0) = st(0) - st(1) ; st(0) = res1 - temp1
    fstp res2 ;; res2 = res1 - 1.5 * ((3b - 5a) / -2b)

    mov r8, res2
    mov rdx, res1
    lea rcx, printResults
    sub rsp, 40
    call printf
    add rsp ,40

    lea rdx, a
    lea rcx, fmt2
    sub rsp ,40
    call scanf
    add rsp ,40

    mov rax, cod_sal
	call scanf ;; Lo utilizo para pausar el programa y no se cierre
    ret
main endp

end
