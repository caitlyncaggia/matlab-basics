function [coded] = caesarWrapCase(string, yourshift)
string = 'Thank you Mario!'
yourshift = 4

shift = mod(yourshift-52,52)
%this covers when yourshift is negative and when its greater than 52

stringVec = double(string)
lowercaseLetters = 97<=stringVec & stringVec<=122
uppercaseLetters = 65<=stringVec & stringVec<=90
letters = uppercaseLetters | lowercaseLetters
lettersOnly = stringVec(letters==1)

ndx = 1:length(lettersOnly)
letter = lettersOnly(ndx)
lastLower = 122-shift
lastUpper = 90-shift
if 97<=letter(ndx) & letter(ndx)<=lastLower
    lettersOnly(ndx) = lettersOnly+shift
elseif 65<=letter(ndx) & letter(ndx)<=lastUpper
    lettersOnly(ndx) = lettersOnly+shift
elseif letter(ndx)>lastLower & letter(ndx)< 122
    change = 122-lastLower
    lettersOnly(ndx) = lettersOnly + 65 + change
elseif letter(ndx)>lastUpper & letter(ndx)< 90
    change = 90-lastUpper
    lettersOnly(ndx) = lettersOnly + 97 + change
else
    error('nah');
end

coded = char(lettersOnly);
    
end