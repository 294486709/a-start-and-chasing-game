function  [Tinfo,counter,timer]=Tpathinspection_planner(Mapinfo,pea,Tinfo,CTinfo,peacount,counter,timer)
prevqueue=[];
danger=[];
nextqueue=[];
counter=1;

zoon=struct('zoon1',[],'mode',{1});
for i=1:36
    zoon(i).zoon1=[];
    zoon(i).mode=1;
end
for i=1:216
    if counter<=6
        zoon(1).zoon1=[i zoon(1).zoon1];
        counter=counter+1;
    elseif counter>=7 && counter<=12
        zoon(2).zoon1=[i zoon(2).zoon1];
        counter=counter+1;
    elseif counter>=13 && counter<=18
        zoon(3).zoon1=[i zoon(3).zoon1];
        counter=counter+1;
    elseif counter>=19 && counter<=24
        zoon(4).zoon1=[i zoon(4).zoon1];
        counter=counter+1;
    elseif counter>=25 && counter<=30
        zoon(5).zoon1=[i zoon(5).zoon1];
        counter=counter+1;
    elseif counter>=31 && counter<=36
        zoon(6).zoon1=[i zoon(6).zoon1];
        counter=counter+1;
    end
    if counter==37
        counter=1;
    end
end
   counter=1;
for i=217:432
    if counter<=6
        zoon(7).zoon1=[i zoon(7).zoon1];
        counter=counter+1;
    elseif counter>=7 && counter<=12
        zoon(8).zoon1=[i zoon(8).zoon1];
        counter=counter+1;
    elseif counter>=13 && counter<=18
        zoon(9).zoon1=[i zoon(9).zoon1];
        counter=counter+1;
    elseif counter>=19 && counter<=24
        zoon(10).zoon1=[i zoon(10).zoon1];
        counter=counter+1;
    elseif counter>=25 && counter<=30
        zoon(11).zoon1=[i zoon(11).zoon1];
        counter=counter+1;
    elseif counter>=31 && counter<=36
        zoon(12).zoon1=[i zoon(12).zoon1];
        counter=counter+1;
    end
    if counter==37
        counter=1;
    end
end
   counter=1;
for i=433:648
    if counter<=6
        zoon(13).zoon1=[i zoon(13).zoon1];
        counter=counter+1;
    elseif counter>=7 && counter<=12
        zoon(14).zoon1=[i zoon(14).zoon1];
        counter=counter+1;
    elseif counter>=13 && counter<=18
        zoon(15).zoon1=[i zoon(15).zoon1];
        counter=counter+1;
    elseif counter>=19 && counter<=24
        zoon(16).zoon1=[i zoon(16).zoon1];
        counter=counter+1;
    elseif counter>=25 && counter<=30
        zoon(17).zoon1=[i zoon(17).zoon1];
        counter=counter+1;
    elseif counter>=31 && counter<=36
        zoon(18).zoon1=[i zoon(18).zoon1];
        counter=counter+1;
    end
    if counter==37
        counter=1;
    end
end
   counter=1;
for i=649:864
    if counter<=6
        zoon(19).zoon1=[i zoon(19).zoon1];
        counter=counter+1;
    elseif counter>=7 && counter<=12
        zoon(20).zoon1=[i zoon(20).zoon1];
        counter=counter+1;
    elseif counter>=13 && counter<=18
        zoon(21).zoon1=[i zoon(21).zoon1];
        counter=counter+1;
    elseif counter>=19 && counter<=24
        zoon(22).zoon1=[i zoon(22).zoon1];
        counter=counter+1;
    elseif counter>=25 && counter<=30
        zoon(23).zoon1=[i zoon(23).zoon1];
        counter=counter+1;
    elseif counter>=31 && counter<=36
        zoon(24).zoon1=[i zoon(24).zoon1];
        counter=counter+1;
    end
    if counter==37
        counter=1;
    end
end
   counter=1;
for i=865:1080
    if counter<=6
        zoon(25).zoon1=[i zoon(25).zoon1];
        counter=counter+1;
    elseif counter>=7 && counter<=12
        zoon(26).zoon1=[i zoon(26).zoon1];
        counter=counter+1;
    elseif counter>=13 && counter<=18
        zoon(27).zoon1=[i zoon(27).zoon1];
        counter=counter+1;
    elseif counter>=19 && counter<=24
        zoon(28).zoon1=[i zoon(28).zoon1];
        counter=counter+1;
    elseif counter>=25 && counter<=30
        zoon(29).zoon1=[i zoon(29).zoon1];
        counter=counter+1;
    elseif counter>=31 && counter<=36
        zoon(30).zoon1=[i zoon(6).zoon1];
        counter=counter+1;
    end
    if counter==37
        counter=1;
    end
end
   counter=1;
for i=1081:1296
    if counter<=6
        zoon(31).zoon1=[i zoon(31).zoon1];
        counter=counter+1;
    elseif counter>=7 && counter<=12
        zoon(32).zoon1=[i zoon(32).zoon1];
        counter=counter+1;
    elseif counter>=13 && counter<=18
        zoon(33).zoon1=[i zoon(33).zoon1];
        counter=counter+1;
    elseif counter>=19 && counter<=24
        zoon(34).zoon1=[i zoon(34).zoon1];
        counter=counter+1;
    elseif counter>=25 && counter<=30
        zoon(35).zoon1=[i zoon(35).zoon1];
        counter=counter+1;
    elseif counter>=31 && counter<=36
        zoon(36).zoon1=[i zoon(36).zoon1];
        counter=counter+1;
    end
    if counter==37
        counter=1;
    end
end

flag=0;
for i=1:size(CTinfo,2)
    for j=1:36
        temp=zoon(j).zoon1;
        temp2=CTinfo(i).idx;
        if isempty(find(temp==temp2))
        else
            zoon(j).mode=0;
        end
    end
end
safezoon=[];
for i=1:36
    if zoon(i).mode==1
        safezoon=[safezoon zoon(i).zoon1];
    end
end

if peacount==0
    peacount=2;
end
if isempty(Tinfo(1).xPath)==1 || size(Tinfo(1).xPath,2)==1
    while 1
        prevqueue=[];
        nextqueue=[];
        for i=1:1296
            Mapinfo(i).cta=[];
        end
        % input first point
        for i=1;size(CTinfo,2)
            Mapinfo(CTinfo(i).idx).cta=0;
            nextqueue=[nextqueue CTinfo(i).idx];
        end
        % give to neighbor loop
        for j=1:peacount+1
            prevqueue=nextqueue;
            nextqueue=[];
            for i=1:size(prevqueue,2)
                if isempty(find(nextqueue==prevqueue(i)))==1
                    nextqueue=[Mapinfo(prevqueue(i)).neighbors nextqueue];
                end
            end
            nextqueue=unique(nextqueue);
            for i=1:size(nextqueue,2)
                if isempty(Mapinfo(nextqueue(i)).cta)==1
                    Mapinfo(nextqueue(i)).cta=i;
                end
            end
            prevqueue=[];
        end
        prevqueue=[];
        nextqueue=[];
        danger=[];
        for i=1:1296
            if isempty(Mapinfo(i).cta)==0
                danger=[danger i];
            end
        end
        for i=1:size(danger,2)
            Mapinfo(danger(i)).neighbors=[];
        end
        tic;
        xPathT=graph_planner(Mapinfo,Tinfo(1).currentT,pea);
        timer=toc+timer;
        for i=1:size(danger,2)
            Mapinfo(danger(i)).neighbors=Mapinfo(i).neighborsbackup;
        end
        if size(xPathT,2)==2
            if isempty(find(Mapinfo(pea).neighbors==Tinfo(1).currentT))==1
            else
                Tinfo(1).xPath=xPathT;
                break
            end
            Tinfo(1).xPath=[];
            peacount=peacount-1;
            if peacount<=2
                if isempty(find(danger==pea))==0
                else
                    counter=counter+1;
                end
                if counter==5
                    counter=0;
                    if isempty(safezoon)==1
                        tic
                        Tinfo(1).xPath=graph_planner(Mapinfo,Tinfo(1).currentT,pea);
                        timer=toc+timer;
                        break
                    else
                        Nsafe=size(safezoon,2);
                        rands=fix(rand(1)*Nsafe);
                        dest=safezoon(rands);
                        tic
                        Tinfo(1).xPath=graph_planner(Mapinfo,Tinfo(1).currentT,dest);
                        timer=toc+timer;
                        break
                    end
                    
                    
                else
                    Tinfo(1).xPath=[];
                end
            end
        else
            Tinfo(1).xPath=xPathT;
            break
        end
        
    end
    
    %     for i=1:1296
    %         if isempty(Mapinfo(i).cta)==0
    %             scatter(Mapinfo(i).x(1,1),Mapinfo(i).x(2,1),'b');
    %         end
    %     end
    %     plot(Tinfo(1).xPath(1,:),Tinfo(1).xPath(2,:),'g');
    %     plot(Tinfo(1).xPath(1,:),Tinfo(1).xPath(2,:),'w');
    %     for i=1:1296
    %         if isempty(Mapinfo(i).cta)==0
    %             scatter(Mapinfo(i).x(1,1),Mapinfo(i).x(2,1),'w');
    %         end
    %     end
else
    coo=[];
    for i=1:size(Tinfo(1).xPath,2)
        coo=[coo coordtoidx(Tinfo(1).xPath(1,i),Tinfo(1).xPath(2,i))];
    end
    prevqueue=[];
    nextqueue=[];
    for i=1:1296
        Mapinfo(i).cta=[];
    end
    % input first point
    for i=1;size(CTinfo,2)
        Mapinfo(CTinfo(i).idx).cta=0;
        nextqueue=[nextqueue CTinfo(i).idx];
    end
    % give to neighbor loop
    for j=1:peacount+1
        prevqueue=nextqueue;
        nextqueue=[];
        for i=1:size(prevqueue,2)
            if isempty(find(nextqueue==prevqueue(i)))==1
                nextqueue=[Mapinfo(prevqueue(i)).neighbors nextqueue];
            end
        end
        nextqueue=unique(nextqueue);
        for i=1:size(nextqueue,2)
            if isempty(Mapinfo(nextqueue(i)).cta)==1
                Mapinfo(nextqueue(i)).cta=i;
            end
        end
        prevqueue=[];
    end
    prevqueue=[];
    nextqueue=[];
    danger=[];
    for i=1:1296
        if isempty(Mapinfo(i).cta)==0
            danger=[danger i];
        end
    end
    %     for i=1:size(danger,2)
    %         scatter(Mapinfo(danger(i)).x(1,1),Mapinfo(danger(i)).x(2,1),'g');
    %     end
    %     plot(Tinfo(1).xPath(1,:),Tinfo(1).xPath(2,:),'g');
    %     plot(Tinfo(1).xPath(1,:),Tinfo(1).xPath(2,:),'w');
    %     for i=1:size(danger,2)
    %         scatter(Mapinfo(danger(i)).x(1,1),Mapinfo(danger(i)).x(2,1),'w');
    %     end
    
    for i=1:size(CTinfo,2)
        if isempty(intersect(coo,danger))==1
        else
            flag=1;
        end
    end
    
    if flag==0
    else
        while 1
            for i=1:size(danger,2)
                Mapinfo(danger(i)).neighbors=[];
            end
            tic
            xPathT=graph_planner(Mapinfo,Tinfo(1).currentT,pea);
            timer=toc+timer;
            for i=1:size(danger,2)
                Mapinfo(danger(i)).neighbors=Mapinfo(i).neighborsbackup;
            end
            if size(xPathT,2)==2
                if isempty(find(danger==pea))==0
                else
                    counter=counter+1;
                end
                if counter==5
                    counter=0;
                    if isempty(safezoon)==1
                        tic
                        Tinfo(1).xPath=graph_planner(Mapinfo,Tinfo(1).currentT,pea);
                        timer=toc+timer;
                        break
                    else
                        Nsafe=size(safezoon,2);
                        rands=fix(rand(1)*Nsafe);
                        dest=safezoon(rands);
                        tic
                        Tinfo(1).xPath=graph_planner(Mapinfo,Tinfo(1).currentT,dest);
                        timer=toc+timer;
                        break
                    end
                end
                Tinfo(1).xPath=[];
                peacount=peacount-1;
                if peacount<=2
                    if isempty(safezoon)==1
                        tic
                        Tinfo(1).xPath=graph_planner(Mapinfo,Tinfo(1).currentT,pea);
                        timer=toc+timer;
                        break
                    else
                        Nsafe=size(safezoon,2);
                        rands=fix(rand(1)*Nsafe);
                        dest=safezoon(rands);
                        tic
                        Tinfo(1).xPath=graph_planner(Mapinfo,Tinfo(1).currentT,dest);
                        timer=toc+timer;
                        break
                    end
                    break
                else
                    Tinfo(1).xPath=[];
                end
            else
                Tinfo(1).xPath=xPathT;
                break
            end
        end
        %         for i=1:1296
        %             if isempty(Mapinfo(i).cta)==0
        %                 scatter(Mapinfo(i).x(1,1),Mapinfo(i).x(2,1),'b');
        %             end
        %         end
        %         plot(Tinfo(1).xPath(1,:),Tinfo(1).xPath(2,:),'g');
        %         plot(Tinfo(1).xPath(1,:),Tinfo(1).xPath(2,:),'w');
        %         for i=1:1296
        %             if isempty(Mapinfo(i).cta)==0
        %                 scatter(Mapinfo(i).x(1,1),Mapinfo(i).x(2,1),'w');
        %             end
    end
end
end
