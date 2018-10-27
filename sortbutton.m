function Bcoord=sortbutton()
Bcoord=struct('hight',{0},'width',{});
counter=1
for i=1:36
    for j=1:36
        Bcoord(counter).hight=930-25*(i-1);
        Bcoord(counter).width=10+25*(j-1)
        counter=counter+1;
    end
end

end