function defineneighbors()
load 4.mat
for i=1:size(Mapinfo,2)
    Mapinfo(i).neighbors=[];
end
for i=1:size(Mapinfo,2)
    if Mapinfo(i).left==1
        if i-1>0 && i-1<1297
            Mapinfo(i).neighbors=[Mapinfo(i).neighbors i-1];
        end
    end
    if Mapinfo(i).right==1
        if i+1>0 && i+1<1297
            Mapinfo(i).neighbors=[Mapinfo(i).neighbors i+1];
        end
    end
    if Mapinfo(i).up==1
        if i-36>0 && i-36<1297
            Mapinfo(i).neighbors=[Mapinfo(i).neighbors i-36];
        end
    end
    if Mapinfo(i).down==1
        if i+36>0 && i+36<1297
            Mapinfo(i).neighbors=[Mapinfo(i).neighbors i+36];
        end
    end
    for i=1:size(Mapinfo,2)
        Mapinfo(i).neighborsbackup=Mapinfo(i).neighbors;
    end
end
save 4.mat Mapinfo
end
