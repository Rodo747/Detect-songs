for currentSong1=1:1 
    filename1=['SecuenciaMuestra',num2str(currentSong1),'.txt']
    allDB=dlmread(filename1);
    plotDB1=allDB(1:end,40:200);
    keyPoints1=[];
    for index=1:size(plotDB1,1)
       currentSubPos1=1;
       for subIndex1=1:4
           [v,i]=max(plotDB1(index,currentSubPos1:currentSubPos1+39));
           keyPoints1(index,subIndex1)=i+40*(subIndex1-1);
           currentSubPos1=currentSubPos1+40;
       end
    end
    sampleHashTable1=[];
    for index=1:size(keyPoints1,1)
    hash=4;
        for subIndex1=1:4
            hash=17*hash+keyPoints1(index,subIndex1);
        end
        sampleHashTable1(index,1)=hash;
    end 
    saveFileName1=['DataMuestra',num2str(currentSong1),'.txt']
    dlmwrite(saveFileName1,sampleHashTable1);
end
        