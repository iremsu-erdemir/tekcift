;Girilen sayının tek veya çift olduğunu bulma
islem segment
ana proc far
assume cs:islem,ds:islem
mov ax,0
push ds ax
mov ax,islem
mov ds,ax
jmp basla
m1 db 10,13,'Bir sayi giriniz:$'
m2 db 10,13,'Sayi tektir.$'
m3 db 10,13,'Sayi cifttir.$'

basla: 	mov ah,09h
		lea dx,m1
		int 21h
		
sayi_al:mov ah,01h
		int 21h
		
		mov ah,01h
		int 21h
		sub al,30h
		
bolme:	mov ah,0
		mov bl,2
		div bl
		cmp ah,0
		je cift
		
tek:	mov ah,09h
		lea dx,m2
		int 21h
		jmp son	

cift:	mov ah,09h
		lea dx,m3
		int 21h	
		
son:	ret
		ana endp
		islem ends
		end