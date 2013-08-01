
%% Define computer-specific variables
ipA = '127.0.0.1'; portA = 3300; %IP and port of main computer

udpB = udp(ipA,portA);
fopen(udpB)

fwrite(udpB,'ASFSDF')
pause(0.05)
imdata = imread('/tmp/ramdisk/testImage.jpg');
image(imdata)
fclose(udpB)

