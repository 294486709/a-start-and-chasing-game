function [graphVector] = grid2graph(xGrid, yGrid, flag)
%GRID2GRAPH takes 2 vectors xGrid and yGrid and an array flag of size
%(length(xGrid), length(yGrid)) and generates a graphVector structure based
%on 8 neighbor connectivity. xGrid and yGrid contain the x,y positions of
%the nodes to be generated, and the logical in flag determines whether a
%node at that position exists.
%graphVector
%	neighbors - array of vertices adjacent to this one
%	neighborsCost - array of same size to neightbors, contains cost
%					to move to that respective neighbor
%	g - cost of travelling from start node to current node via
%		the path in backpointer
%	backpointer - index of the previous vertex in the current path
%					from the starting location
%	x - 2x1 vector with the physical (x,y) coordinates of the vector

% xGrid, yGrid are NGrid x 1 vectors
% flag is an Ngrid x Ngrid logical array

[ar, ac] = find(flag == 1);
x_y = [ar ac];

%Initialize a struct for each node in flag
for k = 1:length(ar)
    graphVector(k).x = [xGrid(ac(k)); yGrid(ar(k))];
    graphVector(k).neighbors = [];
    graphVector(k).neighborsCost = [];
    graphVector(k).g = [];
    graphVector(k).backpointer = [];
end

%Add connections
for k = 1:length(ar)
    if (ar(k) > 1)
        %safe to look up
        if (flag(ar(k)-1,ac(k)) == 1)
            %Neighbor above
            temp = find(ismember(x_y,[ar(k)-1 ac(k)],'rows'));
            graphVector(k).neighbors = [graphVector(k).neighbors temp];
            graphVector(k).neighborsCost = [graphVector(k).neighborsCost ...
                euc_dist(graphVector(k).x, graphVector(temp).x)];
        end
        
        if (ac(k) > 1)
            %safe to look left
            if (flag(ar(k)-1,ac(k)-1) == 1)
                %Neighbor up left
                temp = find(ismember(x_y,[ar(k)-1 ac(k)-1],'rows'));
                graphVector(k).neighbors = [graphVector(k).neighbors temp];
                graphVector(k).neighborsCost = [graphVector(k).neighborsCost ...
                    euc_dist(graphVector(k).x, graphVector(temp).x)];
            end
        end
        
        if (ac(k) < length(xGrid))
            %safe to look right
            if (flag(ar(k)-1, ac(k)+1) == 1)
                %Neighbor up right
                temp = find(ismember(x_y,[ar(k)-1 ac(k)+1],'rows'));
                graphVector(k).neighbors = [graphVector(k).neighbors  temp];
                graphVector(k).neighborsCost = [graphVector(k).neighborsCost ...
                    euc_dist(graphVector(k).x, graphVector(temp).x)];
            end
        end
    end
    
    if (ac(k) > 1)
        %safe to look left
        if flag(ar(k), ac(k)-1) == 1
            %Neighbor left
            temp = find(ismember(x_y,[ar(k) ac(k)-1],'rows'));
            graphVector(k).neighbors = [graphVector(k).neighbors temp];
            graphVector(k).neighborsCost = [graphVector(k).neighborsCost ...
                euc_dist(graphVector(k).x, graphVector(temp).x)];
            
        end
    end
    if (ac(k) < length(xGrid))
        %safe to look right
        if (flag(ar(k), ac(k)+1) == 1)
            %Neighbor right
            temp = find(ismember(x_y,[ar(k) ac(k)+1],'rows'));
            graphVector(k).neighbors = [graphVector(k).neighbors  temp];
            graphVector(k).neighborsCost = [graphVector(k).neighborsCost ...
                euc_dist(graphVector(k).x, graphVector(temp).x)];
        end
    end
    
    if (ar(k) < length(yGrid))
        %safe to look down
        if (flag(ar(k)+1,ac(k)) == 1)
            %neighbor down
            temp = find(ismember(x_y,[ar(k)+1 ac(k)],'rows'));
            graphVector(k).neighbors = [graphVector(k).neighbors  temp];
            graphVector(k).neighborsCost = [graphVector(k).neighborsCost ...
                euc_dist(graphVector(k).x, graphVector(temp).x)];
        end
        
        if (ac(k) > 1)
            %safe to look left
            if (flag(ar(k)+1, ac(k)-1) == 1)
                %neighbor down left
                temp = find(ismember(x_y,[ar(k)+1 ac(k)-1],'rows'));
                graphVector(k).neighbors = [graphVector(k).neighbors temp];
                graphVector(k).neighborsCost = [graphVector(k).neighborsCost ...
                    euc_dist(graphVector(k).x, graphVector(temp).x)];
            end
        end
        
        if (ac(k) < length(xGrid))
            %safe to look right
            if (flag(ar(k)+1, ac(k)+1) == 1)
                %neighbor down right
                temp = find(ismember(x_y,[ar(k)+1 ac(k)+1],'rows'));
                graphVector(k).neighbors = [graphVector(k).neighbors  temp];
                graphVector(k).neighborsCost = [graphVector(k).neighborsCost ...
                    euc_dist(graphVector(k).x, graphVector(temp).x)];
            end
        end
    end
end
%	neighboridx = find(ismember(x_y,[tr tc],'rows'))

%Compute Euclidean distance
function d=euc_dist(x1,x2)
d=norm(x1-x2);