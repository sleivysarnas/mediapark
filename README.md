# mediapark
Mini-tasks for entry level iOS position in mediapark

1. We have theoretical shop object with working hours for each day. Demo object structure
is provided below, image if this is the data we received from BE and we have to work with
it. “WorkHours” is optional because if it is that means shop is not working that day,
otherwise we would have some formatted date, like “10:00", “16:30”, etc…
Your main task is to display shops working hours sorted by weekdays and time.
If several days in succession have exact same time, those days should be grouped
together (Monday-Wednesday in the example below).
If shop is closed then instead of time show “Closed” (Friday in the example below).

Example is shown in example.jpg

2. Write a function to find the longest common prefix from string array (function should
take string as parameter and return a string). For example, input could be [“market”,
“maxima”, “mama”], then longest common prefix would be “ma”. Another example -
[“sale”, “safe”, “sun”], then result would be “s”. If there is no common prefix return an
empty string.

3. In given a sentence return last words length (characters count). For example “Today is
sunny” - answer is 5, because “sunny” has 5 letters. Write a function that takes a 
string as parameter and returns number.

4. Write a function, that takes an array of Int’s and returns filtered array without
duplicates. You can not use Set. An example:
Input - [1,1,3,4,5,5], output - [1,3,4,5]

5. Write a function excel sheet column converter, that takes String as a parameter and
returns a number of the column. Some examples:
A -> 1
B -> 2
C -> 3
Z -> 26
AA -> 27
AB-> 28

6. Integer to Roman number converter. Write a function that takes an Int as parameter
and returns Roman number. Here’s Roman number converter:
Symbol Value
I 1
V 5
X 10
L 50
C 100
D 500
M 1000

7. Calculate smallest time difference. Function should take 2 strings in “hh:mm” format
(hours:minutes) and return a difference in minutes. For example:
Input - [“13:45”, ”12:45”], output 60
Input - [“13:45”, ”14:00”], output 15

8. Write a mini investment algorithm. Function will take an array of numbers, where each
number represents a stock price for a single day. Your goal is to buy stock when price
is low and sell when price is high. You cannot buy until you have sold your stock.

Example:
Input - [1, 4, 5, 6, 2, 8], output - 11
Explanation you should buy stock from for 1 (on 1st day), sell it for 6 (on 4th day), buy
it again for 2 (on 5th day) and sell it next day for 8. Thus total profit would be 6-1+8-2
= 11

Another example
Input - [6, 3, 3, 6, 2, 9, 1], output - 10
This time you should buy stock on 2nd day for 3, sell it on 5th day for 6, buy it again
on 6th day for 2 and sell it next day for 9. Thus total profit would be: 6-3+9-2 = 10
