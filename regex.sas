data old;
input yearsexp $60.;
datalines;
11 billion
12
1+
2+++
5
98
9w
6
8*
8 years
potato
i was in the group for 175 years
;
run;

data new; /*define your data step and data sets*/
length exp_new $ 10; /* create a new var */
keep exp_new; /* make sure you keep it when you load the old data */
num = prxparse("/\d+/"); /*define a query that will find all the digits*/

set old; /* load your old data */
if prxmatch(num, yearsexp) then do; /* if there is a match, then assign it to a new variable, exp_new */
	exp_new = prxposn(num, 0, yearsexp); 
/*this searches each entry of the yearsexp variable for any numbers (num)
The "0" in the second slot says to return the entire match (doesn't matter as much here, but for future ref) */
end;

exp_num = exp_new * 1; /* convert to numeric */

keep exp_new exp_num yearsexp; /*keep all the vars you want*/
run;
