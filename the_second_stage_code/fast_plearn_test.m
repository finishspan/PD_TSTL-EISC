%load maxlittle_plearn_pratearray
%load tmparray(PartB)

%load tmprate_20_9_3
load tmprate_nomedia
% load tmprate_unoptimal
% load tmpsrate_unsselect
load seqindex
lrate=[];
lrate1=[];
for core_num=2:8
prate=zeros(core_num,10);   
for nexp=1:10
for dim=1:core_num     
prate(dim,nexp)=tmprate(core_num,dim,nexp);
end
end
prate1=prate(:,core_index(core_num));
lrate=[lrate;prate];
lrate1=[lrate1;prate1];
%nrate(:,core_num)=sum(prate,2)/10;
end


