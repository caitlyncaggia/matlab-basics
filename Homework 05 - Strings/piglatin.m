function [translation] = piglatin(input)
%this function converted two given words into pig latin and inserted them
%into a statement.
string = lower(input);
%first I made sure that the entire given input was lowercase (to make
%finding vowels simpler).
[firstWord, rest] = strtok(string, ' ');
%I used the built-in function strtok to find the first word, using space as
%the delimiter as that's where the first word ended.
secondWord = rest(2:end);
%the second word was the "rest" after strtok, but the first character was a
%space, which I didn't want. To keep only the letters, I saved the second
%word as rest from the second index to the end.

vowels = ['a' 'e' 'i' 'o' 'u'];
%I defined vowels and used them as my delimiter again in strtok.
[upToVowel1, rest1] = strtok(firstWord, vowels);
%this split the first word where the first vowel was.
translate1 = rest1;
translate2 = upToVowel1;
%I then relabeled my output to make my final step easier.
[upToVowel2, rest2] = strtok(secondWord, vowels);
translate3 = rest2;
translate4 = upToVowel2;
%I repeated the same process for the second word.

translation = sprintf('My most favorite thing in the world is %s-%say, but I hate %s-%say!', ...
    translate1, translate2, translate3, translate4);
%I used the sprintf function to produce my final output. the %s's indicate
%that the variable was a string. so "%s-%say" would put
%"translate1-translate2ay" and so on. This took care of putting the correct
%part of the word in the correct place and adding the "ay" to the end. 
end
