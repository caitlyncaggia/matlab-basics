function dragonrend(namein)
name = namein(1:end-4); %removes the .png extension from the filename
nameout = [name '_dragonrended.png']; %makes new filename
im = imread(namein); %opens image file
r = im(:,:,1); %finds red layer
g = im(:,:,2); %finds green layer
b = im(:,:,3); %finds blue layer
dragon = (r==200 & g == 200 & b == 200); %finds the indicies of the dragon
skyred = im(2, 2, 1); %finds the red component of the sky
skygreen = im(2, 2, 2); %finds the green component of the sky
skyblue = im(2, 2, 3); %finds the blue component of the sky
r(dragon) = skyred; %makes the red layer of the dragon indicies match the sky
g(dragon) = skygreen; %makes the green layer of the dragon indicies match the sky
b(dragon) = skyblue; %makes the blue layer of the dragon indicies match the sky
newim = uint8(cat(3, r, g, b)); %concatenates new layers into an image
imwrite(newim, nameout); %writes the new image
end