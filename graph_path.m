function [xPath]=graph_path(graphVector,idxStart,idxEnd)
% set idxEnd as starting point
idxcurrent=idxEnd;
% intilize xPaht
xPath=[];
% loop unitl reach idxStart
while idxcurrent~=idxStart
    if idxcurrent==0
        break
    end
    % extract coordinate data and store into xPath
    coord=graphVector(idxcurrent).x;
    xPath=[xPath coord];
    idxcurrent=graphVector(idxcurrent).backpointer;
end
% add the starting point
xPath=[xPath graphVector(idxStart).x];
% filp the whole path to get a path from start to end
xPath=fliplr(xPath);
end