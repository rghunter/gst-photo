
%% Define computer-specific variables
ipA = '192.168.1.11'; portA = 9090; %IP and port of main computer
ipB = '192.169.1.10'; portB = 9091; %Ip and port of this computer

if ~exist('udpB')
udpB = udp(ipA,portA,'LocalPort',portB);
fopen(udpB)
end

