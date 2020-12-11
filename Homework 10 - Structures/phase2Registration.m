function [new] = phase2Registration(current,change,registrar)
%This function assists the phase 2 registration process by dropping courses
%with a specific CRN and looking up and adding courses with specific CRNs.

add = change{2,1}; %finds what courses to add
drop = change{2,2}; %finds what courses to drop

for i = 1:length(drop) %loop runs for as many courses that need to be dropped
    myCRNS = [current.CRN]; %finds what my current schedule's CRNs are
    current(myCRNS==drop(i)) = []; %where the drop CRN matches my CRN, delete the course
end
new = current; %sets new array to current less the dropped courses

for i = 1:length(add) %loop runs for as many courses that need to be added
    registrarCRNS = [registrar.CRN]; %makes a list of CRNs available in registrar
    findcourse = registrarCRNS==add(i); %finds where the add CRN matches the registrar
    addme = registrar(findcourse); %extracts course info where CRN matched
    new = [new addme]; %adds this course to my new schedule
end

end