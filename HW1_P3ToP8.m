close all;
% Jwei 2019年9月20日09:43:49
% Animation of NGSIM I-80 Vehicle Trajectories

load('trajectories.mat')
CarIDs = unique(trajectories(:,1));
LaneID = unique(trajectories(:,14));
colors = ['r','g','k'];       
% 横线距离为：0--100
% 纵向距离为：0--1800

title("The Vehicle Space-Time Trajectories Map of NGSIM(I-80),LaneID:1");

xlabel('Time(Unix)')
ylabel('Position(feet)')

xlabel('Time(Unix)')
ylabel('Position(feet)')
hold on
% Plot Space-Time
for i=1:length(CarIDs)/4

    PerCarPathData = trajectories(trajectories(:,1)==CarIDs(i),:);
    if PerCarPathData(1,14) ~= 1% && PerCarPathData(1,14) ~= 6
        continue;
    end
    CarPathLength = length(PerCarPathData);
    Position = zeros(CarPathLength,2);
    CarClass = PerCarPathData(1,11);
    PIndex = PerCarPathData(:,6);
    PIndex(end)=NaN;
    TIndex = PerCarPathData(:,4);
    TIndex(end)=NaN;
    VIndex = PerCarPathData(:,12);
    VIndex(end)=NaN;
    VIndex(VIndex>80) = 80;
    figure(1)
    patch(TIndex,PIndex,VIndex,'EdgeColor','flat','LineWidth',1,'MarkerFaceColor','flat','FaceColor','none');
    grid on; 
    ch=colorbar('YTickLabel',{'0','10','20','30','40','50','60','70','>=80'})%{'0','5','10','15','20','25','30','35','40','>=45'});
    set(get(ch,'title'),'string','Velocity(Km/h)');
   
%     plot(TIndex,PIndex,'Color',colors(CarClass));%Delete '%',you can see certain color with certain Car-class.
    
    %画Gif图
    
%     if mod(i,50) ==1
%         drawnow;
%         F=getframe(gcf);
%         I=frame2im(F);
%         [I,map]=rgb2ind(I,256);
%         if pic_num == 1
%             imwrite(I,map,'NGSIM_I-80_Space-Time.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
%         else
%             imwrite(I,map,'NGSIM_I-80_Space-Time.gif','gif','WriteMode','append','DelayTime',0.2);
%         end
%         pic_num = pic_num + 1;
%     end
    
end
