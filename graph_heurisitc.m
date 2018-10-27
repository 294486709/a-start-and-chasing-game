function [h]=graph_heurisitc(graphVector,ideX,idxGoal)
%load graph_testData.mat
% collect data from input
start=graphVector(ideX).x;
goal=graphVector(idxGoal).x;
% compute distance 
h=((start(1,1)-goal(1,1))^2+(start(2,1)-goal(2,1))^2)^0.5;
end