function idx=grid_findNearestElement(grid,x)
idx=[
    findNearestIdxVector(x(1),grid.xx);
    findNearestIdxVector(x(2),grid.yy);
    ];

function idx=findNearestIdxVector(x,xx)
idxLower=find(xx<x,1,'last');
idxHigher=find(xx>x,1,'first');

if isempty(idxHigher) || (~isempty(idxLower) && abs(x-xx(idxLower))<abs(x-xx(idxHigher)))
    idx=idxLower;
else
    idx=idxHigher;
end
