function Mapinfo=wallbreaker(x,y,q)
load 4.mat
idx=x+(y-1)*36;
if q==1
    Mapinfo(idx).up=1;
    Mapinfo(idx-36).down=1;
elseif q==2
    Mapinfo(idx).right=1;
    Mapinfo(idx+1).left=1;
elseif q==3
    Mapinfo(idx).down=1;
    Mapinfo(idx+36).up=1;
elseif q==4
    Mapinfo(idx).left=1;
    Mapinfo(idx-1).right=1;
end
save 4.mat Mapinfo

end