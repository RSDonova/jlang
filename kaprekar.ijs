Note 'https://en.wikipedia.org/wiki/Kaprekar%27s_routine'
    In number theory, Kaprekar's routine is an iterative algorithm that, with
  each iteration, takes a natural number in a given number base, creates two
  new numbers by sorting the digits of its number by descending and ascending
  order, and subtracts the second from the first to yield the natural number
  for the next iteration. It is named after its inventor, the Indian
  mathematician D. R. Kaprekar.
    Kaprekar showed that in the case of four-digit numbers in base 10, if the
  initial number has at least two distinct digits, after seven iterations this
  process always yields the number 6174, which is now known as Kaprekar's
  constant.
)

NB. <number of digits> kaprekar <base>
kaprekar =: 2 : '[:|@-/(,:|.)@sort&.:((m # n)#:])'

Note 'Demonstrations'
  K4b10 =: 4 kaprekar 10
  echo K4b10^:(_) 8174 NB. ==> 6174

  K3b10 =: kaprekar 10
  K3b10^:(_) 123 NB. ==> 495

  K3b4 =: 3 kaprekar 4
  K3b4^:(_) 31 NB. ==> 30 = 4b132
  exit 1
)


Hi! I just wrote a Kaprekar routine in J that I see you may be interested in:

NB. repdigits forbidden
nope=:1111*>:i.9 

to =: {{ x+`-@.(x>y)i.>:|y-x }}

NB. kaprekar number of y
kaprekar=: 3 : 0 "0
m=:_4{.'0',":y  NB. leading 0 if required
".'0',": (".\:~m)-("./:~m)
)

NB. complete chain starting at y
kapreset =: 3 : 0
 , each,. kaprekar^:(<'') each y -. nope
)

NB. ave no. steps all numbers
   (+/%#)  ># each kapreset  (1000 to 9998)
5.67857

   kaprekar^:(<'')1001
1001 1089 9621 8352 6174

   ,. kaprekar^:(<'') each 1008 9976 5679
┌───────────────────────────────────────┐
│1008 8082 8532 6174                    │
├───────────────────────────────────────┤
│9976 3177 6354 3087 8352 6174          │
├───────────────────────────────────────┤
│5679 4086 8172 7443 3996 6264 4176 6174│
└───────────────────────────────────────┘
   

 kapreset 1000 to 1005
┌───────────────────────────────────────┐
│1000 999 8991 8082 8532 6174           │
├───────────────────────────────────────┤
│1001 1089 9621 8352 6174               │
├───────────────────────────────────────┤
│1002 2088 8532 6174                    │
├───────────────────────────────────────┤
│1003 3087 8352 6174                    │
├───────────────────────────────────────┤
│1004 4086 8172 7443 3996 6264 4176 6174│
├───────────────────────────────────────┤
│1005 5085 7992 7173 6354 3087 8352 6174│
└───────────────────────────────────────┘
   

6174, known as Kaprekar's constant, 
is a fixed point of this algorithm.

Cheers!

Richard Donovan 2025-02-21
