function [score] = scrabble (yourword, letterPoints)
%first I wanted to make sure that the word was in all lowercase letters to
%make my math a little simpler.
word = lower(yourword);

%I then wanted to find where the #s were located in the word by using the
%strfind function.
doubleletterSignal = strfind(word, '#');
%the letters whose points were to be doubled were at indicies one less than
%where the #s were.
doubleletterIndex = doubleletterSignal-1;
%I needed to convert the ascii values of each doubled letter to its
%position in the alphabet. This was the difference in ascii values between
%the given letter and a, plus one (If the doubled letter was a, a-a would
%be zero, but it'd be the first index in the points vector).
doubleletterVectorLocations = (word(doubleletterIndex) - 'a') + 1;
%the points for one doubled letter was twice the value of its position in
%the points vector for it's index. the total double letter points was the sum of
%all these double letter values.
doubleletterPoints = sum(2 .* letterPoints(doubleletterVectorLocations));

%then I wanted to calculate the base score of the word, disregarding the
%double letter and double word points. First I removed all the # characters
%from the word.
removePound = strfind(word, '#');
word(removePound) = [];
%Then I removed all the ! characters from the word.
removeExclam = strfind(word, '!');
word(removeExclam) = [];
%I called my modified word without !s and #s my "cleanWord".
cleanWord = word;
%Then I found what position in the alphabet each of my letters was using
%the same process as above when I calculated double letter points.
vectorLocations = cleanWord - 'a' + 1;
%the whole word was worth the sum of each of its letters' points.
noBonusPoints = sum(sum(letterPoints(vectorLocations)));
%since my double letter process above already counted the base score of my
%doubled letters, I wanted to make sure I didn't count these points again.
%I subtracted the normal point value of the letters that were doubled from
%the normal total value of the word. aka, I took the value of all the
%letters minus the regular value of the doubled letters.
basePoints = noBonusPoints - sum(letterPoints(doubleletterVectorLocations));

%I used subscore to represent the number of points a word was worth before
%it was doubled.
subscore = basePoints + doubleletterPoints

%I wanted with my original word in all lower case again to find out how 
%many times I wanted to double the subscore.
freshWord = lower(yourword);
%then I wanted to find the places in the word where there were "!"s using
%the built in function strfind.
doublewordSignal = strfind(freshWord, '!');
%this would output a vector with the indicies !s were located at. The
%length of this vector would be the number of !s in the word.
numExclam = length(doublewordSignal);
%the number of times the word was doubled depended on the number of
%exlamation points (numExclam). But if numExclam was zero, the final score
%would be equal to just the subscore. Thus I multiplied subsocre times 2 to
%the power of numExclam. If numExclam was zero, the expression 2^numExclam
%would be 1, and the final score would be equal to just subscore.
score = 2^(numExclam) .* subscore

end

