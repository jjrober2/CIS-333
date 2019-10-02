        .MODEL  small
        .STACK  100h
        .DATA
  hextable    DB      '0123456789ABCDEF'  ;An array of all Hex values 
  comma       db      ',$'                ;Delimiter for printed terms
  string      db      ' doubled is $'
        .CODE
  start:
        mov     ax,@DATA
        mov     ds,ax

         
        mov     ax,100d           ; we will be using ax, bx, and dx for 
        mov     bx,0d           ; initialize each register to zero
        mov     dx,0d           ;
        mov     cx,20
        
        
                    
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