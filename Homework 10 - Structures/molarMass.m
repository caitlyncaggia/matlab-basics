function [mass] = molarMass(formula, table)
%This function calculates the molar mass of a particular compound using a
%given table of values.

elements = strsplit(formula, ','); %breaks up the formula into its elements
cellarray = struct2cell(table); %converts the table given into a cell array
masslist = [cellarray{4,:}]; %extracts the values for mass from the cell array, stores as a vector
mass = 0; %mass starts as 0
for i = 1:length(elements) %loop runs for as many elements exist
    num = 1; %defaults num to 1
    if length(elements{i}) == 1 %if the element is only the symbol
        name = elements{i}(1); %name is just the first item of elements at i, num stays 1
    elseif elements{i}(2) < 'a' | elements{i}(2) > 'z' %if the second character of the element isn't a letter
        name = elements{i}(1); %the symbol is one letter long, and is just the first index of element
        if length(elements{i}) > 1 %if there are characters after the symbol
            num = str2num(elements{i}(2:end)); %num is the double value of the remaining chars
        end
    else %otherwise...
        name = elements{i}(1:2); %the symbol of the element is two letters long
        if length(elements{i}) > 2 %if characters exist after the symbol
            num = str2num(elements{i}(3:end)); %these chars are converted into a double value
        end
    end
    findel = strcmp(name, {table.Symbol}); %finds the location of the element in the table
    findmass = masslist(findel); %finds the mass of the element in the vector
    mass = mass + findmass*num; %adds that elements mass multiplied by the given coefficient and adds to total mass
end

end