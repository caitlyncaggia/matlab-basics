function [filteredAverage, fixThis] = voltageFilter (voltage1, voltage2, voltage3)
mask1 = voltage1 == voltage2 & voltage2 == voltage3;
% mask 1 will tell me when the voltages are all the same (if voltage1 =
% voltage2 and voltge2 = voltage3, voltage1 also equals voltage3 so they're
% all equal.

voltage1(voltage1 < 1) = 0;
voltage2(voltage2 < 1) = 0;
voltage3(voltage3 < 1) = 0;
%Where voltage1 was less than 1, I replaced the values of voltage1 with
%zeros. This covered the random noise criteria. I repeated this for
%voltage2 and voltage3.

avg1 = mean(mean(voltage1));
spike1 = voltage1 > 3.*avg1;
%avg1 was the average of the first voltage array. Since it's an array, I
%needed to take the mean of the mean to get a single value (just taking the
%mean once would give me a vector). spikes in voltage1 occured if
%voltage was greater than three times the average. I saved this mask as
%spike1 so I could refer to it later.
voltage1(spike1) = 0;
%where voltage1 had spikes, I set each spike to 0. Then I repeated this
%process for voltage2 and voltage3.
avg2 = mean(mean(voltage2));
spike2 = voltage2 > 3.*avg2;
voltage2(spike2) = 0;
avg3 = mean(mean(voltage3));
spike3 = voltage3 > 3.*avg3;
voltage3(spike3) = 0;

voltageAverage1 = (voltage1 + voltage2 + voltage3) ./ 3;
voltageAverage2 = (voltage1 + voltage2 + voltage3) ./ 3;
%voltageAverage1 and voltageAverage2 were exactly the same, but I wanted to
%be able tomanipulate the average (to find the overall average voltage)
%and still have the original average (to replace 0's caused by spikes later).
%I added each of the voltage vectors together and divided that quantity by 3
%to find both averages.
mask2 = voltageAverage2 == 0;
%to find the overall average voltage, I needed to exclude zeros. So mask2
%finds where the average contains zeros...
voltageAverage2(mask2) = [];
%...and then I deleted the zeros out of voltageAverage2.
avgValue = mean(mean(voltageAverage2));
%now the average value found the average voltage excluding zeros using the
%mean function.

voltageAverage1(spike1) = avgValue;
voltageAverage1(spike2) = avgValue;
voltageAverage1(spike3) = avgValue;
%Then I used the average array that included zeros(voltageAverage1) and 
%replaced the indicies with spikes with the overall average voltage.
voltageAverage1(mask1) = avgValue;
%I also replaced the defective sensor values that were the same in each
%vector with the overall average voltage.
filteredAverage = voltageAverage1;
%this gave me my first output.

a = size(voltage1);
empty = zeros(a(1), a(2));
%I created an empty array of zero's that was the same size as each of the
%given vectors (which were all the same size). 
empty(mask1) = 2;
%where the sensors were defective was represented by mask 1, so all values
%of empty where mask 1 was true were set to 2.
empty(spike1) = 1;
empty(spike2) = 1;
empty(spike3) = 1;
%where spikes occured in any of the three arrays, values needed to be 1.
fixThis = empty;
%all the other values remained 0, so this was my second output.

end
