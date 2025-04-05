; RUN: llc < %s -mtriple=i386-unknown-unknown -mattr=+sse -O3 | FileCheck %s --check-prefixes=X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=-sse2,+sse -O3 | FileCheck %s --check-prefixes=X64

define void @store_v2f32_constant(ptr %v) {
; X86-LABEL: store_v2f32_constant:
; X86:       # %bb.0:
; X86-NEXT:    movl 4(%esp), %eax
; X86-NEXT:    movaps {{\.?LCPI[0-9]+_[0-9]+}}, %xmm0

; X64-LABEL: store_v2f32_constant:
; X64:       # %bb.0:
; X64-NEXT:    movaps {{\.?LCPI[0-9]+_[0-9]+}}(%rip), %xmm0
  store <2 x float> <float 2.560000e+02, float 5.120000e+02>, ptr %v, align 4
  ret void
}
