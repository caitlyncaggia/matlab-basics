function [position, velocity, accel] = topGearAnalyst(v, t)
%This function finds position, velocity, and acceleration from a given
%function of velocity and at a known time.

%integrating v at time t will find position
position = 0; %starts at position 0
l = length(v); 
for i = 1:l %loop runs for as many coefficients there are in v
    addpos = (v(i)/(l))*t^l; %integrates i'th term
    position = position + addpos; %adds this to total position
    l = l - 1; %reduces l by one
end

%using the given coefficients at time t will find velocity
velocity = 0; %starts at velocity 0
l = length(v); %resets l to the length of the vector
for i = 1:l %loop runs for as many coefficents there are in v
    addvel = v(i)*t^(l-1); %finds value of i'th term
    velocity = velocity + addvel; %adds value to velocity
    l = l - 1; %reduces l by one
end

%differentiating v at time t will find acceleration
accel = 0; %acceleration starts at 0
l = length(v); %resets l
for i = 1:l-1 %loop runs for one less than the length of v since
            %the constant term's coefficient, last index of v, is disregarded
    addaccel = (v(i)*(l-1))*t^(l-2); %finds derivative of i'th term
    accel = accel + addaccel; %adds this to acceleration
    l = l - 1; %reduces l by one
end

end