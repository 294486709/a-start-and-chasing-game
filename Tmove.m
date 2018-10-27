function [peacount,pea,Tinfo]=Tmove(Mapinfo,Tinfo,pea,peacount)
if peacount==0
    scatter(Mapinfo(Tinfo(1).currentT).x(1,1),Mapinfo(Tinfo(1).currentT).x(2,1),'w')
    scatter(Tinfo(1).xPath(1,2),Tinfo(1).xPath(2,2),'r');
    tmp=coordtoidx(Tinfo(1).xPath(1,1),Tinfo(1).xPath(2,1));
    Tinfo(1).history=[tmp Tinfo(1).history];
    Tinfo(1).xPath(:,1)=[];
    idxxPath1=coordtoidx(Tinfo(1).xPath(1,1),Tinfo(1).xPath(2,1));
    Tinfo(1).currentT=idxxPath1;
    if size(Tinfo(1).currentT,1)~=1
        Tinfo(1).currentT=coordtoidx(Tinfo(1).currentT(1,1),Tinfo(1).currentT(2,1));
    end
    if Tinfo(1).currentT==pea
        peacount=1+peacount;
        scatter(Mapinfo(pea).x(1,1),Mapinfo(pea).x(2,1),'*w');
        pea=init_select_pea_loaction();
        pea=pea(1).idx;
        scatter(Mapinfo(pea).x(1,1),Mapinfo(pea).x(2,1),'*g');
        Tinfo(1).snakebody=[Tinfo(1).currentT Tinfo(1).history(1) ];
    end
else
    if isempty(find(Tinfo(1).snakebody==pea))==0
        peacount=1+peacount;
        scatter(Mapinfo(pea).x(1,1),Mapinfo(pea).x(2,1),'*w');
        pea=init_select_pea_loaction();
        pea=pea(1).idx;
        scatter(Mapinfo(pea).x(1,1),Mapinfo(pea).x(2,1),'*g');
        tmp=coordtoidx(Tinfo(1).xPath(1,1),Tinfo(1).xPath(2,1));
        Tinfo(1).history=[tmp Tinfo(1).history];
        for i=1:peacount+1
            Tinfo(1).snakebody=[Tinfo(1).snakebody Tinfo(1).history(i) ];
        end
        for i=1:peacount
            plot([Mapinfo(Tinfo(1).snakebody(i)).x(1,1),Mapinfo(Tinfo(1).snakebody(i+1)).x(1,1)],[Mapinfo(Tinfo(1).snakebody(i)).x(2,1),Mapinfo(Tinfo(1).snakebody(i+1)).x(2,1)],'white');
        end
        Tinfo(1).xPath=[];
    else
        Tinfo(1).snakebody=[];
        for i=1:peacount+1
            Tinfo(1).snakebody=[Tinfo(1).snakebody Tinfo(1).history(i) ];
        end
        Tinfo(1).currentT=Tinfo(1).xPath(:,1);
        Tinfo(1).currentT=coordtoidx(Tinfo(1).currentT(1,1),Tinfo(1).currentT(2,1));
        scatter(Mapinfo(Tinfo(1).currentT).x(1,1),Mapinfo(Tinfo(1).currentT).x(2,1),'w');
        for i=1:peacount
            plot([Mapinfo(Tinfo(1).snakebody(i)).x(1,1),Mapinfo(Tinfo(1).snakebody(i+1)).x(1,1)],[Mapinfo(Tinfo(1).snakebody(i)).x(2,1),Mapinfo(Tinfo(1).snakebody(i+1)).x(2,1)],'white');
        end
        Tinfo(1).snakebody(peacount+1)=[];
        nextbody=Tinfo(1).xPath(:,1);
        nextbody=coordtoidx(nextbody(1,1),nextbody(2,1));
        if nextbody==Tinfo(1).snakebody(1)
            nextbody=Tinfo(1).xPath(:,2);
            nextbody=coordtoidx(nextbody(1,1),nextbody(2,1));
        end
        Tinfo(1).snakebody=[nextbody Tinfo(1).snakebody ];
        Tinfo(1).currentT=Tinfo(1).xPath(:,1);
        Tinfo(1).currentT=coordtoidx(Tinfo(1).currentT(1,1),Tinfo(1).currentT(2,1));
        if Tinfo(1).snakebody(1)==Tinfo(1).snakebody(2)
            Tinfo(1).snakebody(1)=[];
        end
        for i=1:peacount
            plot([Mapinfo(Tinfo(1).snakebody(i)).x(1,1),Mapinfo(Tinfo(1).snakebody(i+1)).x(1,1)],[Mapinfo(Tinfo(1).snakebody(i)).x(2,1),Mapinfo(Tinfo(1).snakebody(i+1)).x(2,1)],'red');
        end
        tmp=coordtoidx(Tinfo(1).xPath(1,1),Tinfo(1).xPath(2,1));
        Tinfo(1).history=[tmp Tinfo(1).history];
        Tinfo(1).xPath(:,1)=[];
    end
end
end