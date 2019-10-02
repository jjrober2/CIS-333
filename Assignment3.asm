;--------------------------------------------------------------------
;- 
;- Assignment 3
;- Author: Jordan Roberts
;- Due Date: 09/30/2019
;- Program Description:
;-      Produce the first 20 terms
;-      of the Fibonacci Sequence,
;-      delimit with commas, no comma
;-      will be placed after the last
;-      term, display terms as hex values: code provided
;-      by Professor James.
;-
;- ANSWER THE FOLLOWING QUESTIONS
;-  1.) Is there a limit to the number of terms that you
;-      can calculate?
;-          It depends; the values in the registers will
;-          be calculated, but the computation will not
;-          be accurate when the program exceeds values
;-          greater than 65535 (unsigned), or 2^16/2-1.
;-          So, regarding precision, yes there is a limit.
;-
;-  2.) Explain why (or why not) there is a limit.
;-          The limit resides with the hardware, and machine being used.
;-          The machine will not be able to handle integer overflow if the
;-          carry and add exceed the total size of the register or word length
;-
;-  3.) If there is a limit, how would you deal with the limit?
;-          You could generate a message indicating the system is
;-          not capable of generating that specific term, or explain
;-          to the user there has been an integer overflow. Simply put,
;-          if the program is taking user input, the user could be alerted
;-          that the program cannot calculate the user-specified term to 
;-          compute and display, then the program could loop until the value
;-          fits the register length.    
;-
;--------------------------------------------------------------------
        .MODEL  small
        .STACK  100h
        .DATA
  hextable    DB      '0123456789ABCDEF'  ;An array of all Hex values 
  comma       db      ',$'                ;Delimiter for printed terms
        .CODE
  start:
        mov     ax,@DATA
        mov     ds,ax

         
        mov     ax,0d           ; we will be using ax, bx, and dx for fib computation
        mov     bx,0d           ; initialize each register to zero
        mov     dx,0d           ;
        mov     cx,20
        call    display_hex     ; prints the first term of the fib sequence "0"
                                ; but does not decrement because it is the zeroth term
                                ; we still need to calculate terms 1 through 20  
        
  repeat:
        cmp     ax,0
        jz      add1
         
        
        call    display_hex     ;Call procedure to display hex 
        
        mov     dx,bx           ; This block of code is the essential
        mov     bx,ax           ; component to calculating the fib terms,
        add     ax,dx           ; it takes 3 registers to keep track of 
                                ; numbers while they increment: ax, bx,
                                ; and dx. Since the fib terms generate
                                ; from 0 to 1 to 1, I decided to skip this 
                                ; calculation until ax has the value of 2
                                ; in it, this happens in the add1 and moveOn
                                ; loops where the contents of ax are evaluated,
                                ; once ax increments to 2, it fails the comparison
                                ; "if ax = 1... loop add1", then inserts the value
                                ; 1 into bx and dx, leaving them ready to start the
                                ; calculations for the fib terms.                               
                                
                                
                                
        dec     cx
        jnz     repeat          ; if we're not there yet, repeat more terms
        jz      exit            ; if cx decremented to zero with 20 terms, shut program down
  add1: 
                                ; add1 is used to print the 2nd and 3rd terms
        inc     ax              ; of the fib sequence, before the register swapping
        inc     bx              ; of the repeat loop starts.
        cmp     bx,2            ; bx value will change after ax condition is false, bx
                                ; is just used to keep track of iterations so ax = 1
                                ; will print twice.
        jz      moveOn          ; jump to moveOn when bx = 2, or when add1 has ran twice
        call    display_hex     ; print 1
        dec     cx
        call    display_hex     ; print 1 again
        dec     cx
        cmp     ax,1            ; cmp used to send control to beginning of add1 to reevaluate
        jz      add1
  moveOn:                       ; if we reach moveOn, add1 will not run anymore, 
                                ; ax = 1 has printed twice, we are now ready to calculate
                                ; the last terms.
        mov     bx,1            
        mov     dx,1
        jmp     repeat          ; jump to repeat to calculate terms
                    
  exit:
        mov     ax,4C00h
        int     21h

  ;--------------------------------------
  ; display_hex - converts a decimal number to hex
  ;               one hex digit at a time and then
  ;               displays the converted digit
  ;--------------------------------------
  display_hex   PROC    near
             ;--- AUTHOR - Professor James
             ;--- Original Author provided function code for assignment3
             ;--- We will use ax, bx, cx and dx in this routine
             ;--- which would corrupt whatever data was in them
             ;--- from the main program.  Therefore, we should
             ;--- preserve a copy on the stack by pushing them...
             push       ax
             push       bx 
             push       dx
             push       cx
             
             mov        bx,ax   ;Copy decimal number to bx which
                                ;is what we will dissect to get
                                ;4 binary digits to look up in
                                ;table
             mov        cl,04   ;We will be rotating 4 digits at a time
             mov        ch,04   ;Loop counter -- There are 4 hex digits max
                                ;in a word (which is size of ax)
  proc_digit:
             rol        bx,cl   ;Rotate bits left to get digit to convert in
                                ;last 4 bits of bl
             mov        al,bl         ;Copy the BL into the AL
             and        al,00001111b  ;Clear bits 4-7 of AL
                                      ;-- bits 0-3 contain the digit and
                                      ;  we can now point at table
             push       bx            ;Save the BX's contents since we need
                                      ;to convert other digits
             lea        bx,hextable   ;Load the hextable's address into BX
             xlat                     ;This instruction is used to look up
                                      ;information in a table.  The BX must
                                      ;point to the table's start (offset)
                                      ;and AL must point to an entry (element)
                                      ;in the table.  Once xlat is done AL
                                      ;will contain the value from the table.
             pop        bx            ;Restore bx for next digit
             mov        dl,al         ;Call an interrupt to print out the
                                      ;digit we got from the table
             mov        ah,02h
             int        21h
             dec        ch            ;Decrement the ch counter by 1
             
             
             
             
             jnz        proc_digit
             
             ;---
             ;--- Reload original register values prior to this proc call
             ;--- 
             pop        cx            ; if cx = 1, this means we've printed
             cmp        cx,1          ; the last fib term and cx will be   
             jnz        callComma     ; decremented after control is returned 
             jz         allDone       ; to the main program, i.e. DON'T PRINT 
                                      ; THE LAST COMMA.
  callComma:
             lea    dx,comma          ; Will print if cx > 1
             mov    ah,09h
             int    21h
  allDone:                     
             pop        dx
             
             pop        bx
             pop        ax
              
             

             ret                        ;Return control to calling program
  print_comma:
             
display_hex  ENDP 
  
      
             END        start            
