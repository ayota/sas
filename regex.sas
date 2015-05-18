data old;
input yearsexp $60.;
datalines;
11 years
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
99.872
8.w
;
run;


data new; /*define your data step and data sets*/
length exp_new $ 10; /* create a new var */
keep exp_new; /* make sure you keep it when you load the old data */
num = prxparse("/\d+[.]?\d*/"); /*define a query that will find all the digits*/

set old; /* load your old data */
if prxmatch(num, yearsexp) then do; /* if there is a match, then assign it to a new variable, exp_new */
	exp_new = prxposn(num, 0, yearsexp); 
/*this searches each entry of the yearsexp variable 
(w/e it is actually called) for any numbers (num)
The "0" in the second slot says to return the entire match, so it will capture 1
or 2 (or 3?) digit years*/
end;

exp_num = exp_new * 1; 
/* I was wrong, you do need to create a new var, and then make it equal to doing math on 
the stupid-nonnumeric one */

keep exp_new exp_num yearsexp; /*keep all the vars you want*/
run;
