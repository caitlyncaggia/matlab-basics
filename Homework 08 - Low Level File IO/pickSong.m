function [song] = pickSong (tracklist, time)
%This function looked through a list of songs to find the song with the
%length closest to the given time left.

%convert the given time into a double value of seconds
[minleft, secleft] = strtok(time, ':'); %separates minutes and seconds
minleft = str2num(minleft) * 60; %converts minutes to time in seconds
secleft(1) = []; %deltes the colon from secleft
timeleft = minleft + str2num(secleft); %finds total time left in seconds

%open the file that contained the listing of tracks with read permission
fh = fopen(tracklist, 'r');
line = fgetl(fh);
%set difference as an empty vector
difference = [];
%creates a loop that pulls out each line of the text and looks at the time
%at the end of each line
while ischar(line)
    line = fgetl(fh);
    if ischar(line) %the last line won't pass this conditional
        songlengthstrflip = line(end:-1:end-4); %finds the time, but reverses the order of the numbers
        songlengthstr = songlengthstrflip(end:-1:1); %puts numbers back in the right order
        [minutes, seconds] = strtok(songlengthstr, ':'); %separates minutes from seconds
        minutes = str2num(minutes) * 60; %converts minutes into a number of seconds
        seconds(1) = []; %deletes the colon off the seconds string
        songlength = minutes + str2num(seconds); %finds length of song in seconds
        diff = abs(timeleft - songlength); %finds the difference between desired time and length of that song
        difference = [difference diff]; %adds the difference to a vector
    end
end
fclose(fh);
%closes the track listing file

%finds where the difference between desired length and song length is
%smallest
[mindiff, tracknum] = min(difference);

%finds where this song is in the list of songs
fh = fopen(tracklist, 'r');
line = fgetl(fh);
for i = 1:tracknum
    pickline = fgets(fh);
end

pickline(end:-1:end-8) = []; %deletes the time off the end of the song listing
[listing, songtitle] = strtok(pickline, '.'); %separates the number from the song title
songtitle(1:2) = []; %removes the period and space
song = songtitle;

fclose(fh); %closes the song list
end