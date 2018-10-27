function pea=select_pea_loaction(pea)
newx=fix(36*rand(1));
newy=fix(36*rand(1));
if isempty(pea.location)==1
else
    while newx~=pealocation(1,1) && newy~=pealocation(2,1)
        newx=fix(rand(1,36));
        newy=fix(rand(1,36));
    end
end
pea.location=[newx;newy];
end