function plearn_kmeansP_test(speechtype,Pnum,repnum)
%speechtype=1;
%repnum=1;
if speechtype==1
load seqindex
elseif speechtype==2
load seqindex_polyp
elseif speechtype==3
load seqindex_paralysis
end
plearn_rate=zeros(40,40,10,26*Pnum-1);
tmprate=zeros(40,40,10);
tmpsrate=zeros(1,35);
tmpsrate1=zeros(1,35);
tmpsrate2=zeros(1,35);
seq=1;
kmeansP_rate_array=zeros(26*Pnum-1,40,35);

for core_num=2:8
  %plearn_trainkernels(core_num);     
for dim=1:core_num
%for nexp=1:10
nexp=core_index(core_num);
[srate,srate1,srate2,kmeansP_rate]=plearn_featureextraction_kmeansP_relief(core_num,nexp,dim,Pnum,repnum);
plearn_rate(core_num,dim,nexp,:)=srate;
tmprate(core_num,dim,nexp)=max(srate);
[tmpsrate(seq),loindex]=max(srate);
kmeansP_rate_array(:,:,seq)=kmeansP_rate;
% tmpsrate1(seq)=srate1(loindex);
% tmpsrate2(seq)=srate2(loindex);
seq=seq+1;
%loindex
%end
end
end

if speechtype==1
save(['kmeans' num2str(13-Pnum) '_rate_array_rep' num2str(repnum)], 'kmeansP_rate_array');
elseif speechtype==2
save(['kmeans' num2str(13-Pnum) '_rate_array_polyp_rep' num2str(repnum)], 'kmeansP_rate_array');  
elseif speechtype==3
save(['kmeans' num2str(13-Pnum) '_rate_array_paralysis_rep' num2str(repnum)], 'kmeansP_rate_array');      
end

