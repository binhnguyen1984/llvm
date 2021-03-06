# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=btver2 -timeline -register-file-stats -iterations=5 < %s | FileCheck %s

# TODO sbbl  %eax, %eax
# TODO sbbq  %rax, %rax
# TODO subl  %eax, %eax
# TODO subq  %rax, %rax
# TODO xorl  %eax, %eax
# TODO xorq  %rax, %rax

pcmpgtb   %mm2, %mm2
pcmpgtd   %mm2, %mm2
pcmpgtw   %mm2, %mm2
pcmpgtb   %xmm2, %xmm2
pcmpgtd   %xmm2, %xmm2
pcmpgtq   %xmm2, %xmm2
pcmpgtw   %xmm2, %xmm2
vpcmpgtb  %xmm3, %xmm3, %xmm3
vpcmpgtd  %xmm3, %xmm3, %xmm3
vpcmpgtq  %xmm3, %xmm3, %xmm3
vpcmpgtw  %xmm3, %xmm3, %xmm3

vpcmpgtb  %xmm3, %xmm3, %xmm5
vpcmpgtd  %xmm3, %xmm3, %xmm5
vpcmpgtq  %xmm3, %xmm3, %xmm5
vpcmpgtw  %xmm3, %xmm3, %xmm5

psubb   %mm2, %mm2
psubd   %mm2, %mm2
psubq   %mm2, %mm2
psubw   %mm2, %mm2
psubb   %xmm2, %xmm2
psubd   %xmm2, %xmm2
psubq   %xmm2, %xmm2
psubw   %xmm2, %xmm2
vpsubb  %xmm3, %xmm3, %xmm3
vpsubd  %xmm3, %xmm3, %xmm3
vpsubq  %xmm3, %xmm3, %xmm3
vpsubw  %xmm3, %xmm3, %xmm3

vpsubb  %xmm3, %xmm3, %xmm5
vpsubd  %xmm3, %xmm3, %xmm5
vpsubq  %xmm3, %xmm3, %xmm5
vpsubw  %xmm3, %xmm3, %xmm5

andnps  %xmm0, %xmm0
andnpd  %xmm1, %xmm1
vandnps %xmm2, %xmm2, %xmm2
vandnpd %xmm1, %xmm1, %xmm1
pandn   %mm2, %mm2
pandn   %xmm2, %xmm2
vpandn  %xmm3, %xmm3, %xmm3

vandnps %xmm2, %xmm2, %xmm5
vandnpd %xmm1, %xmm1, %xmm5
vpandn  %xmm3, %xmm3, %xmm5

xorps  %xmm0, %xmm0
xorpd  %xmm1, %xmm1
vxorps %xmm2, %xmm2, %xmm2
vxorpd %xmm1, %xmm1, %xmm1
pxor   %mm2, %mm2
pxor   %xmm2, %xmm2
vpxor  %xmm3, %xmm3, %xmm3

vxorps %xmm4, %xmm4, %xmm5
vxorpd %xmm1, %xmm1, %xmm3
vpxor  %xmm3, %xmm3, %xmm5

# CHECK:      Iterations:        5
# CHECK-NEXT: Instructions:      255
# CHECK-NEXT: Total Cycles:      129
# CHECK-NEXT: Dispatch Width:    2
# CHECK-NEXT: IPC:               1.98
# CHECK-NEXT: Block RThroughput: 25.5

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      0     0.50                        pcmpgtb	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        pcmpgtd	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        pcmpgtw	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        psubb	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        psubd	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        psubq	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        psubw	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        psubb	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        psubd	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        psubq	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        psubw	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        andnps	%xmm0, %xmm0
# CHECK-NEXT:  1      0     0.50                        andnpd	%xmm1, %xmm1
# CHECK-NEXT:  1      0     0.50                        vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT:  1      0     0.50                        pandn	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        pandn	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT:  1      0     0.50                        vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT:  1      0     0.50                        vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  1      0     0.50                        xorps	%xmm0, %xmm0
# CHECK-NEXT:  1      0     0.50                        xorpd	%xmm1, %xmm1
# CHECK-NEXT:  1      0     0.50                        vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT:  1      0     0.50                        pxor	%mm2, %mm2
# CHECK-NEXT:  1      0     0.50                        pxor	%xmm2, %xmm2
# CHECK-NEXT:  1      0     0.50                        vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  1      0     0.50                        vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT:  1      0     0.50                        vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT:  1      0     0.50                        vpxor	%xmm3, %xmm3, %xmm5

# CHECK:      Register File statistics:
# CHECK-NEXT: Total number of mappings created:    0
# CHECK-NEXT: Max number of mappings used:         0

# CHECK:      *  Register File #1 -- JFpuPRF:
# CHECK-NEXT:    Number of physical registers:     72
# CHECK-NEXT:    Total number of mappings created: 0
# CHECK-NEXT:    Max number of mappings used:      0

# CHECK:      *  Register File #2 -- JIntegerPRF:
# CHECK-NEXT:    Number of physical registers:     64
# CHECK-NEXT:    Total number of mappings created: 0
# CHECK-NEXT:    Max number of mappings used:      0

# CHECK:      Resources:
# CHECK-NEXT: [0]   - JALU0
# CHECK-NEXT: [1]   - JALU1
# CHECK-NEXT: [2]   - JDiv
# CHECK-NEXT: [3]   - JFPA
# CHECK-NEXT: [4]   - JFPM
# CHECK-NEXT: [5]   - JFPU0
# CHECK-NEXT: [6]   - JFPU1
# CHECK-NEXT: [7]   - JLAGU
# CHECK-NEXT: [8]   - JMul
# CHECK-NEXT: [9]   - JSAGU
# CHECK-NEXT: [10]  - JSTC
# CHECK-NEXT: [11]  - JVALU0
# CHECK-NEXT: [12]  - JVALU1
# CHECK-NEXT: [13]  - JVIMUL

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   [13]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtd	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtw	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubb	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubd	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubq	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubw	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubb	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubd	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubq	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     psubw	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     andnps	%xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     andnpd	%xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pandn	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pandn	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     xorps	%xmm0, %xmm0
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     xorpd	%xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pxor	%mm2, %mm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     pxor	%xmm2, %xmm2
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT:  -      -      -      -      -      -      -      -      -      -      -      -      -      -     vpxor	%xmm3, %xmm3, %xmm5

# CHECK:      Timeline view:
# CHECK-NEXT:                     0123456789          0123456789          0123456789          0123456789
# CHECK-NEXT: Index     0123456789          0123456789          0123456789          0123456789

# CHECK:      [0,0]     DR   .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   pcmpgtb	%mm2, %mm2
# CHECK-NEXT: [0,1]     DR   .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   pcmpgtd	%mm2, %mm2
# CHECK-NEXT: [0,2]     .DR  .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   pcmpgtw	%mm2, %mm2
# CHECK-NEXT: [0,3]     .DR  .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: [0,4]     . DR .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT: [0,5]     . DR .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT: [0,6]     .  DR.    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT: [0,7]     .  DR.    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,8]     .   DR    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,9]     .   DR    .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,10]    .    DR   .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,11]    .    DR   .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,12]    .    .DR  .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,13]    .    .DR  .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,14]    .    . DR .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,15]    .    . DR .    .    .    .    .    .    .    .    .    .    .    .    .    .   .   psubb	%mm2, %mm2
# CHECK-NEXT: [0,16]    .    .  DR.    .    .    .    .    .    .    .    .    .    .    .    .    .   .   psubd	%mm2, %mm2
# CHECK-NEXT: [0,17]    .    .  DR.    .    .    .    .    .    .    .    .    .    .    .    .    .   .   psubq	%mm2, %mm2
# CHECK-NEXT: [0,18]    .    .   DR    .    .    .    .    .    .    .    .    .    .    .    .    .   .   psubw	%mm2, %mm2
# CHECK-NEXT: [0,19]    .    .   DR    .    .    .    .    .    .    .    .    .    .    .    .    .   .   psubb	%xmm2, %xmm2
# CHECK-NEXT: [0,20]    .    .    DR   .    .    .    .    .    .    .    .    .    .    .    .    .   .   psubd	%xmm2, %xmm2
# CHECK-NEXT: [0,21]    .    .    DR   .    .    .    .    .    .    .    .    .    .    .    .    .   .   psubq	%xmm2, %xmm2
# CHECK-NEXT: [0,22]    .    .    .DR  .    .    .    .    .    .    .    .    .    .    .    .    .   .   psubw	%xmm2, %xmm2
# CHECK-NEXT: [0,23]    .    .    .DR  .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,24]    .    .    . DR .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,25]    .    .    . DR .    .    .    .    .    .    .    .    .    .    .    .    .   .   vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,26]    .    .    .  DR.    .    .    .    .    .    .    .    .    .    .    .    .   .   vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,27]    .    .    .  DR.    .    .    .    .    .    .    .    .    .    .    .    .   .   vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,28]    .    .    .   DR    .    .    .    .    .    .    .    .    .    .    .    .   .   vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,29]    .    .    .   DR    .    .    .    .    .    .    .    .    .    .    .    .   .   vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,30]    .    .    .    DR   .    .    .    .    .    .    .    .    .    .    .    .   .   vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,31]    .    .    .    DR   .    .    .    .    .    .    .    .    .    .    .    .   .   andnps	%xmm0, %xmm0
# CHECK-NEXT: [0,32]    .    .    .    .DR  .    .    .    .    .    .    .    .    .    .    .    .   .   andnpd	%xmm1, %xmm1
# CHECK-NEXT: [0,33]    .    .    .    .DR  .    .    .    .    .    .    .    .    .    .    .    .   .   vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: [0,34]    .    .    .    . DR .    .    .    .    .    .    .    .    .    .    .    .   .   vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: [0,35]    .    .    .    . DR .    .    .    .    .    .    .    .    .    .    .    .   .   pandn	%mm2, %mm2
# CHECK-NEXT: [0,36]    .    .    .    .  DR.    .    .    .    .    .    .    .    .    .    .    .   .   pandn	%xmm2, %xmm2
# CHECK-NEXT: [0,37]    .    .    .    .  DR.    .    .    .    .    .    .    .    .    .    .    .   .   vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,38]    .    .    .    .   DR    .    .    .    .    .    .    .    .    .    .    .   .   vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT: [0,39]    .    .    .    .   DR    .    .    .    .    .    .    .    .    .    .    .   .   vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT: [0,40]    .    .    .    .    DR   .    .    .    .    .    .    .    .    .    .    .   .   vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [0,41]    .    .    .    .    DR   .    .    .    .    .    .    .    .    .    .    .   .   xorps	%xmm0, %xmm0
# CHECK-NEXT: [0,42]    .    .    .    .    .DR  .    .    .    .    .    .    .    .    .    .    .   .   xorpd	%xmm1, %xmm1
# CHECK-NEXT: [0,43]    .    .    .    .    .DR  .    .    .    .    .    .    .    .    .    .    .   .   vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: [0,44]    .    .    .    .    . DR .    .    .    .    .    .    .    .    .    .    .   .   vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: [0,45]    .    .    .    .    . DR .    .    .    .    .    .    .    .    .    .    .   .   pxor	%mm2, %mm2
# CHECK-NEXT: [0,46]    .    .    .    .    .  DR.    .    .    .    .    .    .    .    .    .    .   .   pxor	%xmm2, %xmm2
# CHECK-NEXT: [0,47]    .    .    .    .    .  DR.    .    .    .    .    .    .    .    .    .    .   .   vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [0,48]    .    .    .    .    .   DR    .    .    .    .    .    .    .    .    .    .   .   vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT: [0,49]    .    .    .    .    .   DR    .    .    .    .    .    .    .    .    .    .   .   vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT: [0,50]    .    .    .    .    .    DR   .    .    .    .    .    .    .    .    .    .   .   vpxor	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,0]     .    .    .    .    .    DR   .    .    .    .    .    .    .    .    .    .   .   pcmpgtb	%mm2, %mm2
# CHECK-NEXT: [1,1]     .    .    .    .    .    .DR  .    .    .    .    .    .    .    .    .    .   .   pcmpgtd	%mm2, %mm2
# CHECK-NEXT: [1,2]     .    .    .    .    .    .DR  .    .    .    .    .    .    .    .    .    .   .   pcmpgtw	%mm2, %mm2
# CHECK-NEXT: [1,3]     .    .    .    .    .    . DR .    .    .    .    .    .    .    .    .    .   .   pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: [1,4]     .    .    .    .    .    . DR .    .    .    .    .    .    .    .    .    .   .   pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT: [1,5]     .    .    .    .    .    .  DR.    .    .    .    .    .    .    .    .    .   .   pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT: [1,6]     .    .    .    .    .    .  DR.    .    .    .    .    .    .    .    .    .   .   pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT: [1,7]     .    .    .    .    .    .   DR    .    .    .    .    .    .    .    .    .   .   vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,8]     .    .    .    .    .    .   DR    .    .    .    .    .    .    .    .    .   .   vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,9]     .    .    .    .    .    .    DR   .    .    .    .    .    .    .    .    .   .   vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,10]    .    .    .    .    .    .    DR   .    .    .    .    .    .    .    .    .   .   vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,11]    .    .    .    .    .    .    .DR  .    .    .    .    .    .    .    .    .   .   vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,12]    .    .    .    .    .    .    .DR  .    .    .    .    .    .    .    .    .   .   vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,13]    .    .    .    .    .    .    . DR .    .    .    .    .    .    .    .    .   .   vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,14]    .    .    .    .    .    .    . DR .    .    .    .    .    .    .    .    .   .   vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,15]    .    .    .    .    .    .    .  DR.    .    .    .    .    .    .    .    .   .   psubb	%mm2, %mm2
# CHECK-NEXT: [1,16]    .    .    .    .    .    .    .  DR.    .    .    .    .    .    .    .    .   .   psubd	%mm2, %mm2
# CHECK-NEXT: [1,17]    .    .    .    .    .    .    .   DR    .    .    .    .    .    .    .    .   .   psubq	%mm2, %mm2
# CHECK-NEXT: [1,18]    .    .    .    .    .    .    .   DR    .    .    .    .    .    .    .    .   .   psubw	%mm2, %mm2
# CHECK-NEXT: [1,19]    .    .    .    .    .    .    .    DR   .    .    .    .    .    .    .    .   .   psubb	%xmm2, %xmm2
# CHECK-NEXT: [1,20]    .    .    .    .    .    .    .    DR   .    .    .    .    .    .    .    .   .   psubd	%xmm2, %xmm2
# CHECK-NEXT: [1,21]    .    .    .    .    .    .    .    .DR  .    .    .    .    .    .    .    .   .   psubq	%xmm2, %xmm2
# CHECK-NEXT: [1,22]    .    .    .    .    .    .    .    .DR  .    .    .    .    .    .    .    .   .   psubw	%xmm2, %xmm2
# CHECK-NEXT: [1,23]    .    .    .    .    .    .    .    . DR .    .    .    .    .    .    .    .   .   vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,24]    .    .    .    .    .    .    .    . DR .    .    .    .    .    .    .    .   .   vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,25]    .    .    .    .    .    .    .    .  DR.    .    .    .    .    .    .    .   .   vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,26]    .    .    .    .    .    .    .    .  DR.    .    .    .    .    .    .    .   .   vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,27]    .    .    .    .    .    .    .    .   DR    .    .    .    .    .    .    .   .   vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,28]    .    .    .    .    .    .    .    .   DR    .    .    .    .    .    .    .   .   vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,29]    .    .    .    .    .    .    .    .    DR   .    .    .    .    .    .    .   .   vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,30]    .    .    .    .    .    .    .    .    DR   .    .    .    .    .    .    .   .   vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,31]    .    .    .    .    .    .    .    .    .DR  .    .    .    .    .    .    .   .   andnps	%xmm0, %xmm0
# CHECK-NEXT: [1,32]    .    .    .    .    .    .    .    .    .DR  .    .    .    .    .    .    .   .   andnpd	%xmm1, %xmm1
# CHECK-NEXT: [1,33]    .    .    .    .    .    .    .    .    . DR .    .    .    .    .    .    .   .   vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: [1,34]    .    .    .    .    .    .    .    .    . DR .    .    .    .    .    .    .   .   vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: [1,35]    .    .    .    .    .    .    .    .    .  DR.    .    .    .    .    .    .   .   pandn	%mm2, %mm2
# CHECK-NEXT: [1,36]    .    .    .    .    .    .    .    .    .  DR.    .    .    .    .    .    .   .   pandn	%xmm2, %xmm2
# CHECK-NEXT: [1,37]    .    .    .    .    .    .    .    .    .   DR    .    .    .    .    .    .   .   vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,38]    .    .    .    .    .    .    .    .    .   DR    .    .    .    .    .    .   .   vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT: [1,39]    .    .    .    .    .    .    .    .    .    DR   .    .    .    .    .    .   .   vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT: [1,40]    .    .    .    .    .    .    .    .    .    DR   .    .    .    .    .    .   .   vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [1,41]    .    .    .    .    .    .    .    .    .    .DR  .    .    .    .    .    .   .   xorps	%xmm0, %xmm0
# CHECK-NEXT: [1,42]    .    .    .    .    .    .    .    .    .    .DR  .    .    .    .    .    .   .   xorpd	%xmm1, %xmm1
# CHECK-NEXT: [1,43]    .    .    .    .    .    .    .    .    .    . DR .    .    .    .    .    .   .   vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: [1,44]    .    .    .    .    .    .    .    .    .    . DR .    .    .    .    .    .   .   vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: [1,45]    .    .    .    .    .    .    .    .    .    .  DR.    .    .    .    .    .   .   pxor	%mm2, %mm2
# CHECK-NEXT: [1,46]    .    .    .    .    .    .    .    .    .    .  DR.    .    .    .    .    .   .   pxor	%xmm2, %xmm2
# CHECK-NEXT: [1,47]    .    .    .    .    .    .    .    .    .    .   DR    .    .    .    .    .   .   vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [1,48]    .    .    .    .    .    .    .    .    .    .   DR    .    .    .    .    .   .   vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT: [1,49]    .    .    .    .    .    .    .    .    .    .    DR   .    .    .    .    .   .   vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT: [1,50]    .    .    .    .    .    .    .    .    .    .    DR   .    .    .    .    .   .   vpxor	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,0]     .    .    .    .    .    .    .    .    .    .    .DR  .    .    .    .    .   .   pcmpgtb	%mm2, %mm2
# CHECK-NEXT: [2,1]     .    .    .    .    .    .    .    .    .    .    .DR  .    .    .    .    .   .   pcmpgtd	%mm2, %mm2
# CHECK-NEXT: [2,2]     .    .    .    .    .    .    .    .    .    .    . DR .    .    .    .    .   .   pcmpgtw	%mm2, %mm2
# CHECK-NEXT: [2,3]     .    .    .    .    .    .    .    .    .    .    . DR .    .    .    .    .   .   pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: [2,4]     .    .    .    .    .    .    .    .    .    .    .  DR.    .    .    .    .   .   pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT: [2,5]     .    .    .    .    .    .    .    .    .    .    .  DR.    .    .    .    .   .   pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT: [2,6]     .    .    .    .    .    .    .    .    .    .    .   DR    .    .    .    .   .   pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT: [2,7]     .    .    .    .    .    .    .    .    .    .    .   DR    .    .    .    .   .   vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,8]     .    .    .    .    .    .    .    .    .    .    .    DR   .    .    .    .   .   vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,9]     .    .    .    .    .    .    .    .    .    .    .    DR   .    .    .    .   .   vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,10]    .    .    .    .    .    .    .    .    .    .    .    .DR  .    .    .    .   .   vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,11]    .    .    .    .    .    .    .    .    .    .    .    .DR  .    .    .    .   .   vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,12]    .    .    .    .    .    .    .    .    .    .    .    . DR .    .    .    .   .   vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,13]    .    .    .    .    .    .    .    .    .    .    .    . DR .    .    .    .   .   vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,14]    .    .    .    .    .    .    .    .    .    .    .    .  DR.    .    .    .   .   vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,15]    .    .    .    .    .    .    .    .    .    .    .    .  DR.    .    .    .   .   psubb	%mm2, %mm2
# CHECK-NEXT: [2,16]    .    .    .    .    .    .    .    .    .    .    .    .   DR    .    .    .   .   psubd	%mm2, %mm2
# CHECK-NEXT: [2,17]    .    .    .    .    .    .    .    .    .    .    .    .   DR    .    .    .   .   psubq	%mm2, %mm2
# CHECK-NEXT: [2,18]    .    .    .    .    .    .    .    .    .    .    .    .    DR   .    .    .   .   psubw	%mm2, %mm2
# CHECK-NEXT: [2,19]    .    .    .    .    .    .    .    .    .    .    .    .    DR   .    .    .   .   psubb	%xmm2, %xmm2
# CHECK-NEXT: [2,20]    .    .    .    .    .    .    .    .    .    .    .    .    .DR  .    .    .   .   psubd	%xmm2, %xmm2
# CHECK-NEXT: [2,21]    .    .    .    .    .    .    .    .    .    .    .    .    .DR  .    .    .   .   psubq	%xmm2, %xmm2
# CHECK-NEXT: [2,22]    .    .    .    .    .    .    .    .    .    .    .    .    . DR .    .    .   .   psubw	%xmm2, %xmm2
# CHECK-NEXT: [2,23]    .    .    .    .    .    .    .    .    .    .    .    .    . DR .    .    .   .   vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,24]    .    .    .    .    .    .    .    .    .    .    .    .    .  DR.    .    .   .   vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,25]    .    .    .    .    .    .    .    .    .    .    .    .    .  DR.    .    .   .   vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,26]    .    .    .    .    .    .    .    .    .    .    .    .    .   DR    .    .   .   vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,27]    .    .    .    .    .    .    .    .    .    .    .    .    .   DR    .    .   .   vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,28]    .    .    .    .    .    .    .    .    .    .    .    .    .    DR   .    .   .   vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,29]    .    .    .    .    .    .    .    .    .    .    .    .    .    DR   .    .   .   vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,30]    .    .    .    .    .    .    .    .    .    .    .    .    .    .DR  .    .   .   vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,31]    .    .    .    .    .    .    .    .    .    .    .    .    .    .DR  .    .   .   andnps	%xmm0, %xmm0
# CHECK-NEXT: [2,32]    .    .    .    .    .    .    .    .    .    .    .    .    .    . DR .    .   .   andnpd	%xmm1, %xmm1
# CHECK-NEXT: [2,33]    .    .    .    .    .    .    .    .    .    .    .    .    .    . DR .    .   .   vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: [2,34]    .    .    .    .    .    .    .    .    .    .    .    .    .    .  DR.    .   .   vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: [2,35]    .    .    .    .    .    .    .    .    .    .    .    .    .    .  DR.    .   .   pandn	%mm2, %mm2
# CHECK-NEXT: [2,36]    .    .    .    .    .    .    .    .    .    .    .    .    .    .   DR    .   .   pandn	%xmm2, %xmm2
# CHECK-NEXT: [2,37]    .    .    .    .    .    .    .    .    .    .    .    .    .    .   DR    .   .   vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,38]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    DR   .   .   vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT: [2,39]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    DR   .   .   vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT: [2,40]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .DR  .   .   vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [2,41]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .DR  .   .   xorps	%xmm0, %xmm0
# CHECK-NEXT: [2,42]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    . DR .   .   xorpd	%xmm1, %xmm1
# CHECK-NEXT: [2,43]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    . DR .   .   vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: [2,44]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .  DR.   .   vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: [2,45]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .  DR.   .   pxor	%mm2, %mm2
# CHECK-NEXT: [2,46]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   DR   .   pxor	%xmm2, %xmm2
# CHECK-NEXT: [2,47]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .   DR   .   vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: [2,48]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    DR  .   vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT: [2,49]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    DR  .   vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT: [2,50]    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .DR .   vpxor	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: [3,0]     .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .DR .   pcmpgtb	%mm2, %mm2
# CHECK-NEXT: [3,1]     .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    . DR.   pcmpgtd	%mm2, %mm2
# CHECK-NEXT: [3,2]     .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    . DR.   pcmpgtw	%mm2, %mm2
# CHECK-NEXT: [3,3]     .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .  DR   pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: [3,4]     .    .    .    .    .    .    .    .    .    .    .    .    .    .    .    .  DR   pcmpgtd	%xmm2, %xmm2

# CHECK:      Average Wait times (based on the timeline view):
# CHECK-NEXT: [0]: Executions
# CHECK-NEXT: [1]: Average time spent waiting in a scheduler's queue
# CHECK-NEXT: [2]: Average time spent waiting in a scheduler's queue while ready
# CHECK-NEXT: [3]: Average time elapsed from WB until retire stage

# CHECK:            [0]    [1]    [2]    [3]
# CHECK-NEXT: 0.     4     0.0    0.0    0.0       pcmpgtb	%mm2, %mm2
# CHECK-NEXT: 1.     4     0.0    0.0    0.0       pcmpgtd	%mm2, %mm2
# CHECK-NEXT: 2.     4     0.0    0.0    0.0       pcmpgtw	%mm2, %mm2
# CHECK-NEXT: 3.     4     0.0    0.0    0.0       pcmpgtb	%xmm2, %xmm2
# CHECK-NEXT: 4.     4     0.0    0.0    0.0       pcmpgtd	%xmm2, %xmm2
# CHECK-NEXT: 5.     3     0.0    0.0    0.0       pcmpgtq	%xmm2, %xmm2
# CHECK-NEXT: 6.     3     0.0    0.0    0.0       pcmpgtw	%xmm2, %xmm2
# CHECK-NEXT: 7.     3     0.0    0.0    0.0       vpcmpgtb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 8.     3     0.0    0.0    0.0       vpcmpgtd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 9.     3     0.0    0.0    0.0       vpcmpgtq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 10.    3     0.0    0.0    0.0       vpcmpgtw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 11.    3     0.0    0.0    0.0       vpcmpgtb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 12.    3     0.0    0.0    0.0       vpcmpgtd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 13.    3     0.0    0.0    0.0       vpcmpgtq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 14.    3     0.0    0.0    0.0       vpcmpgtw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 15.    3     0.0    0.0    0.0       psubb	%mm2, %mm2
# CHECK-NEXT: 16.    3     0.0    0.0    0.0       psubd	%mm2, %mm2
# CHECK-NEXT: 17.    3     0.0    0.0    0.0       psubq	%mm2, %mm2
# CHECK-NEXT: 18.    3     0.0    0.0    0.0       psubw	%mm2, %mm2
# CHECK-NEXT: 19.    3     0.0    0.0    0.0       psubb	%xmm2, %xmm2
# CHECK-NEXT: 20.    3     0.0    0.0    0.0       psubd	%xmm2, %xmm2
# CHECK-NEXT: 21.    3     0.0    0.0    0.0       psubq	%xmm2, %xmm2
# CHECK-NEXT: 22.    3     0.0    0.0    0.0       psubw	%xmm2, %xmm2
# CHECK-NEXT: 23.    3     0.0    0.0    0.0       vpsubb	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 24.    3     0.0    0.0    0.0       vpsubd	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 25.    3     0.0    0.0    0.0       vpsubq	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 26.    3     0.0    0.0    0.0       vpsubw	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 27.    3     0.0    0.0    0.0       vpsubb	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 28.    3     0.0    0.0    0.0       vpsubd	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 29.    3     0.0    0.0    0.0       vpsubq	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 30.    3     0.0    0.0    0.0       vpsubw	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 31.    3     0.0    0.0    0.0       andnps	%xmm0, %xmm0
# CHECK-NEXT: 32.    3     0.0    0.0    0.0       andnpd	%xmm1, %xmm1
# CHECK-NEXT: 33.    3     0.0    0.0    0.0       vandnps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: 34.    3     0.0    0.0    0.0       vandnpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: 35.    3     0.0    0.0    0.0       pandn	%mm2, %mm2
# CHECK-NEXT: 36.    3     0.0    0.0    0.0       pandn	%xmm2, %xmm2
# CHECK-NEXT: 37.    3     0.0    0.0    0.0       vpandn	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 38.    3     0.0    0.0    0.0       vandnps	%xmm2, %xmm2, %xmm5
# CHECK-NEXT: 39.    3     0.0    0.0    0.0       vandnpd	%xmm1, %xmm1, %xmm5
# CHECK-NEXT: 40.    3     0.0    0.0    0.0       vpandn	%xmm3, %xmm3, %xmm5
# CHECK-NEXT: 41.    3     0.0    0.0    0.0       xorps	%xmm0, %xmm0
# CHECK-NEXT: 42.    3     0.0    0.0    0.0       xorpd	%xmm1, %xmm1
# CHECK-NEXT: 43.    3     0.0    0.0    0.0       vxorps	%xmm2, %xmm2, %xmm2
# CHECK-NEXT: 44.    3     0.0    0.0    0.0       vxorpd	%xmm1, %xmm1, %xmm1
# CHECK-NEXT: 45.    3     0.0    0.0    0.0       pxor	%mm2, %mm2
# CHECK-NEXT: 46.    3     0.0    0.0    0.0       pxor	%xmm2, %xmm2
# CHECK-NEXT: 47.    3     0.0    0.0    0.0       vpxor	%xmm3, %xmm3, %xmm3
# CHECK-NEXT: 48.    3     0.0    0.0    0.0       vxorps	%xmm4, %xmm4, %xmm5
# CHECK-NEXT: 49.    3     0.0    0.0    0.0       vxorpd	%xmm1, %xmm1, %xmm3
# CHECK-NEXT: 50.    3     0.0    0.0    0.0       vpxor	%xmm3, %xmm3, %xmm5
