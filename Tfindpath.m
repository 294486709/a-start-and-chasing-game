function xPathT=Tfindpath(CTinfo,Mapinfo,pea)
    NumCT=size(CTinfo,2);
    for i=1:NumCT
        Mapinfo(CTinfo(1).idx).neighbors=[];
    end
    xPathT=graph_planner(Mapinfo,idxStartT,pea);
    for i=1:NumCT
        Mapinfo(CTinfo(1).idx).neighbors=Mapinfo(CTinfo(1).idx).neighborsbackup;
    end
end