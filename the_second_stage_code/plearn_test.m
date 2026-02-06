load seqindex
%load seqindex_polyp
%load seqindex_paralysis
%plearn_rate=zeros(40,40,10,337);
tmprate=zeros(40,40,10);
tmpsrate=zeros(1,35);
tmpsrate1=zeros(1,35);
tmpsrate2=zeros(1,35);
raw_rate_array=zeros(26*13-1,40,35);
seq=1;
tic
for core_num=2:8
  %plearn_trainkernels(core_num);     
for dim=1:core_num
%for nexp=1:10
nexp=core_index(core_num);
[srate,srate1,srate2,raw_rate]=plearn_featureextraction_relief_bak(core_num,nexp,dim);
%[srate,srate1,srate2,raw_rate]=plearn_featureextraction_relief_1040(core_num,nexp,dim);
%plearn_rate(core_num,dim,nexp,:)=srate;
%tmprate(core_num,dim,nexp)=max(srate);
[tmpsrate(seq),loindex]=max(srate);
%raw_rate_array(seq,:)=raw_rate(loindex,:);
raw_rate_array(:,:,seq)=raw_rate;
% tmpsrate1(seq)=srate1(loindex);
% tmpsrate2(seq)=srate2(loindex);
seq=seq+1;
end
end
%end
toc
%save plearn_rate;
