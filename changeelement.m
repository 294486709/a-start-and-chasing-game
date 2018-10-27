function Mapinfo=changeelement(x,y)
load 4.mat
idx=x+(y-1)*36;
up=input('up!');
Mapinfo(idx).up=up;
right=input('right!');
Mapinfo(idx).right=right;
down=input('down!');
Mapinfo(idx).down=down;
left=input('left');
Mapinfo(idx).left=left;
save 4.mat Mapinfo
end