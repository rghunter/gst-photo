function [message]=image_processing(hue)


% figure(2)
% 
% 
% surf(1:cg, 1:rg, cmap(:,:,1))
% hold on
% view(0,90)
% [x,y,but]=ginput(1);
% plot(x,y,'.k')
% 
% x=ceil(x);
% y=ceil(y);
%         
% hue=cmap(y,x,1)
% 

%%
%based on reward1=blue=1 reward2=green=2 penalty1=yellow=3 penalty2=red=4
hue
if hue>.5
    color='blue'
    message=1;

elseif hue>.2 & hue<=.5
    color='green'
    message=2;
    
elseif hue>.11 & hue<=.2
    color='yellow'
    message=3;
elseif hue<=.11
        color='red'
        message=4;
else
    color='cant decide'
    message=5;
end


        
 

    
  