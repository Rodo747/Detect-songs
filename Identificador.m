sampleHashTable=sampleHashTable1/1000;
sampleHashTable=round(sampleHashTable);
allRatios = [];
for currentSong=1:3
    fileName=['DataSong',num2str(currentSong),'.txt'];
    song=dlmread(fileName);
    song=song/1000;
    song=round(song);
    matches=[];
    for index=1:length(sampleHashTable)
        matches=[matches;find(song==sampleHashTable(index))-index];
    end
    m=mode(matches);
    numberOFMode=sum(matches(:)==m);
    ratio=numberOFMode/length(sampleHashTable);
    allRatios=[allRatios;ratio];
end
[v,i]=max(allRatios);