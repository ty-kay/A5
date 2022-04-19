.equ    True, 1
.equ    False, 0

.section ".data"

.global l

lLineCount: .quad 0
lWordCount: .quad 0
lCharCount: .quad 0
iInWord: .word False

.section ".bss"

iChar: .skip 1

    adr x0, iChar
    ldr w1, [x0]
    adr x1, lCharCount
    ldr w2, [x1]
    adr x2, lWordCount
    ldr w3, [x2]
    adr x3, iInWord
    ldr w4, [x3]

    loop1:
    cmp w1, EOF
    beq endloop1
    add w2, w2, 1
    if !isspace(iChar) goto 3
    if !(iInWord) goto 4
    add w3, w3, 1
    










int main(void)
{
   while ((iChar = getchar()) != EOF)
   {
      lCharCount++;

      if (isspace(iChar))
      {
         if (iInWord)
         {
            lWordCount++;
            iInWord = FALSE;
         }
      }
      else
      {
         if (! iInWord)
            iInWord = TRUE;
      }

      if (iChar == '\n')
         lLineCount++;
   }

   if (iInWord)
      lWordCount++;

   printf("%7ld %7ld %7ld\n", lLineCount, lWordCount, lCharCount);
   return 0;
}