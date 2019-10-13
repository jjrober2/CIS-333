;---------------------------------------------------------------
;- Assignment5
;- Author: Jordan Roberts
;- Due Date: 10/14/2019
;- Program Description
;-
;-
;-
;---------------------------------------------------------------
                .MODEL  small
                .STACK  100h
                .DATA
  file_buf      DB      20*10 DUP (?)               ;buffer zone
  file_name     DB      'C:\TEST\AUTO.TXT',00h    ;ASCIIZ string
  dir_name      DB      'C:\TEST',00h             ;ASCIIZ string                 
  buffer        DW      100 DUP(?)
  char          DB      ' '
  y             DB      'y'
  y_caps        DB      'Y'
  n             DB      'n'     
  n_caps        DB      'N'     
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
  counter       DW      0                            
  proc_msg      DB      '*** Awesome Auto Lot Inventory file has been processed ***$'
  newline       DB      0Dh,0Ah
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
                add     counter,cx
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
                je      resume
                cmp     bl,y_caps
                je      resume
                cmp     bl,n
                je      close
                cmp     bl,n_caps
                je      close
                
                
  close:
                call    close_file
                call    clrscreen
                call    file_processing
                call    close_file
                
   exit:        
                
                mov     ah,02h          ;- set cursor
                mov     bh,00
                mov     dx,170Ch        ;position proc_msg        
                int     10h             ;on bottom of screen
                lea     dx,proc_msg
                mov     ah,09h
                int     21h
                
                mov     ax,4C00h
                int     21h               
                
                
;----------------------------------------------------------------
;- This section is for procedures-------------------------------
;--------------------------------------------------------------                
                
setcurs      PROC  near     
                inc     counter
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

close_file      PROC    near
 
                mov     ah,3Eh          ;close file
                mov     bx,handle1      ;file handle
                int     21h    
    
                ret
close_file      endp

file_processing PROC    near
    
                mov     ah,3Dh          ;open file
                mov     al,000b         ;read access
                lea     dx,file_name    ;address    
                int     21h
                mov     handle1,ax      ;save file handle
                
                 ;--- Get length of file
                mov     ah,42h          ;move pointer
                
                mov     al,02h          ;offset from end of file
                mov     bx,handle1      ;file handle
                xor     cx,cx           ;set cx = 0
                xor     dx,dx           ;set dx = 0
                int     21h             ;file length in DS:AX
                push    ax              ;AX = file length
                                        ;DX = 0 in this example                            
                 ;--- Reset file pointer to beginning of file
                mov     ah,42h          ;move pointer
                mov     al,00h          ;set at start of file
                mov     bx,handle1      ;file handle
                xor     cx,cx           ;CX = 0
                xor     dx,dx           ;DX = 0
                int     21h
                
                 ;--- Read file
                mov     ah,3Fh          ;read file
                mov     bx,handle1      ;file handle
                pop     cx              ;read byes
                lea     dx,file_buf     ;address
                int     21h    
                
                 ;--- Display data in file buffer
                mov     ah,40h          ;write to device
                mov     bx,1            ;device = screen
                mov     cx,10*20        ;write n bytes
                                        ;-(size of file buffer)
                                        
                mov     file_buf[48],0Dh   ;- This section inserts
                mov     file_buf[49],0Ah   ;- a carriage return
                                           ;- and line feed at the
                mov     file_buf[98],0Dh   ;- end of the required
                mov     file_buf[99],0Ah   ;- input, after 'doors'.
                                           ;- this makes the display
                mov     file_buf[147],0Dh  ;- of data more readable.
                mov     file_buf[148],0Ah  ;-
                                      
                lea     dx,file_buf     ;address
                int     21h                                     
    
                ret
file_processing endp    
