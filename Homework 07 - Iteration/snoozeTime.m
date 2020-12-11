function [numsnooze] = snoozeTime(bedtime, alarm, snoozeLength, firstClass)
%This function found the number of times you could snooze and still be to
%your first class on time consdiering the time you went to bed, the length
%of your snooze, your initial alarm time, and the time of the first class.

%first I separated bedtime given into hours
%and minutes. Then I converted each time into the number of minutes from
%midnight since I didn't want to deal with converting hours and minutes all
%the time.
[bedtimeHour, bedtimeMin] = strtok(bedtime, ':');
bedtimeMin(1) = [];
bedtimeHour = str2num(bedtimeHour);
bedtimeMin = str2num(bedtimeMin);
newBedtime = bedtimeHour*60 + bedtimeMin;

%I repeated this for alarm time
[alarmHour, alarmMin] = strtok(alarm, ':');
alarmMin(1) = [];
alarmHour = str2num(alarmHour);
alarmMin = str2num(alarmMin);
newAlarm = alarmHour*60 + alarmMin;

%and again for class time
[firstClassHour, firstClassMin] = strtok(firstClass, ':');
firstClassMin(1) = [];
firstClassHour = str2num(firstClassHour);
firstClassMin = str2num(firstClassMin);
newFirstClass = firstClassHour*60 + firstClassMin;

%I needed to wake up 20 minutes before my first class.
wakeuptime = newFirstClass - 20;

addSnooze = newAlarm; %I set my first addSnooze time to my initial alarm time (that'd be snooze
%time with no snoozes)
if newAlarm <= newBedtime + 8*60 %when I was getting less than 8 hours of sleep...
    numsnooze = 0; %I started with no snoozes
    while wakeuptime >= addSnooze + snoozeLength %I kept adding snoozes as long as I didn't pass wake up time
            addSnooze = addSnooze + snoozeLength; %my amount of time asleep added one snooze for every time the loop ran
            numsnooze = numsnooze+1; %I increased the counter of snoozes by 1
    end
else %If I was getting more than 8 hours of sleep, I never snoozed.
    numsnooze=0;
end
end