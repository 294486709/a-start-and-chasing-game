function xPath=WF_planner(Mapinfo,idxstart,idxgoal)
for i=1:1296
    Mapinfo(i).UDist=NaN;
end
Mapinfo(idxgoal).UDist=0;
while 1
    queue=[];
    for i=1:1296
        neighbor=Mapinfo(i).neighbors;
        Nneighbor=size(neighbor,2);
        for j=1:Nneighbor
            if isnan(neighbor(j))==0
                queue=[queue Mapinfo(neighbor(j)).UDist];
            end
        end
        if isempty(queue)==1
        else
            if isnan(Mapinfo(i).UDist)==1
        Mapinfo(i).UDist=min(queue+1);
            end
        end
        queue=[];
    end
    
    if isnan(Mapinfo(idxstart).UDist)==0
        break;
    end
end
xPathidx=[];
xPathidx(1)=idxstart;
UD=inf;
active=idxstart;
while UD~=0
    Nxpath=size(xPathidx,2);
    neighbors=Mapinfo(active).neighbors;
    for j=1:size(neighbors,2)
        neigborUDist(j)=Mapinfo(neighbors(j)).UDist;
    end
    [UD,idx]=min(neigborUDist);
    xPathidx(Nxpath+1)=neighbors(idx);  
    active=neighbors(idx);
end
if size(xPathidx,2)==2
    xPathidx(1)=[];
end
xPathidx=[xPathidx idxgoal];

xPath=[];
for i=1:size(xPathidx,2)
    temp=Mapinfo(xPathidx(i)).x;
    xPath=[xPath temp];
end
end