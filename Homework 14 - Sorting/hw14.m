%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name         : Caitlyn Caggia
% GT Email     : ccaggia3@gatech.edu
% t-Square ID  : ccaggia3
% Homework     : hw14
% Course       : CS1371
% TA's Name    : Aditya Garg
% Section      : A04
% Collaboration: "I worked on the homework assignment alone, using
%                  only course materials."
%                
%
%
% Files provided with this homework:  
%   ABCs_graphTheory.m
%   ABCs_hw14_pretest.p
%   ABCs_sorting.m
%   cabbages.xls
%   cabbages_soln.xls
%   compareExtrap1.png
%   compareExtrap2.png
%   compareExtrap3.png
%   compareExtrap_soln.p
%   deepestCell_soln.p
%   evolvePokemon_soln.p
%   hangman_soln.p
%   hw14.m
%   interweave_soln.p
%   madLibs_soln.p
%   number.xls
%   number_soln.xls
%   playHangman_soln.p
%   polarVortex_soln.p
%   snowpocalypseMadlib.txt
%   snowpocalypseMadlib_fixed_soln.txt
%   switchCase_soln.p
%   valentineMadlib.txt
%   valentineMadlib_fixed_soln.txt
%   voltages.xls
%   voltages_soln.xls
%   wordlist1.txt
%   wordlist2.txt
%   xlsFormula_soln.p
%
% Files to submit:
%   hw14.m
%	ABCs_graphTheory.m
%	ABCs_sorting.m
%	interweave.m
%	polarVortex.m
%	hangman.m
%	switchCase.m
%	playHangman.m
%	madLibs.m
%	xlsFormula.m
%	evolvePokemon.m
%	deepestCell.m
%	compareExtrap.m
%
% Instructions:
%   1) Follow the directions for each problem very carefully or you will
%   lose points.
%   2) Make sure you name functions exactly as described in the problems or
%   you will not receive credit.
%   3) Read the announcements! Any clarifications and/or updates will be
%   announced on T-Square. Check the T-Square announcements at least once
%   a day.
%   4) You should not use any of the following functions in any file that 
%   you submit to T-Square:
%       a) clear
%       b) clc
%       c) solve
%       d) input
%       e) disp
%       f) close all
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%==========================================================================
% PART 1.  ABC Problems
%--------------------------------------------------------------------------
%
% Part of this homework are two m-file called "ABCs_graphTheory" and
% "ABCs_sorting". Open these files in MATLAB and complete it according to
% the directions contained within.
%
% Files to Complete: 
%       - ABCs_sorting.m
%       - ABCs_graphTheory
% ABCs File Testing:
%  >> ABCs_hw14_pretest
%
%==========================================================================
% PART 2. Drill Problems
%--------------------------------------------------------------------------
%
% The drill problems cover the following major topic(s):
%	All Topics
%
% Follow the directions carefully and make sure files names as well as
% function headers are written exactly as described in the problem text. If
% your function headers are not written as specified, then you will recieve
% an automatic zero for the problem.
%
% All drill problems must be functions (i.e. contain valid function
% headers).  Any scripts turned in will be given a 0 automatically.
%
%==========================================================================
% PROBLEM 1.  Underwater Vector Basketweaving 101
%--------------------------------------------------------------------------
%
% Function Name: interweave
% Inputs  (2): - (double) A 1xN vector of numbers
%              - (double) A 1xN vector of numbers
% Outputs (1): - (double) A vector of the two vectors mixed together
% 
% Function Description:
%   Write a function called "interweave" that takes in two vectors and then
%   outputs one larger vector where the odd indicies of the output vector
%   contain the values from the first vector and the even indices of the
%   output vector contain the values from the second vector. If one input
%   vector is longer than the other, the odd or even indices that wouldn't
%   have values should be filled with zeros.
%
% Notes:
%   - You may NOT use iteration to complete this problem. Any submission
%     containing a for-loop or a while-loop will receive 0 credit.
%
% Hints:
%   - The length of the final output vector should be twice the length of
%     the longer input vector.
%   - You may find the max() and zeros() function useful.
%
% Test Cases:
%   mixed1 = interweave([1 2 3 4 5],[6 7 8 9 10]);
%       mixed1 => [1 6 2 7 3 8 4 9 5 10]
%
%   mixed2 = interweave([5 1 5 9 1], [4 1 3]);
%       mixed2 => [5 4 1 1 5 3 9 0 1 0]
%
%   mixed3 = interweave([8 6 7], [5 3 0 9]);
%       mixed3 => [8 5 6 3 7 0 0 9]
%
%==========================================================================
% PROBLEM 2. Could I BE Wearing any more clothes?
%--------------------------------------------------------------------------
%
% Function Name: polarVortex
% Inputs  (1): - (double) array of temperature highs for a given month
% Outputs (1): - (double) the two days of the month between which the
% temperature drop was the greatest
%
% Function Description:
%
%   Good thing you only packed a single jacket for your Spring semester in
%   Georgia ...not. 
%
%   Now, fast forward 30 years: you have a child packing for their Spring 
%   semester at Georgia Tech and you say, "Now, pumpkin... one jacket? You
%   sure about that?" You will tell them about the time it hit negative
%   wind chills your first week back to school. They will roll their eyes
%   and not pack extra jackets. And you? Well, you will pull out this
%   homework problem!
%
%   Write a function that takes in an array of temperature highs and
%   outputs the two days between which the temperature dropped the most.
%   The input array will be formatted similarly to a calendar month. This
%   means there will be 4-6 rows and 7 columns (4-6 weeks displayed and 7 days
%   per week). Here is an example:
%
%   JanHighs =
%   [   NaN   NaN   NaN    49    52    35    37
%       51    51    25    47    49    49    64
%       59    58    58    52    46    43    44
%       48    58    50    42    46    46    49
%       51    55    53    49    48    48   NaN   ]
%
%   Here, NaN represents the previous month or following month. Since our
%   function does not care about temperature data from surrounding months,
%   this is represented with NaN.
%
%   We can see by looking here that the temperature drops to from 51
%   degrees Fahrenheit to 25 degrees fahrenheit between the 6th and 7th day
%   of the month. This is the greatest drop/decrease in temperature, so our
%   output would be [6 7].
%   
% Hints:
%   - You may want to use diff() or transpose()
%   - NaN is a bit of an oddity when it comes to logical statements, but
%   the following may help you:
%           NaN>=0 is false
%               AND 
%           NaN<0 is false as well.
%   
%
% Test Cases:
%   temps1 = [NaN NaN NaN 49 52 35 37
%               51 51 25 47 49 49 64 
%               59 58 58 52 46 43 44 
%               48 58 50 42 46 46 49
%               51 55 53 49 48 48 NaN]
% 
%   temps2 = [NaN NaN NaN NaN NaN NaN 85;
%               82 75 76 81 73 71 74;
%               76 74 73 81 83 82 75;
%               72 74 75 48 43 56 69;
%               73 75 81 83 77 73 74;
%               78 NaN NaN NaN NaN NaN NaN]
%
%   drop1 = polarVortex(temps1);
%       => [6 7]
%
%   drop2 = polarVortex(temps2);
%       => [18 19]
%
%==========================================================================
% PROBLEM 3.   To the gallows with ye!
%--------------------------------------------------------------------------
%
% Function Name: hangman
% Inputs  (2): - (char) a string representing a mystery word
%                (char) a char representing a guessed letter
% Outputs (1): - (char) a string representing a hangman board
%
% Function Description:
%   Let's play hangman! If you don't know how to play, here's how: 
%   
%   Player 1 starts by thinking of a word and creating a blank "board"
%   consisting of as many underscores as there are letters in the word.
%   Player 2 then guesses letters one at a time. If the guessed letter
%   appears in the mystery word, Player 1 replaces the corresponding
%   underscores with that letter. Player 2 continues to guess letters until
%   the word is completed or he/she is out of guesses.
%   
%   Write a function called "hangman" that simulates one guess in a game of
%   hangman by taking in the mystery word and a guessed letter and
%   outputting a board consisting of underscores and/or any occurences of
%   the guessed letter.
%
%   For example, if the mystery word is 'MATLAB' and the guessed letter is
%   'a', the output board should be '_A__A_'.
%
% Notes: 
%   - The letters of the mystery word can be uppercase or lowercase
%   - The guessed letter will always be lowercase
%   - Any letter in the output must be the same case as it is in the input
%   - This is a great opportunity to exploit logical indexing
%
% Test Cases:
%   board1 = hangman('HELLOworld', 'l');
%   board1 => '__LL____l_'
%
%   board2 = hangman('jazz', 'e');
%   board2 => '____'
%
%==========================================================================
% PROBLEM 4.  aLl MiXeD uP
%--------------------------------------------------------------------------
%
% Function Name: switchCase
% Inputs  (2): - (char) a string containg a word or phrase
%              - (char) a string determining how to modify the previous
%                 input
% Outputs (1): - (char) the modified string
%
% Function Description:
%   Write a function called "switchCase" that takes in a string containing
%   a word or phrase and another string containing directions, and outputs
%   the modified word or phrase based on the directions. There can be 4
%   different ways of modifying the string:
%
%           - 'Title Case' -> Capitalizes the first letter of every word.
%                             Everything else is lowercase. 
%           - 'Camel Case' -> Capitalizes the first letter of every word
%                             EXCEPT the first one. Everything else is
%                             lowercase. All the spaces are removed.
%           - 'Da Vinci'   -> Reverses the string.
%           - '1337'       -> Changes each of the following letters into 
%                             it's respective number replacement.
%                             '1' should replace 'l'
%                             '2' should replace 'z'
%                             '3' should replace 'e'
%                             '4' should replace 'a'
%                             '5' should replace 's'
%                             '6' should replace 'g'
%                             '7' should replace 't'
%                             '8' should replace 'b'
%                             '9' should replace 'j'
%                             '0' should replace 'o'
%                             Each of the replacements should work for
%                             capitalized letters as well.
%
%
% Test Cases:
%   new_string = switchCase('there AND back again', 'Title Case');
%       new_string => 'There And Back Again'
%
%   new_string = switchCase('What is better than UPPER or lower case?',...
%   'Camel Case');
%       new_string => 'whatIsBetterThanUpperOrLowerCase?'
%
%   new_string = switchCase('Hannah!', 'Da Vinci');
%       new string => '!hannaH'
%
%   new_string = switchCase('Now I can talk like a REAL hacker!', '1337');
%       new_string => 'N0w I c4n 741k 1ik3 4 R341 h4ck3r!'
%
%==========================================================================
% PROBLEM 5.   Don't Hang Me, Bro
%--------------------------------------------------------------------------
%
% Function Name: playHangman
% Inputs  (2): - (char) a string representing a mystery word
%                (char) a string representing guessed letters
% Outputs (3): - (char) a character array representing a list of successive
%                       hangman boards
%                (char) a string representing missed letters
%                (char) a string representing the outcome of the game
%
% Function Description:
%   You may have already created a MATLAB function that can simulate a
%   single guess in a game of hangman, but now it's time to turn it up a
%   notch . . . with ITERATION!
%   
%   A quick review of how to play:
%
%   Player 1 starts by thinking of a word and creating a blank "board"
%   consisting of as many underscores as there are letters in the word.
%   Player 2 then guesses letters one at a time. If the guessed letter
%   appears in the mystery word, Player 1 replaces the corresponding
%   underscores with that letter. Player 2 continues to guess letters until
%   the word is completed or he/she is out of guesses.
%   
%   Write a function called "playHangman" that simulates multiple guesses
%   in a game of hangman by taking in a mystery word and a string of
%   guessed letters and outputting a list of boards, a string of missed
%   letters, and the game's outcome. Each board in the list should consist
%   of underscores and/or any occurences of correctly guessed letters. Any 
%   guessed letters that do not appear in the word should be part of the
%   second output (missed letters). Our version of the game ends after 6
%   incorrect guesses (you have 6 "lives"), so if the word is completed
%   before 6 incorrect guesses have been made, the outcome should be 'You
%   win!'. If the number of incorrect guesses reaches 6, the number of
%   lives left reaches 0, and the outcome should be 'You lose!'. And if the
%   number of incorrect guesses does not reach 6, but the word is not
%   completed, the outcome should be 'You have <#> lives left.'. If the
%   number of lives left is 1, it should read 'You have 1 life left.' 
%
%   For example, if the mystery word is 'MatLab' and the string of guesses
%   is 'mobatwl', the outputs should be as follows:
%
%   boardList => ['M' '_' '_' '_' '_' '_'
%                 'M' '_' '_' '_' '_' '_'
%                 'M' '_' '_' '_' '_' 'b'
%                 'M' 'a' '_' '_' 'a' 'b'
%                 'M' 'a' 't' '_' 'a' 'b' 
%                 'M' 'a' 't' '_' 'a' 'b'
%                 'M' 'a' 't' 'L' 'a' 'b']
%
%   missed => 'ow'
%
%   outcome => 'You win!'
%
%   As another shorter example, if the inputs are 'CS' and 'abcdef', the
%   outputs should be as follows:
%
%   boardList => ['_' '_'
%                 '_' '_'
%                 'C' '_'
%                 'C' '_'
%                 'C' '_'
%                 'C' '_']
%
%   missed => 'abdef'
%
%   outcome => 'You have 1 life left.'
%
% Notes: 
%   - The letters of the mystery word can be uppercase or lowercase
%   - Guessed letters will always be lowercase
%   - Any letter in the list of boards must be the same case as it is in
%     the input
%   - No test case will have more guesses after the game ends (win or loss)
%   - No letter will be guessed more than once
%   - The outcome should be determined at the very end of the function
%   - The first output will be a char array with as many rows as guesses
%
% Test Cases:
%
%   [boardList1, missed1, outcome1] = playHangman('HelloWorld', 'byeworld');
%       boardList1 => ['_' '_' '_' '_' '_' '_' '_' '_' '_' '_'
%                      '_' '_' '_' '_' '_' '_' '_' '_' '_' '_'
%                      '_' 'e' '_' '_' '_' '_' '_' '_' '_' '_'
%                      '_' 'e' '_' '_' '_' 'W' '_' '_' '_' '_'
%                      '_' 'e' '_' '_' 'o' 'W' 'o' '_' '_' '_'
%                      '_' 'e' '_' '_' 'o' 'W' 'o' 'r' '_' '_'
%                      '_' 'e' 'l' 'l' 'o' 'W' 'o' 'r' 'l' '_'
%                      '_' 'e' 'l' 'l' 'o' 'W' 'o' 'r' 'l' 'd']
%       missed1 => 'by'
%       outcome1 => 'You have 4 lives left.'
%
%   [boardList2, missed2, outcome2] = playHangman('buzz', 'etaoin');
%       boardList2 => ['_' '_' '_' '_'
%                      '_' '_' '_' '_'
%                      '_' '_' '_' '_'
%                      '_' '_' '_' '_'
%                      '_' '_' '_' '_'
%                      '_' '_' '_' '_']
%       missed2 => 'etaoin'
%       outcome2 => 'You lose!'
%
%==========================================================================
% PROBLEM 6.  CS 1371's Greatest Word Game
%--------------------------------------------------------------------------
%
% Function Name: madLibs
% Inputs  (2): - (char) name of txt file with missing nouns, verbs, and 
%                       adjectives 
%              - (char) name of txt file with a list of nouns, verbs and
%                       adjectives
% 
% Function Description:
%   Write a function called "madLibs" where the first input is the name of 
%   a text file containing a story with the keys %n, %v, or %a, and the
%   second input is the name of a text file with a comma-delimited list
%   of nouns in the first line, verbs in the second line, and adjectives in
%   the third line.
%
%   Replace the keys in the first text file with their corresponding part 
%   of speech from the second text file, and write the result to a new file 
%   named the same as the original text file with the suffix '_fixed' added
%   before the '.txt' extension.
%
%   Use the words from the second txt file in the order they are listed.
% 
% Notes: 
%   - The second txt file is guaranteed to always have three lines only,
%     with the first, second, and third lines containing the nouns, verbs,
%     and adjectives respectively.
%   - Not all of the words are guaranteed to be used, but you are
%     guaranteed to have enough words to fill in the keys.
%
% Test Cases:
%
% madLibs('valentineMadlib.txt','wordlist1.txt')
%   -> should create a file 'valentineMadlib_fixed.txt' that looks like
%      'valentineMadlib_fixed_soln.txt'
%
% madLibs('snowpocalypseMadlib.txt','wordlist2.txt')
%   -> should create a file 'snowpocalypseMadlib_fixed.txt' that looks like
%      'snowpocalypseMadlib_fixed_soln.txt'
%
%==========================================================================
% PROBLEM 7.   Plug and Chug
%--------------------------------------------------------------------------
%
% Function Name: xlsFormula
% Inputs  (2): - (char) a string representing the name of a .xls file
%                (char) a string representing a formula to compute
% Outputs (0):
%
% Output files (1): - A .xls file that contains a new column of values
%                     computed from the formula
%
% Function Description:
%   One of the great things about Excel is how easy it is to manipulate
%   data using the formula feature. For example, typing '= A2 + B2' in the
%   cell C2 will insert the sum of the values contained in A2 and B2 into
%   C2. Then, clicking and dragging C2 down column C will populate the rest
%   of column C with the sums of the corresponding values in column A and 
%   column B (C3 will be '= A3 + B3', and so on). So in the tradition of CS
%   1371, you must accomplish this very same task using Matlab!
%   
%   Write a function called "xlsFormula" that populates a column of an
%   Excel spreadsheet using a given formula. The following provides a
%   simple example.
%
%   Input spreadsheet is called 'example.xls' and looks like:
%
%   Header A | Header B | Header C | Header D
%          1 |      1.1 |        0 |      2.5
%        3.9 |      4.4 |        0 |        6
%
%   The input formula will be formatted as <col3>=<col1><operator><col2>,
%   where col1, col2, and col3 are given as capital letters and the
%   operator can be '+', '-', '*', or '/'. In this example, let's have the
%   formula be 'C=A+D'.
%
%   Input formula: 'C=A+D'
%
%   Your job is to read the input file into Matlab, populate column C with
%   the values from column A added to the values from column D, and output
%   a new spreadsheet called 'example_new.xls'.
%
%   Output spreadsheet is called 'example_new.xls' and looks like:
%
%   Header A | Header B | Header C | Header D
%          1 |      1.1 |      3.5 |      2.5
%        3.9 |      4.4 |      9.9 |        6
%
% Notes: 
%   - The first row will always consist of header names
%   - The following rows will only contain numbers and none will be blank
%   - There will always be at least 2 columns and 2 rows
%   - You may find strtok(), switch statements, and num2cell() useful
%
% Test Cases:
%   xlsFormula('voltages.xls', 'D=C-B');
%     Output file should be named 'voltages_new.xls' and look like
%     'voltages_soln.xls'
%
%   xlsFormula('number.xls', 'B=A*A');
%     Output file should be named 'number_new.xls' and look like
%     'number_soln.xls'
%
%   xlsFormula('cabbages.xls', 'D=B/C');
%     Output file should be named 'cabbages_new.xls' and look like
%     'cabbages_soln.xls'
%
%==========================================================================
% PROBLEM 8.  What? Evee Is Evolving!
%--------------------------------------------------------------------------
%
% Function Name: evolvePokemon
% Inputs  (2): - (struct) A structure array containing various Pokemon's
%                names and their evolutions
%              - (char) A name of a Pokemon
% Outputs (1): - (cell or char) A cell array containing the names of the 
%                input Pokemon and its evolution line, OR the string
%                '<input name> is not a Pokemon.', with <input name> being 
%                replaced by the second input.
%
% Function Description:
%   Hello, there! Glad to meet you! Welcome to the world of Pokemon! My
%   name is Professor Oak! People affectionately refer to me as the Pokemon
%   Professor.
%
%   This world is inhabited far and wide by creatures called Pokemon. Some
%   Pokemon can evolve into new, stronger Pokemon. Why, my grandson Gary 
%   started with a Squirtle, which later on evolved into a Wartortle, and 
%   then a Blastoise. Others, like Ditto, do not evolve into any other
%   Pokemon, nor do other Pokemon evolve into it. Pokemon nature truly is
%   full of mysteries, and I have spent every day trying to unravel them.
%   To make a complete guide on all the Pokemon in the world...That is my
%   dream! 
%
%   Are you interested in helping me with my Pokemon research? Excellent! 
%   But first, I need to see if your programming skills are sufficient.
%   Write a function called "evolvePokemon" that takes in a structure array
%   as an input and returns a cell array of all subsequent evolutions of
%   that pokemon. Each structure from the input structure array, which
%   we'll call a Pokedex from now on, has two fields containing information
%   about a Pokemon. The first field, "Name", contains a Pokemon's name as
%   a string. The second field, "Evolution", contains the name of the
%   Pokemon that the Pokemon indicated in the Name field evolves into, also
%   represented as a string. If a Pokemon indicated in the Name field does
%   not evolve into another Pokemon, the value for the Evolution field of
%   that structure will be an empty string.
%
%   This is an example of some structures from the Pokedex:
%
%       Name: 'Squirtle'
%       Evolution: 'Wartortle'
%
%   This structure contains information about Squirtle. We can see from the 
%   second field that Squirtle evolves into Wartortle. Now let's look at 
%   another structure:
%
%       Name: 'Wartortle'
%       Evolution: 'Blastoise'
%   
%   This is Wartortle, the evolved form of Squirtle. Here, we can see that
%   Wartortle evolves into Blastoise. Now let's wrap this example up by
%   looking at one more structure:
%
%       Name: 'Blastoise'
%       Evolution: ''
%
%   This is Blastoise, the evolved form of Wartortle. Since the Evolution
%   field has an empty string as its value, we can infer that Blastoise 
%   does not evolve into another Pokemon. We can also say that Blastoise is 
%   the fully evolved form of Squirtle.  Therefore, if given 'Squirtle' as 
%   the Pokemon's name for the second input, assuming that the Pokedex 
%   includes those three structures mentioned above, your function should 
%   return {'Squirtle', 'Wartortle', 'Blastoise'}.
%   
%   Further, if the second input cannot be found in the Name field of any 
%   structure from the Pokedex, then your function should output 
%   '<input name> is not a Pokemon.' as a string (not a cell!), with 
%   <input name> being replaced by the actual second input (i.e. an input
%   of 'Shaggy' will return 'Shaggy is not a Pokemon.').
%
%   Now, get going, and don't forget to do your best!
%
% Notes:
%   - This problem should be solved using structure concepts. Do not write 
%     a loop that contains, as of now, 719 conditionals (or 720 if you 
%     count Missingno.).
%   - If a Pokemon listed in the Pokedex can evolve, the Pokedex is 
%     guaranteed to have all structure(s) pertaining to its evolution line.
%   - Structure(s) pertaining to a Pokemon's evolution(s) will not 
%     necessarily be located next to the structure pertaining to that
%     pre-evolved Pokemon in the Pokedex, nor will these Pokemon 
%     necessarily appear in the Pokedex in order from pre-evolved to fully 
%     evolved form.
%   - If an input Pokemon's name can be found in the Name fields of the 
%     Pokedex, but that Pokemon does not evolve into any other Pokemon, 
%     then the output should just be a single cell containing the input 
%     Pokemon's name.
%   - The Evolution field of a structure will never contain names of
%     multiple Pokemon.
%
% Test Cases:
pokedex = struct('Name', {'Charizard','Riolu','Chandelure',...
    'Aerodactyl','Lucario','Charmeleon','Murkrow','Lombre',...
    'Honchkrow','Litwick','Lotad','Skarmory','Lampent','Charmander',...
    'Ludicolo'}, 'Evolution', {'','Lucario','','','','Charizard',...
    'Honchkrow','Ludicolo','','Lampent','Lombre','','Chandelure',...
    'Charmeleon',''});
%
%     murkrow = evolvePokemon(pokedex, 'Murkrow')
%         murkrow => {'Murkrow', 'Honchkrow'}
%
%     charmander = evolvePokemon(pokedex, 'Charmander')
%         charmander => {'Charmander', 'Charmeleon', 'Charizard'}
%
%     aerodactyl = evolvePokemon(pokedex, 'Aerodactyl')
%         aerodactyl => {'Aerodactyl'}
%
%     alwaysBetterThanYou = evolvePokemon(pokedex, 'Gary Oak')
%         alwaysBetterThanYou => 'Gary Oak is not a Pokemon.'
%
%==========================================================================
% PROBLEM 9. Recursive cell diving.
%--------------------------------------------------------------------------
%
% Function Name: deepestCell
%
% Inputs  (1): - (cell) A 1xN cell array, where each index is guaranteed to
%                       contain a nested cell.
%
% Outputs (2): - (double) The deepest "depth" of cells in the input.
%              - (double) The index of the deepest cell array in the input.
%             
% 
% Function Description:
%   Write a function called deepestCell that takes in a 1xN cell array of
%   nested cell arrays, recursively finds the "depth" of each index, and
%   outputs the maximum depth and the index at which it occurs. For this,
%   the "depth" is the number of nested cells that exist at an index. For
%   example, consider the following cell array:
%
%       cA = { {{{'index1'}}} {{{{{'index2'}}}}} {{3}} };
%
%   Notice that each index of this cell array contains a 1x1 cell that
%   contains another 1x1 cell, etc. So every index of the cell array is a
%   nested cell. The "depth" is the number of cells that the final non-cell
%   data is within. So the corresponding depths of this cell array are [4 6
%   3]. (The "depth" includes the original input cell array as a depth of
%   1, and then you can see the first index has 3 more cells, which gives
%   the first index a depth of 4.) So for this cell array, your function
%   would output 6 as the deepest depth, and 2 for the index of that
%   deepest cell.
%
%
% Notes:
%   - Your function must use recursion. Submissions not using recursion
%     will receive 0 credit.
%
% Hints:
%   - Consider using a wrapper function, and writing the simplest recursive
%     code you can.
%
% Test Cases:
%   [depth1, ind1] = deepestCell({ {{{{4}}}} {{{{{5}}}}} {{{3}}} })
%       => depth1 = 6
%          ind1 = 2
%
%   [depth2, ind2] = deepestCell({ {{{{{{{{{{'hello'}}}}}}}}}} {'world'} })
%       => depth2 = 11
%          ind2 = 1
%
%==========================================================================
% PROBLEM 10.   There are two types of people: Those who can extrapolate
%--------------------------------------------------------------------------
%
% Function Name: compareExtrap
% Inputs  (3): - (double) a vector containing x values
%              - (double) a vector containing y values
%              - (double) a double, D, to specify the extrapolated domain
% Outputs (0):
% Plots   (1): - A plot comparing extrapolation methods
%
% Function Description:
%  Write a function "compareExtrap" that takes in x and y values and
%  plots an interp1, spline, and cubic polynomial to compare extrapolation
%  methods. To do so, plot the following on the same plot:
%   1) the original x and y values with blue stars ('b*')
%   2) extrapolation with 100 evenly spaced points from the minimum of the
%      original x values minus D to the maximum of the original x
%      values plus D, where D is an input. The following plots
%      should then be created:
%        a) interp1 -> plot with a green line
%        b) spline -> plot with a red line
%        c) third order fit -> plot with a black line
%
% Hints:
%  - the linspace() function will be useful in creating evenly spaced
%    points.
% Test Cases:
%  x1 = 1:10;
%  y1 = [6 5 9 3 7 8 4 6 1 0.5];
%  x2 = [-10.2 -7 -6.9 -2.5 1.3 5.2];
%  y2 = [4 14 8 -1.2 -6 4.21];
%  x3 = 11:20;
%  y3 = x3.^3 + 2.*x3.^2;
%
%  compareExtrap(x1,y1,1)
%   => should look like compareExtrap1.png
%
%  compareExtrap(x2,y2,1)
%   => should look like compareExtrap2.png
%
%  compareExtrap(x3,y3,5)
%   => should look like compareExtrap3.png
%
%==========================================================================
% FINISHED!!!!
%--------------------------------------------------------------------------
%
% Congratulations, you've finished this homework assignment.  Before you
% turn in your code be sure you have tested it throughly.  Once you've
% tested it you may submit it to T-square.  Be sure all files are submitted
% with the correct filenames.