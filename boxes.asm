BoxCnt:		DW	7
Boxes:		DW	0x0302
		DW	0x0403
		DW	0x0404
		DW	0x0406
		DW	0x0506
		DW	0x0306
		DW	0x0106

; CX = box to find
; sets E if the box was found
; returns a pointer in AX if the box is found
FindBox:	PUSH	ES
		PUSH	DI
		MOV	AX, DS
		MOV	ES, AX
		MOV	AX, CX
		MOV	CX, [BoxCnt]
		; iterate through until we find a matching box or run out of
		; boxes
		MOV	DI, Boxes
		REPNE	SCASW
		MOV	CX, AX				; restore CX
		MOV	AX, DI				; return pointer in AX
		POP	DI
		POP	ES
		RET
