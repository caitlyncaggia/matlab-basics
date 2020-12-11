function [newString] = textStretch(phrase, word, letter, factor)
%This function adds a specific number of letters to a given word in a given
%phrase, which mimicks modern slang.
wordStart = strfind(phrase, word);
%I used the given function strfind to find where the first letter of the
%given word was located in the string.
phraseFromWordOn = phrase(wordStart:end);
[token, rest] = strtok(phraseFromWordOn, ' ');
%to find where the word ended, I went from the start of the word within the
%phrase to the end of the phrase, but used the strtok function to only take
%up to the first space (ie, where the next word started) to isolate just
%the word in the phrase.

letterLocation = strfind(word, letter);
%I used a similar concept to find where the letter was within the word.
empty = ones(1, factor-1);
% I then inserted several ones as a placeholder for the letters to be
% added. I used the factor-1 as I was going to include the original letter
% that was being duplicated.
ascii = double(letter);
%I then found the ascii value of the given letter I needed to add.
add = empty .* ascii;
%I used this ascii value and multiplied it by my matrix of ones. When I
%convert this (add) back into characters, it will be a string of my given
%letters that's length is one less than the given factor.
lengthenedWord = [token(1:letterLocation) char(add) token(letterLocation+1:end)];
%Then I concatenated the first part of my word up to (and including) the repeated letter,
%added my extra letters, and added the rest of the word on after that.

oldWordLength = length(word);
oldWordEnd = wordStart + oldWordLength;
%I then needed to find where the old word ended in the phrase so I knew
%where to add the rest of the phrase on after my lengthened word. I added
%the length of the vector to the original first index of the given word.
newString = [phrase(1:wordStart-1) lengthenedWord phrase(oldWordEnd:end)];
%Using a similar process to before, I concatenated the lengthened word back
%into the given phrase. I went from the phrase just up to the start of the
%word, added the new word, and then added the remaining part of the phrase.
end
