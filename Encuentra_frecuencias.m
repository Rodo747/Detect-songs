for currentSong=1:3 
    filename=['SequencedSong',num2str(currentSong),'.txt']
    allDB=dlmread(filename);
    plotDB=allDB(1:end,40:200);
    keyPoints=[];
    for index=1:size(plotDB,1)
       currentSubPos=1;
       for subIndex=1:4
           [v,i]=max(plotDB(index,currentSubPos:currentSubPos+39));
           keyPoints(index,subIndex)=i+40*(subIndex-1);
           currentSubPos=currentSubPos+40;
       end
    end
    hashTable=[];
    for index=1:size(keyPoints,1)
    hash=4;
        for subIndex=1:4
            hash=17*hash+keyPoints(index,subIndex);
        end
        hashTable(index,1)=hash;
    end 
    saveFileName=['DataSong',num2str(currentSong),'.txt']
    dlmwrite(saveFileName,hashTable);
end
        