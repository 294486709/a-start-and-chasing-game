function [coordCT]=plot_path_runner(RealpathT,RealpathCT)
% initilize coordCT
coordCT=[];
% find common in two paths and find the first intersection
[meetingpoint,stepT,stepCT]=intersect(RealpathT',RealpathCT','row');
stepT=min(stepT);
stepCT=min(stepCT);
stepcountT=size(RealpathT,2);
stepcountCT=size(RealpathCT,2);
if isempty(meetingpoint)==1
else
    intersectionpoint=meetingpoint(1);
    if stepCT<=stepT
        for i=1:stepCT-1

            line([RealpathT(1,i) RealpathT(1,i+1)],[RealpathT(2,i) RealpathT(2,i+1)],'color','red')
            if i>1
            line([RealpathT(1,i-1) RealpathT(1,i)],[RealpathT(2,i-1) RealpathT(2,i)],'color','w')
            end
            pause(0.05)
            line([RealpathCT(1,i) RealpathCT(1,i+1)],[RealpathCT(2,i) RealpathCT(2,i+1)],'color','blue')
            if i>1
               line([RealpathCT(1,i-1) RealpathCT(1,i)],[RealpathCT(2,i-1) RealpathCT(2,i)],'color','w') 
            end
            pause(0.05)
        end
        for i=stepCT:stepT-1
            line([RealpathT(1,i) RealpathT(1,i+1)],[RealpathT(2,i) RealpathT(2,i+1)],'color','red')
            if i>1
                line([RealpathT(1,i-1) RealpathT(1,i)],[RealpathT(2,i-1) RealpathT(2,i)],'color','w')
            end
            pause(0.05)
        end
        h=msgbox('Counter-terrorisits win');
        main()
    else
        for i=1:stepcountT-1
            
            line([RealpathT(1,i) RealpathT(1,i+1)],[RealpathT(2,i) RealpathT(2,i+1)],'color','red')
            if i>1
                line([RealpathT(1,i-1) RealpathT(1,i)],[RealpathT(2,i-1) RealpathT(2,i)],'color','w')
            end
            pause(0.05)
            line([RealpathCT(1,i) RealpathCT(1,i+1)],[RealpathCT(2,i) RealpathCT(2,i+1)],'color','blue')
            if i>1
                line([RealpathCT(1,i-1) RealpathCT(1,i)],[RealpathCT(2,i-1) RealpathCT(2,i)],'color','w')
            end
            pause(0.05)
        end
        coordCT=RealpathCT(:,i);
        return
    end
end
end

