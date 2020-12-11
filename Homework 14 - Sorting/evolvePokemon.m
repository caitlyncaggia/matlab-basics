function [out] = evolvePokemon(pokedex, pokemon)

namelist = {pokedex.Name};
evolutionlist = {pokedex.Evolution};
out = {pokemon};

match = false;
keepgoing = true;
while keepgoing
    for i = 1:length(namelist)
        if strcmp(pokemon, namelist{i})
            match = true;
            break
        end
    end

    if match == false
        out = [pokemon ' is not a Pokemon.'];
        evolved = '';
    else
        evolved = evolutionlist{i};
        out = [out evolved];
    end

    ematch = false;
    for j = 1:length(namelist)
        if strcmp(evolved, namelist{j})
            ematch = true;
            break
        end
    end

    if ematch == true
        keepgoing = true;
        pokemon = evolved;
    else
        keepgoing = false;
    end

end

end