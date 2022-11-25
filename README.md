# ChristmasCodingChallenge
Gomibo Christmas Coding Challenge


### Challenge 1: Santa does cardio

In order to prepare for the intense activity that he has to perform during Christmas, Santa is trying to get in shape. For the past weeks, he has been doing a lot of Survival Runs, to get his cardio resistance back on track! 

This week's survival run the most challenging one so far. He has to climb stairs in an enormous appartment building. The received instructions with the directions he should take are a little confusing. He will be starting on the ground floor (floor 0) and then he has to follow the instructions, one step at a time. 

An opening parenthesis,  `(`, means he should go up one floor, and a closing parenthesis,  `)`, means he should go down one floor.

Since this is Santa we are talking about - the apartment building is also magical. There is no limit to how many floors up or down he can go.

For example:

- `()` and `((()))` and `()()()` will take him to floor 0.
- `((((` and `((((()` will both take him to floor 4
-   `))(((((`  results in floor  `3`.
-   `())`  and  `))(`  both result in floor  `-1`  (the first basement level).
-   `)))`  and  `)())())`  both result in floor  `-3`.

To  _what floor_  do the instructions take Santa?

The input if your challenge can be found in the file `input-1.txt`

### Challenge 2: Home security

After the intensive workout, Santa can't wait to go home and relax. However, when he gets to his door - the code he usually use doesn't work any more! It looks like someone has changed it! Santa checks his phone, and sees a message from Mrs. Claus. Apparently, she changed the code to something more secure. And since she likes puzzles, she made the code into a puzzle as well! She left the instructions in a message. 

- each button to be pressed can be found by starting on the previous button and moving to adjacent buttons on the keypad
- `U`  moves up,  `D`  moves down,  `L`  moves left, and  `R`  moves right 
- each line of instructions corresponds to one button, starting at the previous button (or, for the first line,  _the "5" button_); 
- press whatever button you're on at the end of each line 
- if a move doesn't lead to a button, ignore it.

The keypad is the same one as always:

```
1 2 3
4 5 6
7 8 9
```
Suppose your instructions are:
```
ULL
RRDDD
LURDL
UUUUD
```
-   You start at "5" and move up (to "2"), left (to "1"), and left (you can't, and stay on "1"), so the first button is  `1`.
-   Starting from the previous button ("1"), you move right twice (to "3") and then down three times (stopping at "9" after two moves and ignoring the third), ending up with  `9`.
-   Continuing from "9", you move left, up, right, down, and left, ending with  `8`.
-   Finally, you move up four times (stopping at "2"), then down once, ending with  `5`.

So, in this example, the home code is  `1985`.

Your puzzle input is in the `input-2.txt` file. What is the code to Santa's house?

### Challenge 3: The newspaper quiz 

After solving the puzzle left by Mrs. Claus, Santa was finally able to get into his house and relax. On a side table, he sees the newspaper, where Mrs. Claus highlighted another puzzle for him! She also left a note: "Can you find the answer?". It looks like Mrs. Claus is challenging him again! 

The puzzle in the newspaper has to do with triangles. In theory, a valid triangle has the following property: the sum of any two sides has to be larger than the remaining side. For example, a triangle with the sides `5 10 25` is not a valid triangle, because `5 + 10` is not larger than `25`. 

Santa looks at the list of side lenghts, and his task is to find how many of the triangles are valid ones. 
Can you help Santa solve the challenge?

Your puzzle input is in the `input-3.txt` file.

### Challenge 4: Chocolate milk

After such a difficult newspaper puzzle its time for a cup of Santa's favroute chocolate milk. The elves love chrismas songs and whistling and so the dispenser is operated by whisteling the right tones. Sadly for Santa his memory isn't what it used to be, luckily however the machine only dispenses chocolate milk and one of the elves pasted a sticky-note to the side of the machine with instructions on what he whistled last time. 

The cruel elf has written the instructions in some kind of assembly which is meant to operate on a set of registers that are each named with a single letter and that can each hold a single integer. Santa supposes each register should start with a value of 0.

There aren't that many instructions, so it shouldn't be hard to figure out what they do. Here's what Santa determines:
```
    snd X plays a sound with a frequency equal to the value of X.
    set X Y sets register X to the value of Y.
    add X Y increases register X by the value of Y.
    mul X Y sets register X to the result of multiplying the value contained in register X by the value of Y.
    mod X Y sets register X to the remainder of dividing the value contained in register X by the value of Y (that is, it sets X to the result of X modulo Y).
    rcv X recovers the frequency of the last sound played, but only when the value of X is not zero. (If it is zero, the command does nothing.)
    jgz X Y jumps with an offset of the value of Y, but only if the value of X is greater than zero. (An offset of 2 skips the next instruction, an offset of -1 jumps to the previous instruction, and so on.)
```

Many of the instructions can take either a register (a single letter) or a number. The value of a register is the integer it contains; the value of a number is that number.

After each jump instruction, the program continues with the instruction to which the jump jumped. After any other instruction, the program continues with the next instruction. Continuing (or jumping) off either end of the program terminates it.

For example:

```
set a 1
add a 2
mul a a
mod a 5
snd a
set a 0
rcv a
jgz a -1
set a 1
jgz a -2

```

The first four instructions set a to `1`, add `2` to it, square it, and then set it to itself modulo `5`, resulting in a value of `4`.

    
Then, a sound with frequency `4` (the value of a) is played.

After that, a is set to `0`, causing the subsequent rcv and jgz instructions to both be skipped (rcv because a is 0, and jgz because a is not greater than 0).
    
Finally, a is set to `1`, causing the next jgz instruction to activate, jumping back two instructions to another jump, which jumps again to the rcv, which ultimately triggers the recover operation.

At the time the recover operation is executed, the frequency of the last sound played is `4`.


The instructions can be found under `input-4.txt`:

***What is the value of the frequency Santa need to whistle to get his well deserved Chocolate drink?*** (the value of the most recently played sound the first time a rcv instruction is executed with a non-zero value) 







