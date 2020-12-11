function [report] = smarterThan5thGrader(questions, contestant, kids)
%This function simulates the show "Are you smarter than a 5th grader?" and
%outputs a report with the contestant's information and game statistics.

winnings = 0; %winnings start at 0
listvalue = [questions.Value]; %creates a vector of winnings per question
listcorrect = {questions.Answer}; %creates a cell array of correct answers
listguess = contestant.Answers; %creates a cell array of contestant's guesses
listkidsguess = {kids.Answer}; %creates a cell array of kids' guesses
listkidsnames = {kids.Name}; %creates a cell array of kids'names
askkidscount = 0; %starts with asking 0 kids
kidsused = {}; %starts with no kids names
forgive = true; %defaults to no incorrect answers from kids
lastquestion = true; %defaults to allowing progression to the last question

for i=1:10 %loop runs for the first ten questions
    if strcmp(listcorrect{i}, listguess{i}) %if the contestant's answer is correct
        winnings = winnings + listvalue(i); %the value for that question is added to winnings
    elseif strcmp('Ask a 5th Grader', listguess{i}) %if they call on help for a fifth grader
        if askkidscount < 2 %and they've asked for help less than two times so far
            if strcmp(listcorrect{i}, listkidsguess{i}) %and the kid answers correctly,
                winnings = winnings + listvalue(i); %value for that question is added to winnings.
            else %if the kid answers incorrectly,
                if forgive == true %and no other kids have answered incorrectly,
                    winnings = winnings + listvalue(i); %value for that question is added to winnings.
                    forgive = false; %no forgiveness next time a kid answers correctly.
                else %if both kids answered incorrectly,
                    lastquestion=false; %the contestant will not proceed to the final question
                    break %the loop ends.
                end
            end
            askkidscount = askkidscount + 1; %the number of kids asked increases by 1
            kidsused = [kidsused listkidsnames(i)]; %kid's name is added to list
        else %if the contestant tries asking for help after asking twice already
            lastquestion = false; %the contestant will not proceed to the final question
            break %the loop ends.
        end
    else %if the contestant answers incorrectly
        lastquestion = false; %the contestant will not proceed to the final question.
        i = i - 1; %the number of questions answered is one less than the number of times the loop ran.
        break %the loop ends.
    end
end

%if the contestant answered all 10 questions and answers the last question
%correctly
if lastquestion == true & strcmp(listcorrect{11}, listguess{11})
    winnings = winnings + listvalue(11); %winnings for the final question are added to total winnings
    i = i + 1; %number of questions answered increases by 1
end

%sets up the output information in the correct field/order
report.Name = contestant.Name;
report.Gender = contestant.Gender;
report.Education = contestant.Education;
report.NumberQuestionsAnswered = i;
report.Winnings = winnings;
report.FifthGradersUsed = kidsused;

end