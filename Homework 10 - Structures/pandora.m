function [next] = pandora(now, possible)

%You will only need to compare data in the fields for Genre, Key,
%       Vocals, DrivingInstrument:
%       - Genre: treat this as either a 100%, 50%, or a 0% match. 100%
%       match if both songs have the same genre. 50% match if the
%       NowPlaying song's genre is contained in the other song's related
%       genre. 0% match for anything else (this includes the other song's
%       genre being contained in the NowPlaying song's related genres).
%       - Key: 100% match if the songs have the same key, and 0% key if
%       not. Remember 'Major' and 'Minor' are the only options here.
%       - Vocals: 100% match is the songs have the same gender vocalist. 0%
%       match if not.
%       - DrivingInstrument: similar to Genre, so can either be 100%, 50%,
%       or 0% match. 100% match if songs have the same driving instrument,
%       50% match if NowPlaying's driving instrument is contained in the
%       other song's related instruments.
matchvalues = [];

for i = 1:length(possible)
    
    %Genre
    currentgenre = struct2cell(now.Genre);
    desiredgenre = struct2cell(possible(i).Genre);
    if strcmp(currentgenre{1}, desiredgenre{1})
        genrematch = 100;
    elseif length(desiredgenre{2}) >= 1 & strcmp(currentgenre{1}, desiredgenre{2}(1))
        genrematch = 50;
    elseif length(desiredgenre{2}) >= 2 & strcmp(currentgenre{1}, desiredgenre{2}(2))
        genrematch = 50;
    else
        genrematch = 0;
    end
    
    %Key
    currentkey = now.Key;
    desiredkey = possible(i).Key;
    if strcmp(currentkey,{desiredkey})
        keymatch = 100;
    else
        keymatch = 0;
    end
    
    %Vocalist
    currentvocals = now.Vocals;
    desiredvocals = possible(i).Vocals;
    if strcmp(currentvocals, {desiredvocals})
        vocalsmatch = 100;
    else
        vocalsmatch = 0;
    end
    
    %Driving Instrument
    currentinst = struct2cell(now.DrivingInstrument);
    desiredinst = struct2cell(possible(i).DrivingInstrument);
    if strcmp(currentinst(1), desiredinst{1})
        instmatch = 100;
    elseif length(desiredinst{2}) >= 1 & strcmp(currentinst{1}, desiredinst{2}(1))
        instmatch = 50;
    elseif length(desiredinst{2}) >= 2 & strcmp(currentinst{1}, desiredinst{2}(2))
        instmatch = 50;
    else
        instmatch = 0;
    end
    
%       40%: Genre similarity
%       10%: Key similarity
%       20%: Vocal similarity
%       30%: DrivingInstrument similarity

    match = genrematch*0.4 + keymatch*0.1 + vocalsmatch*0.2 + instmatch*0.3;
    matchvalues = [matchvalues match];
end

[~, index] = min(matchvalues);
nextsonginfo = possible(index);
next = getfield(nextsonginfo, 'Title');


end