                .MODEL  small
                .STACK  100h
                .DATA
  file_buf      DB      20*10 DUP (?)               ;buffer zone
  file_name     DB      'C:\TEST\AUTO.TXT',00h    ;ASCIIZ string
  dir_name      DB      'C:\TEST',00h             ;ASCIIZ string                 
  buffer        DW      100 DUP(?)
  char          DB      ' '
  y             DB      'y'
  n             DB      'n'     
  Testy         DB      'IT WORKS!$'
  handle1       DW      0         
  CARSTRUCT    LABEL   BYTE    ;start of the carstruct list
  MaxLen        DB      10      ;max length all car info can be
  ActLen        DB      ?       ;will tell how many chars entered
  Manufac       DB      10 DUP(' ')     
                DB      0Dh,0Ah,'$'
                                             
  promptMan     DB      'Manufacturer: '
                DB      0Dh,0Ah,'Model: '
                DB      0Dh,0Ah,'Color: '
                DB      0Dh,0Ah,'Engine Size: '
                DB      0Dh,0Ah,'Doors: ','$'
  
  AddInvtry     DB      0Dh,0Ah,0Dh,0Ah,'Add more inventory (Y/N)?'
                DB      0Dh,0Ah,'$'
  
  UserInput     DB      1 DUP(' '),'$'
                              
  
                .CODE
  start:
                mov     ax,@DATA
                mov     ds,ax
                                  
                
                call    createdir
                call    cre_openfile
  resume:                               ;- program will jump here if user
                                        ;- needs to enter another vehicle
                call    clrscreen                        
                mov     cx,5            ;- how many times user will input
                mov     bh,0
                lea     dx,promptMan    ;- display form
                mov     ah,09h
                int     21h
  repeat:              
               
                call    setcurs
                xor     dx,dx
                lea     dx,CARSTRUCT
                mov     ah,0ah
                int     21h
  process:      
                mov     dl,Manufac         ;- move user's input to dx              
                mov     buffer,dx
                dec     cx              ;- decrement loop
                push    bx              ;- save for set cursor routine
                call    write_to_file
                pop     bx
                cmp     cx,0
                jnz     repeat          ;- repeat if all input not accounted for        
   
   
  postProcessing:
                call    addInventory
                cmp     bl,y
                je      printy
                jmp     exit
                
                
  printy:
                lea     dx,testy
                mov     ah,09h
                int     21h              
                jmp     resume
   exit:        
                
                mov     ax,4C00h
                int     21h               
                
                
;----------------------------------------------------------------
;- This section is for procedures-------------------------------
;--------------------------------------------------------------                
                
setcurs      PROC  near     
                
                mov     dh,bh
                mov     dl,0fh
                push    bx
                 
                mov     bh,00       ;use page 0
                mov     ah,02       ;position cursor service
                int     10h
                 
                pop     bx
                inc     bh
                ret 
setcurs     endp 

clrscreen    PROC   near
                mov ah,00h              ;Set video mode
                mov al,02h              ;80 x 25 color
                int 10h
                
                ret
clrscreen       endp

createdir   PROC    near
 ;--- Create directory
                mov     ax, SEG dir_name
                mov     ds, ax
                mov     dx, OFFSET dir_name ;pointer to directory name
                mov     ah,39h             ;Create directory
                int     21h
                
                ret
createdir       endp

cre_openfile    PROC    near
                ;--- Create and Open File
                mov     ah,3Ch          ;Create file
                mov     cx,00           ;"normal" attribute
                lea     dx,file_name    ;pointer to name of file
                int     21h
                mov     handle1,ax      ;otherwise, this is our handle
   
                ret
cre_openfile    endp   

write_to_file   PROC    near
                push    cx
                mov     bh,00h           ;replace return char
                mov     bl,ActLen        ;with the a null since we
                mov     Manufac[bx],00h ;have CR/LF at end of struct
 ;--- write data to file
                mov     cx,10           ;actual bytes to write
                mov     ah,40h          ;write to file
                mov     bx,handle1      ;file handle
                lea     dx,CARSTRUCT+2;address to actual data &crlf&$
                int     21h
                call    clearInput                
                pop     cx
    
                ret
write_to_file   endp    

addInventory    PROC    near
                lea     dx,AddInvtry    ;- ask if user has more info
                mov     ah,09h
                int     21h
                
                mov     ah,02h          ;- set cursor
                mov     bh,00
                mov     dx,0619h                
                int     10h 
                
                ;lea     dx,UserInput    ;-  
                ;mov     ah,0ah
                ;int     21h
                
                mov     ah, 1                    ; read a character
                int     21h
                mov     bl,al

                ret
addInventory    endp     

clearInput      PROC    near             ;-This proc will clear the data
                                         ;-from input after it has been 
                                         ;-written to the file.
                mov     bh,00h           ;replace return char
                mov     bl,ActLen        ;with the a null since we
        remove:               
                
                mov     Manufac[bx],00h ;remove the character at 
                                        ;sub bx.
                dec     bl              ;decrement to next character;
                cmp     bl,0            ;when zero, we removed all chars
                jnz     remove
                
                ret
clearInput      endp    