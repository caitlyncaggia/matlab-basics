function receipt2sheet(filename)
%This function calculates the unit price of each item on a text file representing a
%receipt. The unit price is outputted into an excel spreadsheet containing
%the item, quantity bought, unit price, and total price.

[name, rest] = strtok(filename, '.'); %finds what the receipt was for
outputname = [name 'Sheet.xls']; %names the output file correctly

fh = fopen(filename, 'r'); %opens the receipt text file
line = fgetl(fh); %gets the first line
itemlist = {}; %creates empty cells...
quantitylist = {};
totalpricelist = {};
unitpricelist = {};
while ischar(line) %loop runs while the line is data type character
    cell = strsplit(line, ' - '); %splits the string into three cells
    item = cell{1}; %the contents of the first cell is the item name
    itemlist = [itemlist {item}]; %keeps a list of items
    quantity = cell{2}; %the contents of the second cell is the quantity
    quantitylist = [quantitylist {quantity}]; %keeps a list of quantities
    totalprice = cell{3}; %the contents of the third cell is the total price
    totalprice(1) = []; %deletes the $ of the total price
    
    num = 1; %counter starts at 1
    todelete = []; %empty vector
    for i = 1:length(totalprice) %runs for the length of total price
        if totalprice(num) >= '0' & totalprice(num) <= '9' | totalprice(num) == '.'
            delete = false; %only keeps numbers and decimal points
        else
            delete = true;
        end
        todelete = [todelete delete]; %keeps a list of what to delete
        num = num+1; %increases counter by 1
    end
    
    totalprice(todelete==true) = []; %deletes characters that aren't numbers or decimal points
    
    totalprice = str2num(totalprice); %converts total price into a double value
    totalpricestr = sprintf('%.2f', totalprice); %outputs total price to two decimal points as a string
    totalpricelist = [totalpricelist {totalpricestr}]; %keeps track of total price as a string
    
    [num, units] = strtok(quantity, ' '); %separates number and units of quantity
    num = str2num(num); %converts num to a double value
    unitprice = totalprice / num; %divides total price by number purchased to find unit price
    unitpricestr = sprintf('%.2f', unitprice); %outputs unit price as a string to 2 decimal place
    unitpricelist = [unitpricelist {unitpricestr}]; %keeps a list of unit prices 
    
    line = fgetl(fh); %gets the next line
end
fclose(fh); %closes the file

rows = length(itemlist) + 1; %finds how many rows the excel file will have
array = {}; %creates a blank cell array
array(1,1) = {'Item'}; %creates headers...
array(1,2) = {'Quantity'};
array(1,3) = {'Unit Price'};
array(1,4) = {'Total Price'};

array(2:rows, 1) = itemlist(1:end); %makes first column item names
array(2:rows, 2) = quantitylist(1:end); %makes second column quantities
array(2:rows, 3) = unitpricelist(1:end); %makes thir column unit price
array(2:rows, 4) = totalpricelist(1:end); %makes fourth column total price

xlswrite(outputname, array); %writes array to an excel file
end