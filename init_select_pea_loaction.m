function pea=init_select_pea_loaction()
pea=struct('idx',{});
newx=fix(1296*rand(1)+1);
while newx==1297 
    newx=fix(1296*rand(1));
end
pea(1).idx=newx;
end