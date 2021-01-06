# CILA

This Repository contains all the CILA versions released to the PUBLIC that can be run using [lua 5.1+](https://www.lua.org/download.html)

This Repository only includes CILA Versions 3.2 and under. 

The next public release will be CILA 4.0 but will only be available on ROBLOX; It wont be able to run on repl.it or Lua 5.1.

The ROBLOX version (CILA 4.0 FRAMEWORK) will use ROBLOX hosted datastoring and not .json files.

There is a small chance I will publish a 3.x later, using advanced question matching, but chances are I wont.

*I do not own repl.it, repl, Lua.org, or Lua.*



# CILA VERSIONS & EXPLANATIONS

## CILA 1.9

CILA 1.9, is the first version of CILA released to the PUBLIC. This runs on normal pre-defined questions and answers stored in tables. When required, it will access those tables and will try to find a match in the question, then if it finds one, it will print out the stored answer.


## CILA 2.0

CILA 2.0 is very similar to CILA 1.9 and runs on the same framework (CILA 1.0 FRAMEWORK). This version is cleaned up, and some bugs were fixed.

CILA 1.0 FRAMEWORK is discontinued and will no longer get support for bug fixes and/or updates in questions/answers.


## CILA 3.0

CILA 3.0 runs on a new CILA framework (CILA 3.0 FRAMEWORK), and uses semi-machine learning.

It stores learned data in a .json file (see the files for more info in file name) and retreives this data when a question is asked.

When a qusetion is asked, it finds the same question in the table (but is the string is lowered to make it easier to find similar questions).

When a question is asked and CILA doesnt understand it, it will ask the user for an EXACT answer. When the user replies, it saves that answer with the question in the .json file for future refrence. *All strings stored in .json file is lowered using `string.lower()`*


## CILA 3.2

CILA 3.2 is the latest release to the PUBLIC that can be run using lua 5.1+. CILA 3.2 runs on the same CILA framework as 3.0 (CILA 3.0 FRAMEWORK). It is a little bit polished and some bugs are fixed. These fixes are minor changes and minor bug fixes.

Although CILA 3.2 and CILA 3.0 are basically the same, it is recommended to use 3.2 on any project or work instead of 3.0. You are allowed to use any CILA versions (as long as complying with the license) but 3.2 is recommended for new work.


## CILA 4.0

CILA 4.0 is only released to ROBLOX, and uses a different but very similar framework as the CILA 3.0 FRAMEWORK.

The main differences are that it uses ROBOX datastore to save its questions and answers, and instead of finding the same question to answer with, it does a couple of things differently:
1. It breaks up both the questiont its checking, and the question asked into tables using `string.split()`
2. It goes through each of the words and tries to find a match in words using `string.find()`
3. If it finds a match, that match is returned 

*It always saves everythign in lower string format using `string.lower()`*

CILA 4.0 FRAMEWORk is a lot more advanced and works a lot better than the CILA 3.0 FRAMEWORK, but it isn't amazing, it still has some really huge problems that CILA 3.0 FRAMEWORK deals with better. CILA 4.0 FRAMEWORK learns better, and answers better (in most cases), but also has some problems with finding the right answer in a set of similar questions.

*CILA 4.0's source code will not be publicly visible or available. This is done so that the main game in ROBLOX doesn't get hijacked or edited unintentionally.*
