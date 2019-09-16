


/******************************************************************************
* file: min_max.s
* author: Pravir
* Guide: Prof. Madhumutyam IITM, PACE
******************************************************************************/

/*
  Code to find minimum, maximum and toal number of elemets,
  in a set of positive elments
  */

  @ BSS section
      .bss
  @ DATA SECTION
      .data
data_items: .word 10, 4, 28, 100, 8, 0

//0is used to terminate the data

  @ TEXT section
      .text

.globl _main

_main:
LDR r1, =data_items //get the starting address of data_items
LDR r2, [r1] //get value of data_items[0]
MOV r3, r2 //stores minimum element
MOV r4, r2 //stores maxium element
MOV r5, #0 //stores number of element

//while(data_items[i] != 0), loop through
loop:
  CMP r2, #0 //test condition for loop
  BLE done //if 0 or negative number is encountered, exit the loop
  ADD r5, #1 //increase number of element by 1
  CMP r2, r3
  BGE check_for_max_element
  MOV  r3, r2 //if content of r2 < content of r3, move content of r2 to r3

  loop_invarinace:
    ADD r1, r1, #4 //get the address of next data_item
    LDR r2, [r1] //get value of next data_item
    B loop

  check_for_max_element:
    CMP r2, r4
    BLE loop_invarinace
    MOV r4, r2 //if content of r2 > content of r4, move content of r2 to r4
    B loop_invarinace
done:

