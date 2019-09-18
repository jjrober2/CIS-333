;--------------------------
;-
;- Assignment 2
;- Author: Jordan Roberts
;- Due Date: 09/18/19
;- Hello World in Assembly 
;-
;--------------------------
                .MODEL SMALL
                ;--
                ;-- Program Data declarations
                ;--
                .DATA
 menu_msg       db      'Doc James Jalopies Car Dealership Main Menu$'      
 service1       db      '1 - New Vehicle Inventory Inquiry$'
 service2       db      '2 - Used Vehicle Inventory Inquiry$'
 service3       db      '3 - Service/Warranty Inquiry$'
 service4       db      '4 - Parts Inquiry$'
 service5       db      '5 - Vehicle Information Number Inquiry$'
 service6       db      '6 - Schedule Inquiry$'
 exit_command   db      '0 - Exit the System$' 
 enter_command  db      'Enter command  :->$'
 f_key          db      'F$'
 array_numbers  db      '1$2$3$4$5$6$7$8$9$10$11$12$' 
 array_serv_hdr db      'New Inv$Used Inv$Serv/Warr$Parts Inq$VIN Inquiry$Sched Inq$'
 array_func_hdr db      'Login/off$Reporting$User Fnct$Super Fnct$Admin Fnct$Help$'
 partition      db      '|$'
 plus_sign      db      '+$'
 hyphen         db      78 dup('-')
                db      '$'         
 mult_asterisks db      80 dup('*')
                db      '$'
 single_astks   db      '*$'
 underscore     db      '_$'               
                
                .CODE
 myprog:
                mov ax,@DATA    ; initialize data segment
                mov ds,ax

                ;--
                ;-- clear the screen----------------------------------------
                ;--
                mov ah,06h
                mov bh,07h
                mov cx,0000h    ; row 0/col 0
                mov dh,24d      ; row 24
                mov dl,79d      ; row 79
                int 10h
                
                ;-- print HYPHEN HEADER--------------------------------------
                ;--TOP-- 
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
                 
                ;-- print HYPHEN HEADER--------------------------------------- 
                ;--TOP--
                ;--ROW 3--
                ;--
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0300h    ; row 3/col 0
                int 10h
                              
                mov ah,09h
                lea dx,plus_sign
                int 21h
                
                mov ah,09h
                lea dx,hyphen   
                int 21h
                
                mov ah,09h
                lea dx,plus_sign
                int 21h 
                
                ;-- print HYPHEN HEADER-------------------------------------- 
                ;--LOWER--
                ;--ROW 14--
                ;--
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1400h    ; row 14/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,plus_sign
                int 21h
                
                mov ah,09h
                lea dx,hyphen   
                int 21h
                
                mov ah,09h
                lea dx,plus_sign
                int 21h 
                
                ;-- print HYPHEN HEADER---------------------------------------
                ;--LOWER--
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
                lea dx,hyphen   
                int 21h
                
                mov ah,09h
                lea dx,plus_sign
                int 21h              
                                
                ;--END HYPHEN HEADER CODE
                ;-------------------------------------------------------------
                
               
                ;-- PRINT ASTERISK HEADER-------------------------------------
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
                mov dx,0500h    ; row 05/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,054Fh    ; row 05/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h
                
                ;-- PRINT ASTERISK HEADER------------------------------------
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
                ;--ROW 7 col 0/4f-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0700h    ; row 07/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,074Fh    ; row 07/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW 8 col 0/4f---------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0800h    ; row 08/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,084Fh    ; row 08/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW 9 col 0/4f-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0900h    ; row 09/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,094fh    ; row 09/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW A col 0/4f-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0A00h    ; row 0A/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0A4fh    ; row 0A/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW B col 0/4f-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0B00h    ; row 0B/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0B4fh    ; row 0B/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW C col 0/4f-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0C00h    ; row 0C/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0C4fh    ; row 0C/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW D col 0/4f-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0D00h    ; row 0D/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0D4fh    ; row 0D/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW E col 0/4f-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0E00h    ; row 0E/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0E4fh    ; row 0E/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW F col 0/4f------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0F00h    ; row 0F/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0F4Fh    ; row 0F/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW 10 col 0/4f------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1000h    ; row 10/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,104Fh    ; row 10/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                ;--ROW 12 col 0/4f------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1200h    ; row 12/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h  
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,124Fh    ; row 12/col 4F
                int 10h  
                             
                mov ah,09h
                lea dx,single_astks
                int 21h 
                
                
                
                ;-- PRINT ASTERISK HEADER-----------------------
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
                mov dx,1300h    ; row 13/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,mult_asterisks
                int 21h
                
                ;-- PARTITIONS(PIPE CHARACTER)------------------- 
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
                mov dx,010Bh    ; row 1/col B
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
                mov dx,014fh    ; row 1/col 4F
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h        
                
                ;ROW 2, COL 0---------------     
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0200h    ; row 2/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 2, COL B---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,020Bh    ; row 1/col B
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h  
                
                ;ROW 2, COL 18---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0218h    ; row 2/col 18
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h  
                
                ;ROW 2, COL 26---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0226h    ; row 2/col 26
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 2, COL 33---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0233h    ; row 2/col 33
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 2, COL 41---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0241h    ; row 2/col 41
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h         
                
                ;ROW 2, COL 4F---------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,024fh    ; row 2/col 4F
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                  
                ;--ROWS 15-------------------
                ;ROW 15, COL 0
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1500h    ; row 15/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h 
                
                ;ROW 15, COL C----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,150Ch    ; row 15/col C
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 15, COL 18----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1518h    ; row 15/col 18
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h 
                
                ;ROW 15, COL 26----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1526h    ; row 15/col 26
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 15, COL 33----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1533h    ; row 15/col 33
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 15, COL 41----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1541h    ; row 15/col 41
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h      
                
                ;ROW 15, COL4F----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,154fh    ; row 15/col 4F
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 16, COL 0----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1600h    ; row 16/col 0
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h 
                
                ;ROW 16, COL C----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,160Ch    ; row 16/col C
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 16, COL 18----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1618h    ; row 16/col 18
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h 
                
                ;ROW 16, COL 26----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1626h    ; row 16/col 26
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 16, COL 33----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1633h    ; row 16/col 33
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;ROW 16, COL 41----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1641h    ; row 16/col 41
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h  
                
                ;ROW 16, COL4F----------------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,164fh    ; row 16/col 4F
                int 10h
                
                mov ah,09h
                lea dx,partition
                int 21h
                
                ;--END OF PARTITION CODE------------------------
                
                ;--TITLE/MENU HEADER----------------------------
                ;--UPPER
                ;--ROW 5, COL 11
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0511h    ; row 05/col 11
                int 10h  
                             
                mov ah,09h
                lea dx,menu_msg
                int 21h
                ;--END TITLE/MENU HEADER-------------------------  
                
                ;--F KEYS----------------------------------------
                ;--UPPER--F1 THROUGH F6
                ;--ROW 1, COL 5/6--F1-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0105h    ; row 01/col 5
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0106h    ; row 01/col 6
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+0]
                int 21h
                
                ;--ROW 1, COL 11/12--F2-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0111h    ; row 01/col 11
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0112h    ; row 01/col 12
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+2]
                int 21h
                
                ;--ROW 1, COL 1E/1F--F2-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,011Eh    ; row 01/col 1E
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,011Fh    ; row 01/col 1F
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+4]
                int 21h
                
                ;--ROW 1, COL 2C/2D--F4------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,012Ch    ; row 01/col 2C
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,012Dh    ; row 01/col 2D
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+6]
                int 21h
                
                ;--ROW 1, COL 3A/3B--F5-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,013Ah    ; row 01/col 3A
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,013Bh    ; row 01/col 3B
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+8]
                int 21h
                
                ;--ROW 1, COL 48/49--F6-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0148h    ; row 01/col 48
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0149h    ; row 01/col 49
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+10]
                int 21h
                ;--END UPPER----------------------
                
                ;--LOWER--F7 THROUGH F12----------
                ;--ROW 15, COL 5/6--F7-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1505h    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1506h    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+12]
                int 21h
                
                ;--ROW 15, COL 12/13--F8-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1511h    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1512h    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+14]
                int 21h
                
                ;--ROW 15, COL 1F/20--F9-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,151Fh    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1520h    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+16]
                int 21h
                
                ;--ROW 15, COL 2C/2D--F10------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,152Ch    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,152Dh    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+18]
                int 21h
                
                ;--ROW 15, COL 3A/3B--F11-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,153Ah    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,153Bh    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+21]
                int 21h
                
                ;--ROW 15, COL 48/49--F12-----------
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1548h    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,f_key
                int 21h 
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1549h    ; row 15/col 0
                int 10h  
                             
                mov ah,09h
                lea dx,[array_numbers+24]
                int 21h
                ;--END LOWER------------------
                ;--END F KEYS-------------------------------------
                
                ;--SERVICES---------------------------------------
                ;--UPPER FUNCTIONS
                ;--ROW 2, COL 3--NEW-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0203h    ; row 02/col 3
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+0]
                int 21h 
                
                ;--ROW 2, COL E--USED-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,020Eh    ; row 02/col E
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+8]
                int 21h
                
                ;--ROW 2, COL 1B--SERV-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,021Bh    ; row 02/col 1B
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+17]
                int 21h
                
                ;--ROW 2, COL 28--parts-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0228h    ; row 02/col 28
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+27]
                int 21h
                
                ;--ROW 2, COL 35--VIN-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0235h    ; row 02/col 35
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+37]
                int 21h 
                
                ;--ROW 2, COL 43--SCHED-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0244h    ; row 02/col 43
                int 10h    
                             
                mov ah,09h
                lea dx,[array_serv_hdr+49]
                int 21h
                
                ;--LOWER FUNCTIONS------------------
                ;--ROW 16, COL 2--LOGIN-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1602h    ; row 16/col 2
                int 10h    
                             
                mov ah,09h
                lea dx,[array_func_hdr+0]
                int 21h 
                
                ;--ROW 16, COL E--REPORT-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,160Eh    ; row 16/col E
                int 10h    
                             
                mov ah,09h
                lea dx,[array_func_hdr+10]
                int 21h
                
                ;--ROW 16, COL 1B--USER-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,161Bh    ; row 16/col 1B
                int 10h    
                             
                mov ah,09h
                lea dx,[array_func_hdr+20]
                int 21h
                
                ;--ROW 16, COL 28--SUPER-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1628h    ; row 16/col 28
                int 10h    
                             
                mov ah,09h
                lea dx,[array_func_hdr+30]
                int 21h
                
                ;--ROW 16, COL 36--ADMIN-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1636h    ; row 16/col 36
                int 10h    
                             
                mov ah,09h
                lea dx,[array_func_hdr+41]
                int 21h 
                
                ;--ROW 16, COL 47--HELP-------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1647h    ; row 16/col 47
                int 10h    
                             
                mov ah,09h
                lea dx,[array_func_hdr+52]
                int 21h
                ;--END FUNCTIONS---------------------
                
                ;--LIST OF SERVICES-----------------
                ;--1 THROUGH 6
                ;--0 FOR EXIT SYSTEM                
                ;--ROW 8, COL 6 ---------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0806h    ; row 08/col 06
                int 10h    
                             
                mov ah,09h
                lea dx,service1
                int 21h 
                
                ;--ROW 9, COL 6 ---------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0906h    ; row 09/col 06
                int 10h    
                             
                mov ah,09h
                lea dx,service2
                int 21h  
                
                ;--ROW A, COL 6 ---------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0A06h    ; row 0A/col 6
                int 10h    
                             
                mov ah,09h
                lea dx,service3
                int 21h 
                
                ;--ROW B, COL 6 ---------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0B06h    ; row 0B/col 6
                int 10h    
                             
                mov ah,09h
                lea dx,service4
                int 21h
                
                ;--ROW C, COL 6 ---------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0C06h    ; row 0C/col 6
                int 10h    
                             
                mov ah,09h
                lea dx,service5
                int 21h 
                
                ;--ROW D, COL 6 ---------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0D06h    ; row 0D/col 6
                int 10h    
                             
                mov ah,09h
                lea dx,service6
                int 21h
                
                ;--ROW F, COL 6 ---------------
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,0F06h    ; row 0F/col 6
                int 10h    
                             
                mov ah,09h
                lea dx,exit_command
                int 21h 
                
                ;--END OF SERVICES CODE------------------
                
                ;--ENTER COMMAND CODE--------------------
                ;--ROW 12, COL 6
                
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1206h    ; row 12/col 6
                int 10h    
                             
                mov ah,09h
                lea dx,enter_command
                int 21h
                ;--END COMMAND CODE-----------------------
                
                ;--SET CURSOR POSITION-------------------
                ;--for prompt location 
                ;--I inserted an underscore just to 
                ;--confirm cursor location.
                ;--
                mov ah,02h
                mov bh,00h      ; page 0
                mov dx,1217h    ; row 12/col 17
                int 10h 
                
                mov ah,09h
                lea dx,underscore
                int 21h
                                
                ;--
                ;-- End Program
                ;--
                mov ax,4C00h  
                int 21h
                END myprog

