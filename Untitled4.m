load 2.mat
k=1
for i=1:36
    for j=1:36
        Mapinfo(k).x=[j;i];
        k=k+1
    end
end
save 2.mat    
