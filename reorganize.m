function Realpath=reorganize(xPath)
for i=1:size(xPath,2)
    xPath(2,i)=37-xPath(2,i);
end
Realpath=xPath;
end