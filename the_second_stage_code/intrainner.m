function [intance1,intance2,intance3]=intrainner(class,label)
[a,b]=size(class);
anumber=sum(label);
bnumber=a-anumber;
aclass=zeros(anumber,b);
bclass=zeros(bnumber,b);
aindex=1;
bindex=1;
for i=1:a
    if label(i)==1    
    aclass(aindex,:)=class(i,:);
    aindex=aindex+1;
    else
    bclass(bindex,:)=class(i,:);  
    bindex=bindex+1;
    end
end

intance1=0;
for i=1:anumber
A=aclass(i,:);
Aintance=0;
for j=1:anumber
Aintance=Aintance+sum((A-aclass(j,:)).^2);
end
intance1=intance1+Aintance/(anumber-1);
end
intance1=intance1/anumber;

intance2=0;
for i=1:bnumber
B=bclass(i,:);
Bintance=0;
for j=1:bnumber
Bintance=Bintance+sum((B-bclass(j,:)).^2);
end
intance2=intance2+Bintance/(bnumber-1);
end
intance2=intance2/bnumber;


intance3=0;
for i=1:anumber
C=aclass(i,:);
Cintance=0;
for j=1:bnumber
Cintance=Cintance+sum((C-bclass(j,:)).^2);
end
intance3=intance3+Cintance/(bnumber);
end
intance3=intance3/anumber;
