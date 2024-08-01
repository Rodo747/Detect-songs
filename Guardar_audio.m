
for currentSong=1:3 
    filename=['Song',num2str(currentSong),'.m4a']
    [sig,Fs]=audioread(filename);
    monoSig=(sig(:,1)+sig(:,2))/2;
    interval=2205;
    extraSpace=mod(length(monoSig),interval);
    monoSig=[monoSig;zeros(interval-extraSpace,1)];
    currentPos=1;
    allDB=[];
    for index=1:length(monoSig)/interval
        tempSig=monoSig(currentPos:currentPos+interval-1);
        Y=fft(tempSig,interval);
        magY=abs(Y);
        magY=magY(1:ceil(interval/2));
        allDB=[allDB;reshape(magY,[1,length(magY)])];
        currentPos=currentPos+interval;
    end
    saveFileName=['SequencedSong',num2str(currentSong),'.txt']
    dlmwrite(saveFileName,allDB);
end