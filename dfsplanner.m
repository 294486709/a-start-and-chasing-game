function xPath=dfsplanner(idxStart,idxGoal,Mapinfo)
load 4.mat;
for i=1:1296
    Mapinfo(i).dfsnode=0;
    Mapinfo(i).stepcount=0;
end
Activeidx=idxStart;
Mapinfo(idxStart).stepcount=1;
findpath=0;
queue=[];
while 1
    lastnode=[];
    availableneighbor=[];
    if Mapinfo(Activeidx).dfsnode==0
        Mapinfo(Activeidx).dfsnode=1;
        neighbors=Mapinfo(Activeidx).neighbors;
        for i=1:size(neighbors,2)
            if Mapinfo(neighbors(i)).dfsnode==0
                availableneighbor=[availableneighbor neighbors(i)];
            end
        end
        if isempty(find(Activeidx==idxGoal))==1
        else
            Mapinfo(Activeidx).stepcount=last;
            findpath=1;
            break;
        end
        if isempty(availableneighbor)==1
            if isempty(queue)==1
                break
            end
            Activeidx=queue(1);
            queue(1)=[];
        else
            Activeidx=availableneighbor(1);
            availableneighbor(1)=[];
            if isempty(availableneighbor)==1
            else
                queue=[queue availableneighbor];
            end
            usedneighbor=Mapinfo(Activeidx).neighbors;
            for i=1:size(usedneighbor,2)
                if Mapinfo(usedneighbor(i)).stepcount==0
                else
                    lastnode=[lastnode Mapinfo(usedneighbor(i)).stepcount];
                end
            end
            if isempty(lastnode)==1
                Activeidx=usedneighbor(1);
            else
                mincost=min(lastnode);
                Mapinfo(Activeidx).stepcount=mincost+1;
                last=mincost+2;
            end
        end
    else
        Activeidx=queue(1);
        queue(1)=[];
    end
end
activepath=idxGoal;
idxPath=[idxGoal];
if findpath==1
    while 1
        neighborcost=[];
        idxPath=[idxPath activepath];
        if activepath==idxStart
            break
        end
        neighbors=Mapinfo(activepath).neighbors;
        for i=1:size(neighbors,2)
            if Mapinfo(neighbors(i)).stepcount==0
            else
                neighborcost=[neighborcost Mapinfo(neighbors(i)).stepcount];
            end
        end
        [minc,idx]=min(neighborcost);
        activepath=neighbors(idx);
    end
end
end