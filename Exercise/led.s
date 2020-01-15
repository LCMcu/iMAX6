add:
    MOVS R0, #0x12 @设置R0=0x12
.global _start

_start:
    ldr r0, =0x12 @r0=0x12

/**/
Undefined_Handler:
    ldr r0, =Undefined_Handler
    bx r0

/*SVC中断*/
SVC_Handler:
    ldr r0, =SVC_Handler
    bx r0


/*预取终止中断 */
PrefAbort_Handler:
    ldr r0, =PrefAbort_Handler
    bx r0

/*
                伪操作

.byte    定义单字节数据 如      .byte 0x12 
.short   声明一个双字节数据     .short 0x1234
.long    定义一个四字节数据     .long 0x12345678
.equ     赋值语句              .equ num 0x12
.align   数据字节对齐           .align 4 四字节对齐 
.end     表示源文件结束         表示源文件结束 
.global  定义一个全局符号       .global symbol
*/

@处理器内部数据传输指令
/*      
指令      目的       源
MOV       R0        R1
MRS       R0        CPSR
MSR       CPSR
*/


/* LDR STR 存储器读取、写入等 */
@ LDR 指令 
@ 主要用于从存储器加载数据到寄存器Rx中
@ 也可以将一个立即数加载到寄存器Rx中
LDR R0, =0x0209c004    @将寄存器地址0x0209c004加载到R0中，即R0=0x0209C004
LDR R1, [R0]           @读取地址0x0209C004 中的数据到R1寄存器中

@ STR指令
@ 将数据写入到存储器中

LDR R0, =0x0209C004
LDR R1, =0x20000002
STR R1, [R0]