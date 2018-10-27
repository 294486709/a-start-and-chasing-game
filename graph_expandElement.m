function [graphVector,pqOpen]=graph_expandElement(graphVector,idxNBest,idxX,idxGoal,pqOpen)
% intilize idxtemppq and get size
idxtemppq=[];
sizepq=size(pqOpen,2);
% collect data from pqOpen
for i=1:sizepq
    idxtemppq=[idxtemppq pqOpen(i).idx];
end
% if x is not part of pqOpen
if ismember(idxX,idxtemppq)==0
    % get c(nbest,x)
    Gtemp=1;
    % add up g(nBest) and c(nbest,x) 
    graphVector(idxX).g=graphVector(idxNBest).g+Gtemp;
    % set backpointer
    graphVector(idxX).backpointer=idxNBest;
    % compute heurisitc distance
    Htemp=graph_heurisitc(graphVector,idxX,idxGoal);
    % store them into pqOpen
    pqOpen(sizepq+1).idx=idxX;
    pqOpen(sizepq+1).cost=Htemp+graphVector(idxX).g;
% if g(nbest)+c(nbest,x)<g(x)
elseif graphVector(idxNBest).g+graph_heurisitc(graphVector,idxX,idxNBest)<graphVector(idxX).g
    %update g and backpointer
    graphVector(idxX).g=graphVector(idxNBest).g+graph_heurisitc(graphVector,idxX,idxNBest);
    graphVector(idxX).backpointer=idxNBest;
end

end