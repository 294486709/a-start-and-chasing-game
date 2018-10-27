function main()
load result.mat
load zoon2.mat
Nresult=size(result1,2);
counter=0;
%rand('seed',10)
timer=0;
clf
load 4.mat
hold on;
peacount=0; 
snakebody=[];
gameoverindicator=0;
% plot the world
draw_the_map();
% generate pea
pea=init_select_pea_loaction();
pea=pea(1).idx;
CTinfo=struct('idx',[],'xPath',[],'vision',[],'mode',[1]);
Tinfo=struct('currentT',[],'xPath',[],'history',[],'snakebody',[]);
% set starting points rand and plot
Tinfo(1).currentT=fix(rand(1)*1296);
% temp=fix(rand(1)*1296);
% Mapinfo(temp).mode=1;
% scatter(Mapinfo(temp).x(1,1),Mapinfo(temp).x(2,1),'*b');
% temp=fix(rand(1)*1296);
% Mapinfo(temp).mode=2;
% scatter(Mapinfo(temp).x(1,1),Mapinfo(temp).x(2,1),'*y');
%currentT=655;
CTinfo(1).idx=fix(rand(1)*1296);
scatter(Mapinfo(pea).x(1,1),Mapinfo(pea).x(2,1),'*g');
scatter(Mapinfo(Tinfo(1).currentT).x(1,1),Mapinfo(Tinfo(1).currentT).x(2,1),'r');
scatter(Mapinfo(CTinfo(1).idx).x(1,1),Mapinfo(CTinfo(1).idx).x(2,1),'b');
% get path from A*
CTinfo(1).xPath=[];
while 1
    if size(Tinfo(1).history,2)>peacount+3
        Tinfo(1).history(:,peacount+3)=[];
    end
    
    [Tinfo,counter,timer]=Tpathinspection_planner(Mapinfo,pea,Tinfo,CTinfo,peacount,counter,timer);
    if isempty(Tinfo(1).xPath)==1
        h=msg('game over!');
        break;
    end
    CTinfo=CTVisibilitycheck(Mapinfo,CTinfo,Tinfo);
    for k=1:size(CTinfo,2)
        if isempty(find(CTinfo(k).vision==Tinfo(1).currentT))==1
            CTinfo(k).mode=1;
        else
            CTinfo(k).mode=2;
        end
    end
    
    CTinfo=CTpathplanner(CTinfo,Tinfo(1).currentT,Mapinfo,peacount);
    [peacount,pea,Tinfo]=Tmove(Mapinfo,Tinfo,pea,peacount);
    pause(0.01)
    [gameoverindicator,CTinfo]=CTmove(Mapinfo,CTinfo,Tinfo);
    pause(0.01)
    if gameoverindicator==1
        h=msgbox('game over!');
        break
    end
end
result1(Nresult+1).time=timer;
result1(Nresult+1).score=peacount;
save result.mat result1


end







% plot path and return coordCT for further computation
% coordCT=plot_path_runner(RealpathT,RealpathCT);
% % reset starting point and pea
% idxCT=36*(36-coordCT(2,1))+coordCT(1,1);
% idxT=pea(1).idx;
% pea=init_select_pea_loaction();
% while 1==1
%     %plot points
%     scatter(Mapinfo(pea(1).idx).x(1,1),37-Mapinfo(pea(1).idx).x(2,1),'*g');
%     scatter(Mapinfo(idxT).x(1,1),37-Mapinfo(idxT).x(2,1),'r');
%     scatter(Mapinfo(idxCT).x(1,1),37-Mapinfo(idxCT).x(2,1),'b');
%     % get path from A*
%     xPathT=graph_planner(Mapinfo,idxT,pea(1).idx);
%     xPathCT=graph_planner(Mapinfo,idxCT,pea(1).idx);
%     RealpathT=reorganize(xPathT);
%     RealpathCT=reorganize(xPathCT);
%     coordCT=plot_path_runner(RealpathT,RealpathCT);
%     if isempty(coordCT)==1
%     break
%     end
%     idxCT=36*(36-coordCT(2,1))+coordCT(1,1);
%     idxT=pea(1).idx;
%     pea=init_select_pea_loaction();
% end




