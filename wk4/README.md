<h1 align="center">Week 4</h1>

<h1>Tutorial Questions </h1>

<h2>Q1</h2>
<!-- Start of Q  -->
<details> 
<!-- ==========  -->

<summary>
A COMP2041 student wrote this script, named start_lab04.sh, to run before the Week 4 lab. When Running the script however it did not work.

```sh
#! /bin/dash

cd ~/labs/04

ex1=jpg2png
ex2=email_image
ex3=date_image
ex4=tag_music
```

</summary>

###

- A shell script is executed by a separate shell so changes to its working directory only affect it. Same with its variables
- You can indicate that the commands in a file are to be run by the current shell rather than a separate program. Shown below:

```sh
$ . ./start_lab04.sh
$ pwd
/home/z1234567/labs/04
$ echo $ex1 $ex2 $ex3 $ex4
jpg2png email_image date_image tag_music
```

- The main difference is the inclusion of the `.` which tells the shell to run the script in the current shell env instead of making a new one
- The main takeaway is that when running a script it runs a subshell normally that does not affect the parent env

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q4</h2>
<details> 
<!-- ==========  -->
<summary>
The course code for COMP2041 has been changed to COMP2042 and the course code for COMP9044 has been changed to COMP9042.

Write a shell script, `update_course_code.sh` which appropriately changes the course code in all the files it is given as arguments.

</summary>

###

<!-- End of Q  -->
</details> 
<!--  =======  -->

<h2>Q6</h2>
<!-- Start of Q  -->
<details> 
<!-- ==========  -->
<summary>
CSE systems have a command, mlalias, which prints information about a specified mail alias.

Note: We can only run this command on CSE machines

For example:

```
$mlalias cs2041.24T2.tutors
          Alias: cs2041.24T1.tutors
    Description: 24T1 COMP2041 tutors
          Flags: personal, public, unprivileged, members_can_post, closed
      Addresses:
                 z5364339
                 z5362057
                 z5358476
                 z5416950
                 z5115658
                 z5492331
                 z5312070
                 z5360130
                 z5310685
                 z5358496
                 z3121449
                 z5309949
                 z5363653
                 z5421623
                 z5478419
                 z5311762
                 z5361515
                 z5420849
                 z5419020
                 z5437869
                 z5361210
                 z5359557
                 z5422337
                 z5425577
                 z5420531
                 z5359448
                 z5366832
                 z5363122
                 z5421214
                 z5418202
                 z5358896
                 z5208931
                 z5483411
                 andrewt
         Owners: cs2041
        Senders: @COMP2041_Lecturer, @COMP2041_Supervisor, @Employee
```

</summary>

###

- There are multiple ways to solve this question

```sh
# We want to grab all the IDs first
      # We need to specify an option so we do `p` to print out to stdout
      # -n prevents sed default printing behaviour
# Next we want to cut out some unwanted lines being the 1st and last
# The `head` cmd removes the last line
# The `tail` cmd removes the first line
# Get rid of all spaces and then filter only zIDs
mlalias cs2041.24T2.tutors |
sed -nE '/Addresses:/,/Owners:/p' |
head -n -1 |
tail -n +2 |
tr -d ' ' |
grep -E 'z[0-9]{7}'
```

```sh

mlalias -r cs2041.24T2.tutors |    # Use "raw" output mode
cut -d: -f3 |                      # Take field 3 (addresses)
tr ',' '\n' |                      # replace commas with newlines
grep -E 'z[0-9]{7}'                # Find only zIDs
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<h2>Q7</h2>
<!-- Start of Q  -->
<details> 
<!-- ==========  -->
<summary>
CSE system have a command, acc, which prints information about a specified user.
For example:

```
$ acc z5417087

           User Name : z5417087            Aliases : xavc
                 Uid : 3731                    Gid : 3731
             Expires : 16mar2025

              Groups : cs1521[23sep2024], classadmin[16jun2025]
       Group classes : classadmin[16jun2025]
        User classes : 3779_Student, COMP1521_Supervisor[23sep2024]
                     : COMP4961t2_Student[06oct2024]
                     : COMP6453t2_Student[23sep2024]
        Misc classes :

                Name : Mr Cooney, Xavier (Xavier Cooney)
            Position : Casual Academic (Sch: Computer Science & Eng)
         UNSW Number : 5417087
           UNSW Mail : x.cooney@unsw.edu.au
           UNSW Home : //INFPWFS219.ad.unsw.edu.au/Student037$/z5417087
            CSE Home : /import/reed/5/z5417087
```

</summary>

###

```sh
# Breaking this down
# First we get all the lines between the two empty lines as that contains the info we want
# We then want to cut on the `:` to separate the class names we want
# Then we want to break them up so we switch the `,` with `\n`
# Finally we use a capture group which is the regex in `()` which we can use later on as denoted
# by the \1

acc z5417087 |
sed -n '/^$/,/^$/p' |
cut -d':' -f2 |
tr ',' '\n' |
sed -nE 's/.*([A-Z]{4}[0-9]{4})t[0-3]_Student.*/\1/p'
```

<!-- End of Q  -->
</details> 
<!--  =======  -->

<h2>Q8</h2>
<!-- Start of Q  -->
<details> 
<!-- ==========  -->
<summary>
Use the pipeines from the above 2 questions to write a shell script which print a list of courses taken by COMP2041 tutors with counts of how many COMP2041 tutors take each,
like this:

```
7 COMP6771
6 COMP3900
6 COMP3331
5 COMP3311
5 COMP3121
...
```

</summary>

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q9</h2>
<details> 
<!-- ==========  -->
<summary>Example</summary>

###

<!-- End of Q  -->
</details> 
<!--  =======  -->

<!-- Start of Q  -->
<h2>Q11</h2>
<details> 
<!-- ==========  -->
<summary>Example</summary>

###

<details> 
<summary>a)</summary>

</details>

<!-- End of Q  -->
</details> 
<!--  =======  -->
