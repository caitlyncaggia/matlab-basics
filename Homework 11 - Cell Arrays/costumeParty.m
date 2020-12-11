function [bought, leftover] = costumeParty(items, budget)
    leftover = budget; %redefines budget as leftover
    bought = {}; %empty cell
    pricelist = []; %empty vector
    for i = 1:length(items) %runs for the number of items
        price = items{i,2}; %finds price of one item
        pricelist = [pricelist price]; %makes a list of items
    end    
       
    [cheapest, index] = min(pricelist); %finds minimum price and its index
    if leftover >= cheapest %if you have enough money to buy this item
        leftover = leftover - cheapest; %buy it
        lastbought = items{index, 1}; %finds the name of the cheapest item
        bought = [bought; lastbought]; %adds this item to list of bought items
        items(index,:) = []; %deletes cheapest item after purchase
    end
    
    if leftover >= cheapest %if you could buy the item
        [newbought, leftover] = costumeParty(items, leftover); %runs the function again recursively
        bought = [bought; newbought]; %adds bought from recursion to main list of bought
    end
    
end



