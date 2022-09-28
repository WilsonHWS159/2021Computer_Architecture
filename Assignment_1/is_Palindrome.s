.data

arr:    .word 0, 123456789, 12321, -878, -789
str1:    .string " is palindrome\n"
str2:    .string " is not palindrome\n"

.text

# t0 = i
# t1 = data[i]
# t2 = tmp
# t3 = tmp_mod
# t4 = rv_Int
# t5 = 10, for operations
# t6 = 5, sizeof(data)/sizeof(int)
# a0 = print out message
# s1 = address of arr
# s2 = address of str

main:
    la        s1, arr                # store the address of data in s1
    addi      t6, x0, 5              # store the size of data in t6
    
for_loop:
    lw        t1, 0(s1)              # load word from data[i]
    bge       t0, t6, end            # if i >= size of data, go to end
    jal       is_Palindrome   
    jal       print_result
    addi      t0, t0, 1              # i++
    addi      s1, s1, 4              # *(data ++)
    j         for_loop

is_Palindrome:
    addi      t2, t1, 0              # tmp = data[i]
    addi      t4, x0, 0              # rv_Int = 0

while_loop:
    addi      t5, x0, 10
    mul       t4, t4, t5             # rv_Int *= 10
    rem       t3, t2, t5             # t3 = tmp % 10
    add       t4, t4, t3             # rv += tmp % 10
    div       t2, t2, t5             # tmp /= 10
    bne       t2, x0, while_loop     # while(tmp)
    ret

print_result:
    add       a0, x0, t1             # store data[i] in a0
    addi      a7, x0, 1            
    ecall                            # print data[i]
    bne       t1, t4, print_inp      # if data[i] != rv_Int, go to print_inp
    blt       t1,x0 , print_inp      # if data[i] is negative, go to print_inp
    la        a0, str1               # store address of str1 in a0
    addi      a7, x0, 4
    ecall                            # print str1
    ret
    
print_inp:
    la        a0, str2               # store address of str2 in a0
    addi      a7, x0, 4
    ecall                            # print str2
    ret

end:
    addi      a7, x0, 10
    ecall                            # program stop
