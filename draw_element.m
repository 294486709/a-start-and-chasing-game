function draw_element(coord,up,right,down,left)
x=coord(1,1);
y=coord(2,1);
leftup=[x-0.5;y+0.5];
leftdown=[x-0.5;y-0.5;];
rightup=[x+0.5;y+0.5];
rightdown=[x+0.5;y-0.5];
if up==0
    plot([leftup(1,1),rightup(1,1)],[leftup(2,1),rightup(2,1)],'black');
end
if right==0
    plot([rightup(1,1),rightdown(1,1)],[rightup(2,1),rightdown(2,1)],'black');
end
if down==0
    plot([leftdown(1,1),rightdown(1,1)],[leftdown(2,1),rightdown(2,1)],'black');
end
if left==0
    plot([leftup(1,1),leftdown(1,1)],[leftup(2,1),leftdown(2,1)],'black');
end
end