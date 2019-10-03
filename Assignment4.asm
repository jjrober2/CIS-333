;--------------------------------------------------------------------
;- 
;- Assignment 4
;- Author: Jordan Roberts
;- Due Date: 10/07/2019
;- Program Description:
;-      This program takes values 100 to 10,000
;-      and doubles them, stores them in a stack
;-      or array, retreives them from the chosen
;-      data structure, and prints them using the
;-      hex conversion code provided by Dr. James.
;-      
;-      - I chose the stack to hold and retreive the data,
;-          I found it very easy to keep track of each value,
;-          the only trick was the doubled value would be stored
;-          first, this helps with the ease of printing so the values 
;-          would not be printed backwards upon popping (retreival);
;-          e.g.
;-              the first value 100 doubled is 200,
;-              if I push the original value first it
;-              will print out: 200 doubled is 100.. which
;-              is obviously incorrect.    
;-
;--------------------------------------------------------------------            
            
            .MODEL  small
            .STACK  100h
            .DATA
  hextable      DB      '0123456789ABCDEF'  ;An array of all Hex values 
  string        db      ' doubled is $'     ;placed in between printed values
  newline       db      0Dh,0Ah,'$'         ;carriage return/linefeed

            .CODE
  start:
            mov     ax,@DATA
            mov     ds,ax
    
             
            mov     ax,100d         ; we will be using ax, bx to double
                                    ;the values and keep track of original
                                    ; values
            mov     bx,0d           ; initialize each register to zero
            mov     cx,100          ;set loop counter 100
        
  doubled:
            mov     bx,ax           ;store doubled num first
            
            sal     ax,1            ;shift bits left 1 move to effectively double
            push    ax              ;push the doubled value on stack first
            mov     ax,bx           ;restore orginal value to ax
            push    ax              ;push original value to stack
            add     ax,100          ;increment to next one hundred's place
            dec     cx              ;decrement loop counter
            cmp     cx,0            ;check cx value
            ja      doubled         ;if cx loop ran less than 100 times..
            jb      restoreCx       ;if cx loop ran 100 times..
        
  restoreCx:
                                    ;drop control here after loops..
                                    ;restore cx value to 100
            mov     cx,100      
            
  print:                             ;block of code to pop values from stack,
                                    ;call procedure to convert values to hex
                                    ;equivalent, print string " doubled is " 
                                    ;in between procedure calls.               
            pop     ax         
            call    display_hex 
            
            lea     dx,string
            mov     ah,09h
            int     21h
            
            pop     ax
            call    display_hex 
            
            lea     dx,newline      ;carriage return/line feed
            mov     ah,09h
            int     21h
            
            dec     cx              
            cmp     cx,0            ;check cx value
            ja      print           ;if cx loop ran less than 100 times..
            je      exit            ;if cx loop ran 100 times.. we're done! 
                                    ;shut the program down.
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
             pop        cx                                
             pop        dx
             
             pop        bx
             pop        ax
              
             

             ret                        ;Return control to calling program
             
display_hex  ENDP 
  
      
             END        start
