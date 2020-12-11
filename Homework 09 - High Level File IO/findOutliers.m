function findOutliers(filename)
[name, rest] = strtok(filename, '.');
outputname = [name 'Outliers.xls'];

[num, ~, ~] = xlsread(filename);
setsfull = [num(:,1)];
sets = [];
counter = 1;
for i = 1:length(setsfull)
    if all(sets ~= setsfull(counter)) == true
       sets = [sets setsfull(counter)]; 
    end
    counter = counter+1;
end

unsorted = [num(1:end, 1)];
[~, index] = sort(unsorted);
num(1:end, :) = num(index, :);
sorted = num;

counterfor = 1;
data = [];
for i = 1:length(sets)
    counterwhile = 1;
    while sorted(counterwhile, 1) == sets(counterfor)
        datapoint = sorted(counterwhile, 1);
        data = [data datapoint];
    end
    data = [data '+'];
    counterfor = counterfor+1;
end


%xlswrite(outputname, array);
end