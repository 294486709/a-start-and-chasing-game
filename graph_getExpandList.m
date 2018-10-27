function [idxExpand]=graph_getExpandList(graphVector,idxNBest,idxClosed)
% extract desired neighbors
NeighborTemp=graphVector(idxNBest).neighbors;
% see if any of the element can be found in idxClosed
NeithborTemp=NeighborTemp'*~ismember(NeighborTemp,idxClosed);
% collect the data from the main diag 
% in this step, every element can not be found in idxClosed
% remain the original value, these who can be found changed 
% to zero.
NeithborTemp=diag(NeithborTemp)';
% get rid of any element with value zeor 
idxExpand=NeithborTemp(NeithborTemp~=0);
end