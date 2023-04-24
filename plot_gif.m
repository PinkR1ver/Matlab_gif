open ****.fig %open your fig file, data is the name I gave to my file
D=get(gca,'Children'); %get the handle of the line object
XData=get(D,'XData'); %get the x data
YData=get(D,'YData'); %get the y data
Data=[XData' YData']; %join the x and y data on one array nx2

numberaction = 30;

%% XData length
length = size(XData,2);

pic_num = 1;

set(gcf, 'Position',  [100, 100, 500, 400])

for k = 1:numberaction
    if k < 20
        plot(XData(1, 1:int64((length/1000)/numberaction*k^2)),-YData(1, 1:int64((length/1000)/numberaction*k^2)) + 0.5)
        xlabel('time/s')
        ylabel('amplitude/v')
        title('original signal')

    else
        plot(XData(1, 1:int64((length/1000)/numberaction*k^3)),-YData(1, 1:int64((length/1000)/numberaction*k^3)) + 0.5)
        xlabel('time/s')
        ylabel('amplitude/v')
        title('original signal')
    end
    F=getframe(gcf);
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);
    if pic_num == 1
        imwrite(I,map,'test.gif','gif','Loopcount',inf,'DelayTime',0.2);
    else
        imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',0.2);
    end

    pic_num = pic_num + 1;
end

close;