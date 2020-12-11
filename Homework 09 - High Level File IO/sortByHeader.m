function [sorted] = sortByHeader(filename, header)
%This function sorts data given by an excel file alphabetically or
%numerically by the data from a column with the given header.

[num, text, raw] = xlsread(filename); %opens file
[row, col] = size(raw); %finds number of rows and columns
num = 1; %starts counter at 1
for i = 1:col %loop only runs for as many columns as there are
    if strcmp(raw{1, num}, header) %if the name of the column matches the given header
        break %the loop ends
    else
        num = num+1; %otherwise the counter increases by 1
    end
end

if ischar(raw{2,num}) %if the data in the matched column is text
    pickcol = [raw(2:end, num)]; %then the data to be sorted is a cell array
elseif isnumeric(raw{2,num}) %if the data in the matched columns is numeric
    pickcol = [raw{2:end, num}]; %then the data to be sorted are doubles
end
[~, index] = sort(pickcol); %finds indicies when sorted alphabetically/numerically
raw(2:end, :) = raw(index+1, :); %resorts the data by the new indicies
sorted = raw;  %this is the final output, as a cell array
    
end