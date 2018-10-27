function CTinfo=CTpathplanner(CTinfo,Tinfo,Mapinfo,peacount)
if peacount>size(CTinfo,2)-1
    CTinfo(size(CTinfo,2)+1).idx=fix(rand(1)*1296);
    CTinfo(size(CTinfo,2)).mode=1;
end

for i=1:size(CTinfo,2)
    if CTinfo(i).mode==1
        if isempty(CTinfo(i).xPath)==1
            temprandom=fix(rand(1)*1296);
            CTinfo(i).xPath=graph_planner(Mapinfo,CTinfo(i).idx,temprandom);
        end
    else
        CTinfo(i).xPath=[];
        CTinfo(i).xPath=graph_planner(Mapinfo,CTinfo(i).idx,Tinfo);
    end
end

% 
% for i=1:size(CTinfo,2)
%     if CTinfo(i).idx==Ice
%         scatter(Mapinfo(CTinfo(i).idx).x(1,1),Mapinfo(CTinfo(i).idx).x(2,1),'w');
%         CTinfo(i).mode=5;
%                 new=fix(rand(1)*1296);
%         Mapinfo(new).mode=1;
%         scatter(Mapinfo(new).x(1,1),Mapinfo(new).x(2,1),'y');
%     elseif CTinfo(i).idx==Storm
%         scatter(Mapinfo(CTinfo(i).idx).x(1,1),Mapinfo(CTinfo(i).idx).x(2,1),'w');
%         CTinfo(i).idx==fix(rand(1)*1296);
%         CTinfo(i).xPath=[];
%         Mapinfo(Storm).mode=0;
%         new=fix(rand(1)*1296);
%         Mapinfo(new).mode=2;
%         scatter(Mapinfo(new).x(1,1),Mapinfo(new).x(2,1),'g');
%     end
%     
% end
end