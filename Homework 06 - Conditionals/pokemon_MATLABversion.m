function [result, finalStats] = pokemon_MATLABversion(stats, type, revives)

load('gymStats.mat');
myBaseAttack = stats(1);
myBaseDefense = stats(2);
%the first number in the stats vector was my initial attack stat; the second line
%in the vector was my initial defense stat.

% Gym 1: Rock Type Gym==============================================
%      Strong types: Water, Grass, Fighting, Ground (2x multiplier)
%      Weak types: Flying, Bug, Fire, Ice (0.5x multiplier)
if strcmp(type,'Water') == true | strcmp(type,'Grass') == true | ...
        strcmp(type,'Fight') == true | strcmp(type,'Ground') == true
    battleAttack1 = 2 * myBaseAttack;
    %if my pokemon was any of the gym's strong types, my attack doubled for the
    %duration of the battle.
elseif strcmp(type,'Flying') == true | strcmp(type,'Bug') == true | ...
        strcmp(type,'Fire') == true | strcmp(type,'Ice') == true
    battleAttack1 = 0.5 * myBaseAttack;
    %conversely if my pokemon was any of the gym's weak types, my attack
    %was halved for the duration of the battle.
else
    battleAttack1 = myBaseAttack;
    %otherwise my attack didn't change during the battle.
end

%Gym 1 Battle
if stats1(2) < battleAttack1
    gym1 = true;
    %if my pokemon had a higher battle attack than the first opponent's
    %defense, I won the first battle.
elseif stats1(2) * .8 < battleAttack1 & revives>0
    gym1 = true;
    %or, if I had at least 1 revive and my battle attack was greater than
    %80% of the first opponent's defense, I won the first battle.
    revives = revives-1;
    %however this would cost me a revive, so I'd have one less revive.
else
    gym1 = false;
    %otherwise, I lost to this gym leader.
end

%Experience after battle 1
if gym1 == true
    attack2 = myBaseAttack + 0.2*stats1(1);
    defense2 = myBaseDefense + 0.2*stats1(2);
    %if I won, my stats increased by 20 percent of the gym leader's stats.
    %these would be my new stats for the second battle.
elseif gym1 == false
    result = ['You defeated 0 gyms, and have ' num2str(revives) ' revives remaining. ' ...
        'Keep training and you will challenge the Elite 4 one day.'];
    finalStats = [myBaseAttack, myBaseDefense];
    return
    %if I lost the first battle, I defeated no gyms and gained no
    %experience points toward my stats. "return" shows that I fought no
    %more battles.
end

%I used this exact same process gym 2...

%       Gym 2: Water Type ================================================
%           Strong types: Grass, Electric (2x multiplier)
%             Weak Types: Ground, Rock, Fire (0.5x multiplier)
if strcmp(type,'Grass') == true | strcmp(type,'Electric') == true  
    battleAttack2 = 2 * attack2;
elseif strcmp(type,'Ground') == true | strcmp(type,'Rock') == true | ...
        strcmp(type,'Fire') == true 
    battleAttack2 = 0.5 * attack2;
else
    battleAttack2 = attack2;
end

%Gym 2 Battle
if stats2(2) < battleAttack2
    gym2 = true;
elseif stats2(2) * .8 < battleAttack2 & revives>0
    gym2 = true;
    revives = revives-1;
else
    gym2 = false;
end

%Experience after battle 2
if gym2 == true
    attack3 = attack2 + 0.2*stats2(1);
    defense3 = defense2 + 0.2*stats2(2);
elseif gym2 == false
    result = ['You defeated 1 gyms, and have ' num2str(revives) ' revives remaining. ' ...
        'Keep training and you will challenge the Elite 4 one day.'];
    finalStats = [attack2, defense2];
    return
    %if I lost to this gym leader, I defeated only one gym and only gained
    %experience points from my first battle. 
end

%all the other gyms were coded the exact same way. Any notable exceptions
%also have commenting, otherwise the process was the exact same as
%before.

%       Gym 3: Electric Type===========================================
%           Strong types: --
%             Weak types: Flying, Water (0.5x multiplier)
%           Immune types: Ground (A Ground pokemon should always beat this gym)
if strcmp(type,'Flying') == true | strcmp(type,'Water') == true
    battleAttack3 = 0.5 * attack3;
    if stats3(2) < battleAttack3
        gym3 = true;
    elseif stats3(2) * .8 < battleAttack3 & revives>0
        gym3 = true;
        revives = revives-1;
    else
        gym3 = false;
    end
elseif strcmp(type, 'Ground') == true
    gym3 = true;
    %if my pokemon was the ground type, I automatically won this battle.
else
    if stats3(2) < attack3
        gym3 = true;
    elseif stats3(2) * .8 < attack3 & revives>0
        gym3 = true;
        revives = revives-1;
    else
        gym3 = false;
    end
end

%Experience after battle 3
if gym3 == true
    attack4 = attack3 + 0.2*stats3(1);
    defense4 = defense3 + 0.2*stats3(2);
elseif gym3 == false
    result = ['You defeated 2 gyms, and have ' num2str(revives) ' revives remaining. ' ...
        'Keep training and you will challenge the Elite 4 one day.'];
    finalStats = [attack3, defense3];
    return
end

%       Gym 4: Grass Type================================================
%           Strong types: Flying, Poison, Bug, Fire, Ice (2x multiplier)
%             Weak types: Ground, Rock, Water (0.5x multiplier)
if strcmp(type,'Flying') == true | strcmp(type,'Poison') == true | ...
        strcmp(type, 'Bug') == true | strcmp(type, 'Fire') == true | ...
        strcmp(type, 'Ice') == true
    battleAttack4 = 2 * attack4;
elseif strcmp(type,'Ground') == true | strcmp(type,'Rock') == true | ...
        strcmp(type,'Water') == true 
    battleAttack4 = 0.5 * attack4;
else
    battleAttack4 = attack4;
end

%Gym 4 Battle
if stats4(2) < battleAttack4
    gym4 = true;
elseif stats4(2) * .8 < battleAttack4 & revives>0
    gym4 = true;
    revives = revives-1;
else
    gym4 = false;
end

%Experience after battle 4
if gym4 == true
    attack5 = attack4 + 0.2*stats4(1);
    defense5 = defense4 + 0.2*stats4(2);
elseif gym4 == false
    result = ['You defeated 3 gyms, and have ' num2str(revives) ' revives remaining. ' ...
        'Keep training and you will challenge the Elite 4 one day.'];
    finalStats = [attack4, defense4];
    return
end

%       Gym 5: Poison Type=================================================
%           Strong types: Ground, Psychic (2x multiplier)
%             Weak types: Grass (0.5x multiplier)
%           Immune types: Steel (A Steel pokemon should always beat this gym)
if strcmp(type,'Ground') == true | strcmp(type,'Psychic') == true 
    battleAttack5 = 2 * attack5;
    if stats5(2) < battleAttack5
        gym5 = true;
    elseif stats5(2) * .8 < battleAttack5 & revives>0
        gym5 = true;
        revives = revives-1;
    else
        gym5 = false;
    end
elseif strcmp(type,'Grass') == true
    battleAttack5 = 0.5 * attack5;
    if stats5(2) < battleAttack5
        gym5 = true;
    elseif stats5(2) * .8 < battleAttack5 & revives>0
        gym5 = true;
        revives = revives-1;
    else
        gym5 = false;
    end
elseif strcmp(type, 'Steel') == true
    gym5 = true;
    %if my pokemon was the steel type, I automatically won this battle.
else
    if stats5(2) < attack5
        gym5 = true;
    elseif stats5(2) * .8 < attack5 & revives>0
        gym5 = true;
        revives = revives-1;
    else
        gym5 = false;
    end
end

%Experience after battle 5
if gym5 == true
    attack6 = attack5 + 0.2*stats5(1);
    defense6 = defense5 + 0.2*stats5(2);
elseif gym5 == false
    result = ['You defeated 4 gyms, and have ' num2str(revives) ' revives remaining. ' ...
        'Keep training and you will challenge the Elite 4 one day.'];
    finalStats = [attack5, defense5];
    return
end

%       Gym 6: Psychic Type =========================================
%           Strong types: Bug, Ghost (2x multiplier)
%             Weak types: Fight, Poison (0.5x multiplier)
%           Immune types: Dark (A Dark pokemon should always beat this gym)
if strcmp(type,'Bug') == true | strcmp(type,'Ghost') == true 
    battleAttack6 = 2 * attack6;
    if stats6(2) < battleAttack6
        gym6 = true;
    elseif stats6(2) * .8 < battleAttack6 & revives>0
        gym6 = true;
        revives = revives-1;
    else
        gym6 = false;
    end
elseif strcmp(type,'Fight') == true | strcmp(type,'Poison') == true
    battleAttack6 = 0.5 * attack6;
    if stats6(2) < battleAttack6
        gym6 = true;
    elseif stats6(2) * .8 < battleAttack6 & revives>0
        gym6 = true;
        revives = revives-1;
    else
        gym6 = false;
    end
elseif strcmp(type, 'Dark') == true
    gym6 = true;
    %if my pokemon was a dark type, I automatically won this battle.
else
    if stats6(2) < attack6
        gym6 = true;
    elseif stats6(2) * .8 < attack6 & revives>0
        gym6 = true;
        revives = revives-1;
    else
        gym6 = false;
    end
end

%Experience after battle 6
if gym6 == true
    attack7 = attack6 + 0.2*stats6(1);
    defense7 = defense6 + 0.2*stats6(2);
elseif gym6 == false
    result = ['You defeated 5 gyms, and have ' num2str(revives) ' revives remaining. ' ...
        'Keep training and you will challenge the Elite 4 one day.'];
    finalStats = [attack6, defense6];
    return
end

%       Gym 7: Fire Type===============================================
%           Strong types: Ground, Rock, Water (2x multiplier)
%             Weak types: Bug, Steel, Grass, Ice (0.5x multiplier)
if strcmp(type,'Ground') == true | strcmp(type,'Rock') == true | ...
        strcmp(type, 'Water') == true 
    battleAttack7 = 2 * attack7;
elseif strcmp(type,'Bug') == true | strcmp(type,'Steel') == true | ...
        strcmp(type,'Grass') == true | strcmp(type,'Ice') == true
    battleAttack7 = 0.5 * attack7;
else
    battleAttack7 = attack7;
end

%Gym 7 Battle
if stats7(2) < battleAttack7
    gym7 = true;
elseif stats7(2) * .8 < battleAttack7 & revives>0
    gym7 = true;
    revives = revives-1;
else
    gym7 = false;
end

%Experience after battle 7
if gym7 == true
    attack8 = attack7 + 0.2*stats7(1);
    defense8 = defense7 + 0.2*stats7(2);
elseif gym7 == false
    result = ['You defeated 6 gyms, and have ' num2str(revives) ' revives remaining. ' ...
        'Keep training and you will challenge the Elite 4 one day.'];
    finalStats = [attack7, defense7];
    return
end

%       Gym 8: Ground Type ===========================================
%           Strong types: Water, Grass, Ice (2x multiplier)
%             Weak types: Poison, Rock, Steel, Fire (0.5x multiplier)
%           Immune types: Flying (A Flying pokemon should always beat this gym)
%      Ineffective types: Electric (An Electric pokemon should always lose this gym battle)
if strcmp(type,'Water') == true | strcmp(type,'Grass') == true | strcmp(type,'Ice') == true 
    battleAttack8 = 2 * attack8;
    if stats8(2) < battleAttack8
        gym8 = true;
    elseif stats8(2) * .8 < battleAttack8 & revives>0
        gym8 = true;
        revives = revives-1;
    else
        gym8 = false;
    end
elseif strcmp(type,'Poison') == true | strcmp(type,'Rock') == true | ...
        strcmp(type,'Steel') == true | strcmp(type,'Fire') == true
    battleAttack8 = 0.5 * attack8;
    if stats8(2) < battleAttack8
        gym8 = true;
    elseif stats6(2) * .8 < battleAttack8 & revives>0
        gym8 = true;
        revives = revives-1;
    else
        gym8 = false;
    end
elseif strcmp(type, 'Flying') == true
    gym8 = true
    %if my pokemon was a flying type, I automatically won thsi battle 
    %regardless of stats.
elseif strcmp(type, 'Electric') == true
    gym8 = false
    %if my pokemon was an electric type, I automatically lost this battle
    %regardless of stats.
else
    if stats8(2) < attack8
        gym8 = true;
    elseif stats8(2) * .8 < attack8 & revives>0
        gym8 = true;
        revives = revives-1;
    else
        gym8 = false;
    end
end

%Experience after battle 8
if gym8 == true
    attack9 = attack8 + 0.2*stats8(1);
    defense9 = defense8 + 0.2*stats8(2);
    result = ['You defeated 8 gyms, and have ' num2str(revives) ' revives remaining. You may now challenge the Elite 4.'];
    finalStats = [attack9, defense9];
    %if I beat all 8 gyms, I could go on to challenge the Elite 4 and
    %gained experience points from all 8 battles.
elseif gym8 == false
    result = ['You defeated 7 gyms, and have ' num2str(revives) ' revives remaining. ' ...
        'Keep training and you will challenge the Elite 4 one day.'];
    finalStats = [attack8, defense8];
    %if I lost to the last gym, I only defeated 7 gyms and gained the experience
    %points from 7 gyms. 
end
end