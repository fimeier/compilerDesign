
display /10i $eip

display /x $ebp
display /x $esp
display /x $edi
display /x $esi
display /x $ebx
display /x $edx
display /x $ecx
display /x $eax

display /32xw $esp
break *0x8048457
run
