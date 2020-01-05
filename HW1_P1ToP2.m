close all;
% Jwei 2019年9月20日09:43:49
% Animation of NGSIM I-80 Vehicle Trajectories

load('trajectories.mat')
CarIDs = unique(trajectories(:,1));
        
% 横线距离为：0--100
% 纵向距离为：0--1800
%% 
figure(1)
xlimit = [-5 100];
ylimit = [0 1800];
LaneLineDis = 11.7;
title("The Bird View of NGSIM(I-80) Trajectories");
xlim(xlimit)
ylim(ylimit)
xlabel('Horizontal(feet)')
ylabel('Vertical(feet)')
colors = ['m','g','y','k','r','c'];
 
% Plot Lone Line
for i = 1:7
    hold on 
    line([(i-1)*LaneLineDis (i-1)*LaneLineDis],[0 1800],'Color','blue','LineStyle','--','LineWidth',3);
end
line([90,(i-1)*LaneLineDis],[250,550],'Color','blue','LineStyle','--','LineWidth',3);
line([100,(i-1)*LaneLineDis],[900-((i-1)*LaneLineDis-100)*300/((i-1)*LaneLineDis-90),900],'Color','blue','LineStyle','--','LineWidth',3);
pic_num = 1;
% Plot Trajectories
for i=1:length(CarIDs)
    PerCarPathData = trajectories(trajectories(:,1)==CarIDs(i),:);
    CarPathLength = length(PerCarPathData);
    Position = zeros(CarPathLength,2);
    CarClass = PerCarPathData(1,11);
    XIndex = PerCarPathData(:,5);
    XIndex(end) = NaN;
    YIndex = PerCarPathData(:,6);
    YIndex(end) =NaN;
    VIndex = PerCarPathData(:,12);
    VIndex(VIndex>45) = 45;
    VIndex(end) =NaN;
    figure(1)
    hold on
    patch(XIndex,YIndex,VIndex,'EdgeColor','flat','FaceColor','none');
    grid on; 
    ch=colorbar('YTickLabel',{'0','5','10','15','20','25','30','35','40','>=45'});
    set(get(ch,'title'),'string','Velocity');
 
    
%     %plot .Gif
%     if mod(i,50) ==1
%         drawnow;
%         F=getframe(gcf);
%         I=frame2im(F);
%         [I,map]=rgb2ind(I,256);
%         if pic_num == 1
%             imwrite(I,map,'NGSIM_I-80.gif','gif', 'Loopcount',inf,'DelayTime',0.2);
%         else
%             imwrite(I,map,'NGSIM_I-80.gif','gif','WriteMode','append','DelayTime',0.2);
%         end
%         pic_num = pic_num + 1;
%     end
    
end

