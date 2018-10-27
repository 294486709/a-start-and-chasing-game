function falty=find_falty_element()
defineneighbors();
load 4.mat
falty=[]
for i=1:1296
    neighbors=Mapinfo(i).neighbors;
    for j=1:size(neighbors,2)
        temp=neighbors(j);
        if isempty(find(Mapinfo(temp).neighbors==i))
            falty=[falty i];
        end
    end
end
end