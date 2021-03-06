/*
*   Copyright 2016 Purdue University
*   
*   Licensed under the Apache License, Version 2.0 (the "License");
*   you may not use this file except in compliance with the License.
*   You may obtain a copy of the License at
*   
*       http://www.apache.org/licenses/LICENSE-2.0
*   
*   Unless required by applicable law or agreed to in writing, software
*   distributed under the License is distributed on an "AS IS" BASIS,
*   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
*   See the License for the specific language governing permissions and
*   limitations under the License.
*
*
*   Filename:     shift.S
*
*   Created by:   John Skubic
*   Email:        jskubic@purdue.edu
*   Date Created: 07/01/2016
*   Description:  Tests shifting logical and arithmetic 
*/

#include "riscv_test.h"

RVTEST_DATA_DUMP_BEGIN

RVTEST_INTVEC_USER_BEGIN
  nop
RVTEST_INTVEC_SUPER_BEGIN
  nop
RVTEST_INTVEC_HYPER_BEGIN
  nop
RVTEST_INTVEC_MACH_BEGIN
  nop

RVTEST_CODE_BEGIN

main:
    ori x1, x0, 0xf0
    ori x2, x0, 0x55
    ori x3, x0, 0x03
    lui x5, 0xf5f5f

    #top bit set, shift right rtype
    la x4, tdat0
    sra x6, x5, x3
    sw x6, 0(x4)

    la x4, tdat1
    srl x6, x5, x3
    sw x6, 0(x4)

    #top bit set, shift right itype
    la x4, tdat2
    srli x6, x5, 5
    sw x6, 0(x4)  

    la x4, tdat3
    srai x6, x5, 5
    sw x6, 0(x4)  

    #shift left immediate
    la x4, tdat4  
    slli x6, x5, 5
    sw x6, 0(x4)

RVTEST_CODE_END

.data
#test data goes here
tdat0:  .word 0xbad0bad0
tdat1:  .word 0xbad1bad1
tdat2:  .word 0xbad2bad2
tdat3:  .word 0xbad3bad3
tdat4:  .word 0xbad4bad4

RVTEST_DATA_DUMP_END



