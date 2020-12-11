function [validity] = isValidDate(date)
[month, rest1] = strtok(date, ' ');
%first I found the month, which was the first word, using strtok and ' ' as
%my delimiter
rest1(1) = [];
%I deleted the space, which was the first character in the remaining string
[day, rest2] = strtok(rest1, ',');
%then I found the characters up to the comma, which was the date
findDecimalDay = day~='.';
%if the year was given as a decimal, it would contain a '.' 
noDecimalDay = sum(findDecimalDay) == length(day);
%so as long as the string (where the string wasn't a '.' had as many
%characters as the length of the string, the day wasn't a decimal.
day = str2num(day);
%I'd always want to treat day as a number, not a string, so I used str2num
%to reclassify day
rest2(1:2) = [];
%then I deleted the comma and space at the beginning of the remaining
%characters
year = rest2;
%the year was the remaining string less the comma and space
year = str2num(year);
%just like day, I'd always want to treat year as a number not a string
findDecimalYear = year~='.';
%if the year was given as a decimal, it would contain a '.' 
noDecimalYear = sum(findDecimalYear) == length(year);
%so as long as the string (where the string wasn't a '.' had as many
%characters as the length of the string, the year wasn't a decimal.
if year > 0 & noDecimalYear == true & noDecimalDay == true
    %if the year was an integer greater than zero and the day was an
    %integer...
    if strcmp(month, 'January') == true & day >= 1 & day <= 31
        %and if the month was 'January', and the day fell between 1 and 31,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'March') == true & day >= 1 & day <= 31
        %and if the month was 'March', and the day fell between 1 and 31,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'May') == true & day >= 1 & day <= 31
        %and if the month was 'May', and the day fell between 1 and 31,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'July') == true & day >= 1 & day <= 31
        %and if the month was 'July', and the day fell between 1 and 31,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'August') == true & day >= 1 & day <= 31
        %and if the month was 'August', and the day fell between 1 and 31,
        %validity was true.
        validity = true;
    elseif  strcmp(month, 'October') == true & day >= 1 & day <= 31
        %and if the month was 'October', and the day fell between 1 and 31,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'December') == true & day >= 1 & day <= 31
        %and if the month was 'December', and the day fell between 1 and 31,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'September') == true & day >= 1 & day <= 30
        %and if the month was 'September', and the day fell between 1 and 30,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'April') == true & day >= 1 & day <= 30
        %and if the month was 'April', and the day fell between 1 and 30,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'June') == true & day >= 1 & day <= 30
        %and if the month was 'June', and the day fell between 1 and 30,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'November') == true & day >= 1 & day <= 30
        %and if the month was 'November', and the day fell between 1 and 30,
        %validity was true.
        validity = true;
    elseif strcmp(month, 'February') == true
        if mod(year, 400) == 0 & day>=1 & day <=29
            %if the month was February and the year was a leap year
            %according to the first given rule and the day was between 1
            %and 29, validity was true.
            validity = true;
        elseif mod(year, 4) == 0 & mod(year, 100) ~= 0 & day>=1 & day <= 29
            %if the month was February and the year was a leap year
            %according to the second given rule and the day was between 1
            %and 29, validity was true.
            validity = true;
        elseif day>=1 && day<=28
            %if the month was February and the year was a positive integer
            %but not a leap year, and the day was between 1 and 28, the
            %validity was true.
            validity = true;
        else
            %if the month was February and the year was a positive integer
            %but not a leap year, and the day fell outside the range 1 to
            %28, the validity was false.
            validity = false;
        end
   %If none of the criteria for month were met, validity was false.
    else
        validity = false;
    end
 %if the year was less than 1 or the day wasn't an integer or the year
 %wasn't an integer, the validity was false.
else
    validity = false;
end
end