
% record some speech (chien):
r= audiorecorder(44100, 8, 2);

disp( 'Inicio de grabacion.' )
%recordblocking(r, 8);
%disp( 'Fin de grabacion.' );
% Play back the recording.
figure
Fl=5.55e3; %Parámetro de ajuste
e=r;

recordblocking(r, 7);
disp( 'Fin de grabacion.' );


%play(r);
% Store data in double-precision array.

% write the recording in a wav file
z = getaudiodata(r);
Fs = get(r, 'SampleRate');
filename= 'Prueba1.m4a' ;
audiowrite(filename, z, Fs);
[z, Fs] = audioread(filename);


Guardar_muestra;
Frecuencia_muestra;
Identificador;
disp("el numero de cancion es")
disp (i)
u=i;

