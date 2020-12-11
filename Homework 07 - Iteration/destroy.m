function [destroyed] = destroy(hitlist)
destroyed = [];
num = 1;
for i = 1:length(hitlist)
    counter = hitlist(1:num);
    countones = sum(counter==1);
    counttwos = sum(counter==2);
    countthrees = sum(counter==3);
    countfours = sum(counter==4);
    if countones == 2 & all(destroyed ~= 1) == true
        destroyed = [destroyed 1];
    end
    if counttwos == 3 & all(destroyed ~= 2) == true
        destroyed = [destroyed 2];
    end
    if countthrees == 4 & all(destroyed ~= 3) == true
        destroyed = [destroyed 3];
    end
    if countfours == 6 & all(destroyed ~= 4) == true
        destroyed = [destroyed 4];
    end
    num = num+1;
end
winDestroy = destroyed;
end