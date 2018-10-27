function [xPath]=graph_planner(graphVector,idxStart,idxGoal)
% initilize the staring point,closed and pqOpen
Vsize=size(graphVector,2);
idxtemppq=[];
for i=1:Vsize
    graphVector(i).g=0;
    graphVector(i).backpointer=0;
end
idxNBest=idxStart;
pqOpen=struct('idx',{},'cost',{});
closed=[idxStart 0];

% intilize first value
temp=graph_getExpandList(graphVector,idxNBest,closed);
sizetemp=size(temp,2);
for i=1:sizetemp
    pqOpen(i).idx=temp(i);
    G1=1;
    H1=graph_heurisitc(graphVector,temp(i),idxGoal);
    pqOpen(i).cost=G1+H1;
    graphVector(temp(i)).g=G1+H1;
end

% loop until reaching the goal
while isempty(pqOpen)~=1
    temppq=[];
    % find the min in pq.cost and set it as idxNBest
    sizepq=size(pqOpen,2);
    for i=1:sizepq
        temppq=[temppq pqOpen(i).cost];
    end
    idxminpq=min(temppq);
    idxminpq=find(temppq==idxminpq);
    idxNBest=pqOpen(idxminpq).idx;
    closed=[closed idxNBest];
    % check if we have reached the goal
    if idxNBest==idxGoal
        break;
    end
    pqOpen(idxminpq(1))=[];
    % get starnbest
    Starnbest=graph_getExpandList(graphVector,idxNBest,closed);
    Starnbestsize=size(Starnbest,2);
    % expand(A* line8-15)
    for i=1:Starnbestsize
        idxX=Starnbest(i);
        [graphVector,pqOpen]=graph_expandElement(graphVector,idxNBest,idxX,idxGoal,pqOpen);
    end
end
% convert data into path
xPath=graph_path(graphVector,idxStart,idxGoal);

end