function [candy] = sumFib(houses)
    if houses == 1 %if you only go to one house
        candy = 1; %you have one piece of candy
    elseif houses == 2
        candy = 2; %the second house also gives one piece of candy
    else
        vec = fibSequence(houses); %uses helper function
        if length(vec) == 1 %if the vector is only one number
            candy = vec(1); %amount of candy is the value of that number
        else %otherwise
            candy = vec(end) + sumFib(houses-1); 
            %the candy from the latest house is added to the candy from prior houses
        end
    end
end

function [vec] = fibSequence(num) %helper function
    if num == 1 %if there is just one number
        vec = [1]; %the vector contains just the number one 
    elseif num == 2 %if there are 2 numbers
        vec = [1 1]; %the vector contains two ones
    elseif num > 2 %after the first two entries...
        vec = [1 1]; %which are both ones...
        for i = 1:num-2 %(from the third entry on)
            last = vec(end); %finds the last entry of the vector
            secondlast = vec(end-1); %finds second-to-last entry
            next = last+secondlast; %adds these two together to find the next entry
            vec = [vec next]; %adds the next entry to the vector
        end
    end
end