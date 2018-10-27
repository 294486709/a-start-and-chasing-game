unction graph_plot(graphVector)

NNodes=length(graphVector);
xAll=[graphVector.x];

for iNode=1:NNodes
    xNode=xAll(:,iNode);
    neighborsNode=graphVector(iNode).neighbors;
    neighborsCostNode=graphVector(iNode).neighborsCost;
    xNeighbors=xAll(:,neighborsNode);
    
    text(xNode(1),xNode(2),num2str(iNode),'EdgeColor','k');
    hold on
    
    for iNeighbor=1:length(neighborsNode)
        xEdge=xNeighbors(:,iNeighbor)-xNode;
        quiver(xNode(1),xNode(2),xEdge(1),xEdge(2))
        
        xLabel=xNode+xEdge/2;
        text(xLabel(1),xLabel(2),num2str(neighborsCostNode(iNeighbor)))
    end
end
hold off
axis equal
