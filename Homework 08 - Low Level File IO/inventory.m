function [totalcost] = inventory(data, prices)
%This function found the total cost of restocking a store and logged the
%inventory of the items already in the store.

[businessName, rest] = strtok(data, '_');
filename = [businessName '_restockingData.txt'];
fh = fopen(filename, 'w');
fclose(fh);
%finds the name of the business to name the output file correctly and
%creates a blank output file

fhd = fopen(data, 'r');
fhr = fopen(filename, 'a');
listname = fgetl(fhd); %title of file
blankline = fgetl(fhd); %blank line
line = fgetl(fhd); %first line of stock
fprintf(fhr, '%s\n%s\n%s\n', listname, blankline, line); %sets up the top of the file
itemnamelist = [];
fullstocklist = [];
numtobuylist = [];
while ischar(line)
    [item, rest] = strtok(line, '#'); %separates the item from the inventory numbers
    itemnamelist = [itemnamelist ' ' item]; %keeps track of the names of items needed
    [whatsleft, fullstock] = strtok(rest, '#'); %separates inventory numbers into how many remain in the store
                                                 %and how many are desired
    fullstock(1) = []; %removes the # symbol from fullstock
    fullstocklist = [fullstocklist str2num(fullstock)]; %keeps track of the number of each item needed for full inventory
    numtobuy = str2num(fullstock) - str2num(whatsleft); %finds the difference between the full inventory and how many are in the store
    numtobuylist = [numtobuylist numtobuy]; %keeps track of how many of each item is needed
    line = fgetl(fhd); %gets the next line
    fprintf(fhr, '%s\n', line); %copies each line of the initial data text file into the new output file
end
fclose(fhd);
fclose(fhr);
%closes both files

fh = fopen(filename, 'a');
fprintf(fh, '\nRestocking Data:\n\n');
%sets up the second half of the output file
num = 1; %counter starts at 1
rest = itemnamelist;
for i = 1:length(numtobuylist)-1 %length is numtobuylist-1 since the last line doesn't need an additional next line character
    [item, rest] = strtok(rest, ' '); %separates the name from the rest of the item name list
    fullstock = fullstocklist(num); %finds the appropriate number of full inventory for that item
    numtobuy = numtobuylist(num); %finds how many of that item you need to buy
    fprintf(fh, '%s #%d #%d\n', item, fullstock, numtobuy); %prints these values into the output text file
    num = num+1; %increases the counter by 1
end
[item, rest] = strtok(rest, ' ');
fullstock = fullstocklist(num);
numtobuy = numtobuylist(num);
fprintf(fh, '%s #%d #%d', item, fullstock, numtobuy);
%one extra repetition of the loop for the last item; the only difference is
%no end of line character is printed at the end
fclose(fh);
%closes the file

fh = fopen(prices);
title = fgetl(fh); %title line
line = fgetl(fh); %blank line
line = fgetl(fh); %first line of prices
num = 1; %counter starts at 1
totalcost = 0; %total cost starts at 0
for i = 1:length(numtobuylist)
    [item, price] = strtok(line, '$'); %separates item and price for 1 item
    price(1) = []; %deletes the $ symbol off price
    howmany = numtobuylist(num); %finds out how many of this item you need to buy
    priceforitem = str2num(price) .* howmany; %multiplies price of that item by quanitity desired
    totalcost = totalcost + priceforitem; %adds the price to fully restock this item to total cost
    line = fgetl(fh); %gets the next line
    num = num + 1; %counter increases by 1
end

end