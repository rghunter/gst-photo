clear all
close all
clc

udp_init




frame_counter=5;
frame_string='frame_';
jpg_string='.jpg';
counter_string=num2str(frame_counter);
image=[frame_string counter_string jpg_string];
c=1;
while 1
    
    if exist(image)
         frame_counter=frame_counter+1;
         raw_image_data=imread(image);
         
         imshow(raw_image_data)
         
         
%         raw_image_data=raw_image_data(1:5:end,1:5:end,:);
% 
%         raw_image_data=double(raw_image_data);
%         
%         [rg cg wg]=size(raw_image_data);
% 
%         row=rg/2;
%         col=cg/2;
% 
%         pixel=raw_image_data(row,col,:);
%         
%         cmap = rgb2hsv(pixel);
        %[message]=image_processing(pixel(1,1,1));
        
        message=input('1-blue, 2-green, 3-cyan, 4-yellow, 5-red')
        fwrite(udpB,message);    
        
        counter_string=num2str(frame_counter);
        image=[frame_string counter_string jpg_string];
    end
    cc=(-1)^c
    c=c+1;
end