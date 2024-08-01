for currentSong1=1:1 
    filename1=['Prueba',num2str(currentSong1),'.m4a']
    [sig1,Fs]=audioread(filename1);
    monoSig1=(sig1(:,1)+sig1(:,2))/2;
    interval1=2205;
    extraSpace1=mod(length(monoSig1),interval1);
    monoSig1=[monoSig1;zeros(interval1-extraSpace1,1)];
    currentPos1=1;
    allDB1=[];
    for index=1:length(monoSig1)/interval1
        tempSig1=monoSig1(currentPos1:currentPos1+interval1-1);
        Y=fft(tempSig1,interval1);
        magY1=abs(Y);
        magY1=magY1(1:ceil(interval1/2));
        allDB1=[allDB1;reshape(magY1,[1,length(magY1)])];
        currentPos1=currentPos1+interval1;
    end
    saveFileName1=['SecuenciaMuestra',num2str(currentSong1),'.txt']
    dlmwrite(saveFileName1,allDB1);
end
        