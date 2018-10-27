function draw_the_map()
hold on;
axis equal;
load 4.mat
Nodesize=size(Mapinfo,2);
for i=1:Nodesize
    coord=Mapinfo(i).x;
    up=Mapinfo(i).up;
    down=Mapinfo(i).down;
    left=Mapinfo(i).left;
    right=Mapinfo(i).right;
    draw_element(coord,up,right,down,left);
    pause(0.01);
end

end