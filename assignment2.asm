;--------------------------
;- Hello World in Assembly
;--------------------------
                .MODEL SMALL
                ;--
                ;-- Here's where we declare any data
                ;--
                .DATA
 menu_msg       db      'Doc James Jalopies Car Dealership Main Menu$'  ; The $ is used to end strings    
 service1       db      '1 - New Vehicle Inventory Inquiry$'
 service2       db      '2 - Used Vehicle Inventory Inquiry$'
 service3       db      '3 - Service/Warranty Inquiry$'
 service4       db      '4 - Parts Inquiry$'
 service5       db      '5 - Vehicle Information Number Inquiry$'
 service6       db      '6 - Schedule Inquiry$'
 exit_command   db      '0 - Exit the System$'
 f_key          db      'F$'
 array_numbers  db      '1$2$3$4$5$6$7$8$9$10$11$12$' 
 array_serv_hdr db      'New Inv$Used Inv$Serv/Warr$Parts Inq$VIN Inquirt$Sched Inq$'
 array_func_hdr db      'Login/off$Reporting$User Fnct$Super Fnct$Admin Fnct$Help$'
 partition      db      '|$'
 plus_sign      db      '+$'
 hyphen         db      78 dup('-')
                db      '$'         
 mult_asterisks db      80 dup('*')
                db      '$'
 single_astks   db      '*$'               
                
                .CODE
 myprog:
                mov ax,@DATA    ; initialize data segment
                mov ds,ax

                ;--
                ;-- clear the screen
                ;--
                mov ah,06h
                mov bh,07h
                mov cx,0000h    ; row 0/col 0
                mov dh,24d      ; row 24
                mov dl,79d      ; row 79
                int 10h
                ;--
                ;-- set cursor position
                ;--
                
                ;--TOP
                ;-- print HYPHEN HEADER 
                ;--ROW 0--
                ;--
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0000h    ; row 0/col 0
                int 10h
                              
                mov ah,09h
                lea dx,plus_sign
                int 21h
                
                mov ah,09h
                lea dx,hyphen   ; set dx to point to beginning byte of string
                int 21h
                
                mov ah,09h
                lea dx,plus_sign
                int 21h 
                
                ;--TOP
                ;-- print HYPHEN HEADER 
                ;--ROW 3--
                ;--
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0300h    ; row 0/col 0
                int 10h
                              
                mov ah,09h
                lea dx,plus_sign
                int 21h
                
                mov ah,09h
                lea dx,hyphen   ; set dx to point to beginning byte of string
                int 21h
                
                mov ah,09h
                lea dx,plus_sign
                int 21h
                
                ;--LOWER--
                ;-- print HYPHEN HEADER 
                ;--ROW 14--
                ;--
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1400h    ; row 17/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,plus_sign
                int 21h
                
                mov ah,09h
                lea dx,hyphen   ; set dx to point to beginning byte of string
                int 21h
                
                mov ah,09h
                lea dx,plus_sign
                int 21h
                
                ;--LOWER--
                ;-- print HYPHEN HEADER 
                ;--ROW 17--
                ;--
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1700h    ; row 17/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,plus_sign
                int 21h
                
                mov ah,09h
                lea dx,hyphen   ; set dx to point to beginning byte of string
                int 21h
                
                mov ah,09h
                lea dx,plus_sign
                int 21h              
                                
                ;--END HYPHEN HEADER CODE
                ;-----------------------------
                
               
                ;-- PRINT ASTERISK HEADER-----
                ;-- UPPER--             
                ;--ROW 4
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0400h    ; row 04/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,mult_asterisks
                int 21h    
                
                ;-- PRINT ASTERISK HEADER-----
                ;-- UPPER--             
                ;--ROW 5
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0500h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,054fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h
                
                ;-- PRINT ASTERISK HEADER-----
                ;-- UPPER--             
                ;--ROW 6 COL 0
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0600h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,mult_asterisks
                int 21h
                
                ;-- PRINT ASTERISK HEADER-----
                ;-- UPPER--             
                ;--ROW 7 col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0700h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,074fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW 8 col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0800h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,084fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW 9 col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0900h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,094fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW A col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0A00h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0A4fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW B col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0B00h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0B4fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW C col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0C00h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0C4fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW D col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0D00h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0D4fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW E col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0E00h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0E4fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW F col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0F00h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0F4fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW 10 col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1000h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,104fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW 12 col 0/4f
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1200h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,124fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                
                
                ;-- PRINT ASTERISK HEADER-----
                ;-- UPPER--             
                ;--ROW 11
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1100h    ; row 11/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,mult_asterisks
                int 21h    
                
                ;-- PRINT ASTERISK HEADER-----
                ;-- UPPER--             
                ;--ROW 13
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1300h    ; row 11/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,mult_asterisks
                int 21h
                               
                ;--
                ;-- set cursor position
                ;-- 
                
                ;-- PARTITIONS(PIPE CHARACTER) 
                ;ROW 1, COL 0---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0100h    ; row 1/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h 
                
                ;ROW 1, COL B---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,010Bh    ; row 1/col c
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h  
                
                ;ROW 1, COL 18---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0118h    ; row 1/col 18
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h  
                
                ;ROW 1, COL 26---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0126h    ; row 1/col 26
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 1, COL 33---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0133h    ; row 1/col 33
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 1, COL 41---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0141h    ; row 1/col 41
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h        
                
                ;ROW 1, COL 4F---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,014fh    ; row 1/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h        
                
                ;ROW 2, COL 0---------------     
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0200h    ; row 1/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 2, COL B---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,020Bh    ; row 1/col c
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h  
                
                ;ROW 2, COL 18---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0218h    ; row 1/col 18
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h  
                
                ;ROW 2, COL 26---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0226h    ; row 1/col 26
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 2, COL 33---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0233h    ; row 1/col 33
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 2, COL 41---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0241h    ; row 1/col 41
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h         
                
                ;ROW 2, COL 4F---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,024fh    ; row 1/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h  
                
                ;ROW 15, COL 0
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1500h    ; row 1/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h   
                
                ;ROW 15, COL4F
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,154fh    ; row 1/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 16, COL 0
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1600h    ; row 1/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h   
                
                ;ROW 16, COL4F
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,164fh    ; row 1/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;--END OF PARTITION CODE
                
                ;--TITLE/MENU HEADER--------------
                ;--UPPER
                ;--ROW 5, COL 11
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0511h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,menu_msg
                int 21h
                ;--END TITLE/MENU HEADER----------  
                
                ;--F KEYS-------------------------
                ;--UPPER--F1 THROUGH F6
                ;--ROW 1, COL 5/6--F1-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0105h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0106h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+0]
                int 21h
                
                ;--ROW 1, COL 11/12--F2-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0111h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0112h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+2]
                int 21h
                
                ;--ROW 1, COL 1E/1F--F2-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,011Eh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,011Fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+4]
                int 21h
                
                ;--ROW 1, COL 2C/2D--F4------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,012Ch    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,012Dh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+6]
                int 21h
                
                ;--ROW 1, COL 3A/3B--F5-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,013Ah    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,013Bh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+8]
                int 21h
                
                ;--ROW 1, COL 48/49--F6-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0148h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0149h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+10]
                int 21h
                ;--END UPPER----------------------
                
                ;--LOWER--F7 THROUGH F12----------
                ;--ROW 15, COL 5/6--F7-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1505h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1506h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+12]
                int 21h
                
                ;--ROW 15, COL 12/13--F8-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1512h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1513h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+14]
                int 21h
                
                ;--ROW 15, COL 1F/20--F9-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,151Fh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1520h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+16]
                int 21h
                
                ;--ROW 15, COL 2C/2D--F10------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,152Ch    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,152Dh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+18]
                int 21h
                
                ;--ROW 15, COL 3A/3B--F11-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,153Ah    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,153Bh    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+21]
                int 21h
                
                ;--ROW 15, COL 48/49--F12-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1548h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1549h    ; row 06/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+24]
                int 21h
                ;--END LOWER------------------
                ;--END F KEYS------------------------
                
                ;--SERVICES--------------------------
                ;--UPPER FUNCTIONS
                ;--ROW 2, COL 3--NEW-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0203h    ; row 06/col 0
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+0]
                int 21h 
                
                ;--ROW 2, COL E--USED-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,020Eh    ; row 06/col 0
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+8]
                int 21h
                
                ;--ROW 2, COL 1B--USED-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,021Bh    ; row 06/col 0
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+17]
                int 21h
                
                
                ;--
                ;-- End Program
                ;--
                mov ax,4C00h  
                int 21h
                END myprog

