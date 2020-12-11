function [newSentence] = abbreviatingCamelCase(sentenceIn)
%This function turns a string of words into "camel case" and removes the
%vowels that aren't the first letter of a word.

allLower = lower(sentenceIn);
%I made all the characters lowercase to avoid cases where "I" or other
%capital letters would be. I only wanted the first letters of certain words
%capitalized.
spaces = find(allLower == ' ');
%then I found where the spaces of my all lowercase string was.
caps = spaces+1;
%I wanted capital letters where the first letter of every word was (except
%the first word). From the second word on, the first letter of any word
%will be preceeded by a space. 
allLower(caps) = allLower(caps) + ('A' - 'a');
%to change the case, I added the difference between capital and lowercase
%letters in ascii value to the mask of capital letter indicies.
sentenceInCaps = allLower;
%this gave me a new sentence with the correct letters capitalized.

exceptFirstLetter = sentenceInCaps(2:end);
%the first letter would always be lowercase. If it was a vowel, I didn't
%want to delete it, so I excluded it in my search for vowels to delete. Any
%other vowels at the beginning of words would already be capitalized, so I
%didn't worry about deleting capital letters-I wanted to keep those.
a = find(exceptFirstLetter == 'a');
e = find(exceptFirstLetter == 'e');
i = find(exceptFirstLetter == 'i');
o = find(exceptFirstLetter == 'o');
u = find(exceptFirstLetter == 'u');
vowels = [a e i o u];
exceptFirstLetter(vowels) = [];
%I deleted all the vowels I didn't want and tacked the first letter back
%on by concatenation. Even if the first letter was a consonant, this method 
%would work as I don't want the first letter deleted or capitalized 
%regardless of what it was.
noVowels = [sentenceInCaps(1) exceptFirstLetter];

spaces = noVowels == ' ';
%The last thing I needed to do was delete spaces. Where noVowels had a ' '
%character, I deleted it.
noVowels(spaces) = [];
newSentence = noVowels;
%this gave me my final output.
end