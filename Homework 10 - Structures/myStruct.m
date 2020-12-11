function out = myStruct(in)
%this function creates a structure from a cell away the same way the
%built in struct() function does.

fieldnames = in(1:2:end); %finds field names in given cell array at odd indicies
numfields = length(fieldnames); %counts the number of fields
contents = in(2:2:end); %finds contents of each field in the given cell array at even indicies

for i = 1:numfields %loop runs for however many fields there are
    fieldName = fieldnames{i}; %extracts the field name
    values = contents{i}; %extracts appropriate values for that field
    for j = 1:length(values) %loop runs for as many values are in the cell for that field
        out(j).(fieldName) = values{j}; %adds these values to the appropriate field 
    end
end

end