.globl quick_assembly

quick_assembly:
	pushl	%ebp            	#save the base pointer (EBP) on the stack
	movl	%esp, %ebp     		#set EBP to the current stack pointer (ESP)
	pushl   %ebx			#save general purpose registers on the stack for safekeeping
	pushl   %esi
	pushl   %edi

	#Take the inputs
	movl    8(%ebp), %ecx       	#array
	movl    12(%ebp), %edx      	#low
	movl    16(%ebp), %ebx      	#high
	  
	cmpl    %ebx, %edx      	#if (low >= high)
	jge     RET             	#return
	 
	#Partitioning - Select a pivot and rearrange elements

	movl    %edx, %eax      	#eax = pivot, edx = iterator (or i)
	movl    %edx, %esi            
L:
	incl    %eax            	#i++

	cmpl    %ebx, %eax      	#if ( i > high)
	jg      E               	#exit from the loop
	    
	#Otherwise swap elements if current element is greater than the pivot

	movl    (%ecx, %eax, 4), %edi  
	cmpl    (%ecx, %edx, 4), %edi  	#if (arr[i] <= arr[pivot])
	jle     L               	#restart loop

	#Swap - Exchange elements using ESI as a temporary register
	incl    %esi
	    
	movl    (%ecx, %esi, 4), %edi  
	xchgl   %edi, (%ecx, %eax, 4)  	#swap using xchg
	movl    %edi, (%ecx, %esi, 4)  	#store swapped value
	jmp     L               	#restart loop

E:  
	#Place the pivot element in its final position
	movl    (%ecx, %edx, 4), %edi
	xchgl   %edi, (%ecx, %esi, 4)  
	movl    %edi, (%ecx, %edx, 4)  	#store swapped value back to current position (arr[pivot]) - pivot is now in place

    
	#Push the inputs for quick_assembly on the stack
	pushl   %esi
	pushl   %edx
	pushl   %ecx
	incl    %esi            	#increment ESI to point to the element after the pivot
	#Recall first part (low,pivot)   
	call    quick_assembly          #recursive call
	addl    $12, %esp       	#clean up arguments from the stack

	pushl   %ebx
	pushl   %esi
	pushl   %ecx
	#Recall second part (pivot+1,high)
	call    quick_assembly
	addl    $12, %esp   

RET:
	popl    %edi
	popl    %esi
	popl    %ebx
	movl    %ebp, %esp
	popl    %ebp
	ret

