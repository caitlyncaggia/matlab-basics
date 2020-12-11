function [accepted] = GTadmissions (scoreVector, topDog, legacy)

GPA = scoreVector(1);
SAT = scoreVector(2);
ACT = scoreVector(3);
%first I broke the vector down into the appropriate scores they
%represented, as given in the problem.

accepted = (GPA >= 3.85 & SAT >= 2000 & ACT >= 29) | (GPA >= 3.85 & SAT >= 2000 & legacy(true)) | (legacy(true) & SAT >= 2000 & ACT >= 29) | (legacy(true) & ACT >= 29 & GPA >= 3.85) | topDog(true);
%then used the score breakdowns... the students were accepted if their GPA &
%SAT & ACT scores were greater than the standards given OR (|) the students 
%were accepted if they were first or second in their class--aka, topDog(true)
%was in fact true. If legacy was true, aka legacy(true) was actually true, then
%the student only had to meet two of the score requirements: GPA & SAT & legacy,
%SAT & ACT & legacy, OR ACT & GPA & legacy. If any one of these cases had
%every requirement met, the student was admitted.

end

%scoreVector = A 1x3 vector of an applicant's GPA, SAT score, and ACT score
%topDog = True/false: whether or not the applicant was
%          either a valedictorian or salutatorian
%legacy = True/false: whether of not the applicant has family at GT