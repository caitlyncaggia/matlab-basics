function unsubscribe(emails, remove)
%This function removed a given list of emails from another list of emails
%and sent the names associated with the removed emails an unsubscribed
%notification message.
listname = emails(1:end-4);
updated = [listname '_updated.txt'];
listname(end:-1:end-12) = [];
messages = ['Unsubscribe from ' listname '_messages.txt'];
%this named the outputted files

fhe = fopen(emails, 'r');
line = fgetl(fhe); %gets the first email off the given list
line = lower(line); %makes this email all lowercase
for i = 1:length(line)
    if line(end) < 'a' | line(end) > 'z' %makes sure the last character is a lowercase letter
        line(end) = []; %if it's not, it's deleted
    end
end
fh = fopen('cleanemails.txt', 'w');
fprintf(fh, '%s\n', line);
fclose(fh);
%this pulled the first email off the given list, reformatted it (removed
%extraneous characters and made it all lowercase) and put it in a new text
%file.

fh = fopen('cleanemails.txt', 'a');
while ischar(line)
    line=fgetl(fhe); %gets a new line
    if length(line) > 1
        line = lower(line); %makes the line all lowercase
        for i = 1:length(line)
            if line(end) < 'a' | line(end) > 'z' %if the character wasn't a lowercase letter...
                line(end) = []; %delete that character
            end
        end
        fprintf(fh, '%s\n', line); %outputs the cleaned email into a new file
    end
end
fclose(fhe);
fclose(fh);
%this pulled each email off the given email list and formatted them so that
%they were all lowercase and removed extraneous characters. The "clean"
%emails were added into the same new file as the first.

fhd = fopen('deletereformat.txt', 'w');
fclose(fhd);
%this created a new file for reformatting the emails to be deleted.
fhr = fopen(remove, 'r');
fhd = fopen('deletereformat.txt', 'a');
line = fgets(fhr);
email = [];
countremoved = 1;
while ischar(line)
    if ischar(line)
        line = lower(line); %converts the line to all lowercase
        [firstname, lastname] = strtok(line, ' '); %separates first and last name
        firstletter = firstname(1); %finds the first letter
        lastname(1) = []; %deletes the space at the front of last name
        for i = 1:length(lastname)
            if lastname(end) < 'a' | lastname(end) > 'z'
                lastname(end) = [];
            end
        end 
        %removes any extraneous characters at the end of the last name
        email = [firstletter lastname]; %creates the email profile
        fprintf(fhd, '%s, %s\n', email, firstname); %makes a list of emails to be removed
                                                    %and their corresponding first name
        countremoved = countremoved + 1; %keeps track of how many emails will be removed
    end
    line = fgets(fhr); %gets the next email off the list
end
fclose(fhr);
fclose(fhd); %closes both files


%magically delete emails on unsubscribe list from the mailing list
    %compare the first email on the list to all of the removed emails
    %if it dosn't match any of the removed emails, keep that email
    %move on to the next email in the clean list
fh = fopen(updated, 'w'); %makes a new file for the updated list
fclose(fh);
    
fhc = fopen('cleanemails.txt', 'r');
fh = fopen(updated, 'a');
linec = fgetl(fhc); %first email on clean list
deletelist = []; %empty vector
deletenamelist = []; %another empty vector
%deletename = '';
while ischar(linec)
    %checks the first clean email against list of emails to remove
    fhd = fopen('deletereformat.txt', 'r'); %opens clean list of emails to remove
    liner = fgetl(fhd); %first email and name to remove
    [removeemail, name] = strtok(liner, ','); %separates email and name
    for i = 1:countremoved
        if isempty(strfind(linec, removeemail)) %if the clean email didn't match any email to be removed, it stayed on the list
            delete = false;
        else
            delete = true; %otherwise, the clean email was to be removed and the name associated with this clean email would reviece an unsubscribed message
            deletename = [name ','];
        end
        deletelist = [deletelist delete]; %keeps track of any matches the clean email has with removed emails
        liner = fgetl(fhd); %gets the next email to remove
        [removeemail, name] = strtok(liner, ','); %separates the email and name to remove
    end
    fclose(fhd); %closes the removed file so the list starts at the top when the next clean email is checked
    if sum(deletelist) < 1 %if none of the removed emails matched the clean email, deletelist would be all false's
        fprintf(fh, '%s\n', linec); %this clean email was added to the updated list
    end
    deletelist = []; %clears the deletelist
    deletenamelist = [deletenamelist deletename]; %keeps track of the order of names to be sent unsubscribe messages
    deletename = ' '; %clears deletename
    linec = fgetl(fhc);%get the next clean email   
end
fclose(fhc);
fclose(fh); %closes both files


fhm = fopen(messages, 'w');
rest = deletenamelist;
while length(rest) > 1 %as long as rest wasn't just a space
    [name, rest] = strtok(rest, ','); %separates one name off the list
    name(name==' ') = []; %deletes any extraneous spaces
    if length(name) > 0
        name(1) = name(1) + ('A' - 'a'); %capitalizes first letter
        fprintf(fhm, ['%s, you have been unsubscribed from the ' listname ' mailing list. \n'], name);
        %outputs name in to a set message which is saved as an output text
    end
end
fclose(fhm); %closes the file
end