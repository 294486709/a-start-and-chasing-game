function [gameoverindicator,CTinfo]=CTmove(Mapinfo,CTinfo,Tinfo)
gameoverindicator=0;

for i=1:size(Tinfo(1).snakebody,2)
    snakeidx(i)=Tinfo(1).snakebody(i);
end
for i=1:size(CTinfo,2)
    if CTinfo(i).mode==5
    else
        if size(CTinfo(i).xPath)<3
            scatter(CTinfo(i).xPath(1,1),CTinfo(i).xPath(2,1),'w');
            scatter(CTinfo(i).xPath(1,2),CTinfo(i).xPath(2,2),'b');
            nextstep=coordtoidx(CTinfo(i).xPath(1,2),CTinfo(i).xPath(2,2));
            CTinfo(i).idx=nextstep;
            if isempty(find(Tinfo(1).snakebody==nextstep))==1
                if nextstep==Tinfo(1).currentT
                    gameoverindicator=1;
                end
            else
                if isempty(find(snakeidx==nextstep))==1
                else
                    gameoverindicator=1;
                end
                if nextstep==Tinfo(1).currentT
                    gameoverindicator=1;
                end
            end
            CTinfo(i).xPath=[];           
        else
            scatter(CTinfo(i).xPath(1,1),CTinfo(i).xPath(2,1),'w');
            scatter(CTinfo(i).xPath(1,2),CTinfo(i).xPath(2,2),'b');
            nextstep=coordtoidx(CTinfo(i).xPath(1,2),CTinfo(i).xPath(2,2));
            CTinfo(i).idx=nextstep;
            if isempty(find(Tinfo(1).snakebody==nextstep))==1
                if nextstep==Tinfo(1).currentT
                    gameoverindicator=1;
                end
            else
                if isempty(find(snakeidx==nextstep))==1
                else
                    gameoverindicator=1;
                end
                if nextstep==Tinfo(1).currentT
                    gameoverindicator=1;
                end
            end
            CTinfo(i).xPath(:,1)=[];
        end
    end
end