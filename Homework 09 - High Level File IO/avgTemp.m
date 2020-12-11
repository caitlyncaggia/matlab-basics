function [avgHigh, avgLow] = avgTemp(historic)
%This function found the average high and low temperatures from a given
%list of temperatures.

mask = strcmp('High', historic(:,1)); %finds what rows correspond with highs
hightemps = historic(mask,2); %pulls out the temperatures associated with highs
hightemps = [hightemps{:,1}]; %converts the high temps from cells to a vector of doubles
lowtemps = historic(~mask, 2); %pulls out temperatures associated with lows
lowtemps = [lowtemps{:,1}]; %converts low temps from cells to a vector of doubles
numHigh = sum(mask); %finds out how many high temps there are
[row,col] = size(historic); %finds how many total rows there are
numLow = row - numHigh; %rows that aren't highs are lows; counts number of lows
avgHigh = round(sum(hightemps)/numHigh); %finds the average high, rounds this average
avgLow = round(sum(lowtemps)/numLow); %finds the average low, rounds this number
end