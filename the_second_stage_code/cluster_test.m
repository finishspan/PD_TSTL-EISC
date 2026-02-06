
lrate_layers=zeros(1,10);
sen_layers=zeros(1,10);
spec_layers=zeros(1,10);
meanvalue=zeros(13,4);
for layernum=2:13
for repnum=1:10
load ../data/result/original_layer(layer0)/raw_rate_array_5_10
load(['kmeans1_rate_array_rep' num2str(repnum)])
kmeans1_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans2_rate_array_rep' num2str(repnum)])
kmeans2_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans3_rate_array_rep' num2str(repnum)])
kmeans3_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans4_rate_array_rep' num2str(repnum)])
kmeans4_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans5_rate_array_rep' num2str(repnum)])
kmeans5_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans6_rate_array_rep' num2str(repnum)])
kmeans6_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans7_rate_array_rep' num2str(repnum)])
kmeans7_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans8_rate_array_rep' num2str(repnum)])
kmeans8_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans9_rate_array_rep' num2str(repnum)])
kmeans9_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans10_rate_array_rep' num2str(repnum)])
kmeans10_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans11_rate_array_rep' num2str(repnum)])
kmeans11_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array
load(['kmeans12_rate_array_rep' num2str(repnum)])
kmeans12_rate_array=kmeansP_rate_array;
clear kmeansP_rate_array

% load ../data/result/original_layer(layer0)/raw_rate_array_paralysis
% load(['kmeans1_rate_array_paralysis_rep' num2str(repnum)])
% kmeans1_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans2_rate_array_paralysis_rep' num2str(repnum)])
% kmeans2_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans3_rate_array_paralysis_rep' num2str(repnum)])
% kmeans3_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans4_rate_array_paralysis_rep' num2str(repnum)])
% kmeans4_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans5_rate_array_paralysis_rep' num2str(repnum)])
% kmeans5_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans6_rate_array_paralysis_rep' num2str(repnum)])
% kmeans6_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans7_rate_array_paralysis_rep' num2str(repnum)])
% kmeans7_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans8_rate_array_paralysis_rep' num2str(repnum)])
% kmeans8_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans9_rate_array_paralysis_rep' num2str(repnum)])
% kmeans9_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans10_rate_array_paralysis_rep' num2str(repnum)])
% kmeans10_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans11_rate_array_paralysis_rep' num2str(repnum)])
% kmeans11_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans12_rate_array_paralysis_rep' num2str(repnum)])
% kmeans12_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array

% load ../data/result/original_layer(layer0)/raw_rate_array_polyp
% load(['kmeans1_rate_array_polyp_rep' num2str(repnum)])
% kmeans1_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans2_rate_array_polyp_rep' num2str(repnum)])
% kmeans2_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans3_rate_array_polyp_rep' num2str(repnum)])
% kmeans3_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans4_rate_array_polyp_rep' num2str(repnum)])
% kmeans4_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans5_rate_array_polyp_rep' num2str(repnum)])
% kmeans5_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans6_rate_array_polyp_rep' num2str(repnum)])
% kmeans6_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans7_rate_array_polyp_rep' num2str(repnum)])
% kmeans7_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans8_rate_array_polyp_rep' num2str(repnum)])
% kmeans8_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans9_rate_array_polyp_rep' num2str(repnum)])
% kmeans9_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans10_rate_array_polyp_rep' num2str(repnum)])
% kmeans10_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans11_rate_array_polyp_rep' num2str(repnum)])
% kmeans11_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array
% load(['kmeans12_rate_array_polyp_rep' num2str(repnum)])
% kmeans12_rate_array=kmeansP_rate_array;
% clear kmeansP_rate_array

for lnum=1:12
localrate=0;
for i=1:(13-lnum)*26-1
for j=1:35
eval(['tmprate=sum(kmeans',num2str(lnum),'_rate_array(i,:,j));']);
if tmprate>localrate
    localrate=tmprate;
    eval(['kmeans',num2str(lnum),'index(1)=i;']);
    eval(['kmeans',num2str(lnum),'index(2)=j;']);
end
end
end
end

if layernum==2%2²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1);
elseif layernum==3%3²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1);
elseif layernum==4%4²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1);
elseif layernum==5%5²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1);
elseif layernum==6%6²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1)+repmat(kmeans5_rate_array(kmeans5index(1),:,kmeans5index(2)),35,1);
elseif layernum==7%7²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1)+repmat(kmeans5_rate_array(kmeans5index(1),:,kmeans5index(2)),35,1)+repmat(kmeans6_rate_array(kmeans6index(1),:,kmeans6index(2)),35,1);
elseif layernum==8%8²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1)+repmat(kmeans5_rate_array(kmeans5index(1),:,kmeans5index(2)),35,1)+repmat(kmeans6_rate_array(kmeans6index(1),:,kmeans6index(2)),35,1)+repmat(kmeans7_rate_array(kmeans7index(1),:,kmeans7index(2)),35,1);
elseif layernum==9%9²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1)+repmat(kmeans5_rate_array(kmeans5index(1),:,kmeans5index(2)),35,1)+repmat(kmeans6_rate_array(kmeans6index(1),:,kmeans6index(2)),35,1)+repmat(kmeans7_rate_array(kmeans7index(1),:,kmeans7index(2)),35,1)+repmat(kmeans8_rate_array(kmeans8index(1),:,kmeans8index(2)),35,1);
elseif layernum==10%10²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1)+repmat(kmeans5_rate_array(kmeans5index(1),:,kmeans5index(2)),35,1)+repmat(kmeans6_rate_array(kmeans6index(1),:,kmeans6index(2)),35,1)+repmat(kmeans7_rate_array(kmeans7index(1),:,kmeans7index(2)),35,1)+repmat(kmeans8_rate_array(kmeans8index(1),:,kmeans8index(2)),35,1)+repmat(kmeans9_rate_array(kmeans9index(1),:,kmeans9index(2)),35,1);   
elseif layernum==11%11²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1)+repmat(kmeans5_rate_array(kmeans5index(1),:,kmeans5index(2)),35,1)+repmat(kmeans6_rate_array(kmeans6index(1),:,kmeans6index(2)),35,1)+repmat(kmeans7_rate_array(kmeans7index(1),:,kmeans7index(2)),35,1)+repmat(kmeans8_rate_array(kmeans8index(1),:,kmeans8index(2)),35,1)+repmat(kmeans9_rate_array(kmeans9index(1),:,kmeans9index(2)),35,1)+repmat(kmeans10_rate_array(kmeans10index(1),:,kmeans10index(2)),35,1);      
elseif layernum==12%12²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1)+repmat(kmeans5_rate_array(kmeans5index(1),:,kmeans5index(2)),35,1)+repmat(kmeans6_rate_array(kmeans6index(1),:,kmeans6index(2)),35,1)+repmat(kmeans7_rate_array(kmeans7index(1),:,kmeans7index(2)),35,1)+repmat(kmeans8_rate_array(kmeans8index(1),:,kmeans8index(2)),35,1)+repmat(kmeans9_rate_array(kmeans9index(1),:,kmeans9index(2)),35,1)+repmat(kmeans10_rate_array(kmeans10index(1),:,kmeans10index(2)),35,1)+repmat(kmeans11_rate_array(kmeans11index(1),:,kmeans11index(2)),35,1);      
elseif layernum==13%13²ã
rate_array=raw_rate_array+repmat(kmeans1_rate_array(kmeans1index(1),:,kmeans1index(2)),35,1)+repmat(kmeans2_rate_array(kmeans2index(1),:,kmeans2index(2)),35,1)+repmat(kmeans3_rate_array(kmeans3index(1),:,kmeans3index(2)),35,1)+repmat(kmeans4_rate_array(kmeans4index(1),:,kmeans4index(2)),35,1)+repmat(kmeans5_rate_array(kmeans5index(1),:,kmeans5index(2)),35,1)+repmat(kmeans6_rate_array(kmeans6index(1),:,kmeans6index(2)),35,1)+repmat(kmeans7_rate_array(kmeans7index(1),:,kmeans7index(2)),35,1)+repmat(kmeans8_rate_array(kmeans8index(1),:,kmeans8index(2)),35,1)+repmat(kmeans9_rate_array(kmeans9index(1),:,kmeans9index(2)),35,1)+repmat(kmeans10_rate_array(kmeans10index(1),:,kmeans10index(2)),35,1)+repmat(kmeans11_rate_array(kmeans11index(1),:,kmeans11index(2)),35,1)+repmat(kmeans12_rate_array(kmeans12index(1),:,kmeans12index(2)),35,1);      
end

kmeans_rate=zeros(35,40);
threshold=floor(layernum/2);
for i=1:35
for j=1:40   
if rate_array(i,j)>threshold
kmeans_rate(i,j)=1;
elseif rate_array(i,j)==threshold
if mod(layernum,2)==0    
kmeans_rate(i,j)=0.5;
end
end
end
end

lrate1=sum(raw_rate_array,2)/40;
sen1=sum(raw_rate_array(:,1:20),2)/20;
spec1=sum(raw_rate_array(:,21:40),2)/20;


lrate=sum(kmeans_rate,2)/40;
sen=sum(kmeans_rate(:,1:20),2)/20;
spec=sum(kmeans_rate(:,21:40),2)/20;

% MCC=zeros(35,1);
% for i=1:35
% MCC(i)=(((sen(i)*spec(i))-(1-spec(i))*(1-sen(i))))/sqrt((sen(i)+(1-spec(i)))*(sen(i)+(1-sen(i)))*(spec(i)+(1-spec(i)))*(spec(i)+(1-sen(i))));
% end
% MCC1=zeros(35,1);
% for i=1:35
% MCC1(i)=(((sen1(i)*spec1(i))-(1-spec1(i))*(1-sen1(i))))/sqrt((sen1(i)+(1-spec1(i)))*(sen1(i)+(1-sen1(i)))*(spec1(i)+(1-spec1(i)))*(spec1(i)+(1-sen1(i))));
% end
% MCC2=zeros(35,1);
% for i=1:35
% MCC2(i)=(((sen2(i)*spec2(i))-(1-spec2(i))*(1-sen2(i))))/sqrt((sen2(i)+(1-spec2(i)))*(sen2(i)+(1-sen2(i)))*(spec2(i)+(1-spec2(i)))*(spec2(i)+(1-sen2(i))));
% end
% MCC3=zeros(35,1);
% for i=1:35
% MCC3(i)=(((sen3(i)*spec3(i))-(1-spec3(i))*(1-sen3(i))))/sqrt((sen3(i)+(1-spec3(i)))*(sen3(i)+(1-sen3(i)))*(spec3(i)+(1-spec3(i)))*(spec3(i)+(1-sen3(i))));
% end
% MCC4=zeros(35,1);
% for i=1:35
% MCC4(i)=(((sen4(i)*spec4(i))-(1-spec4(i))*(1-sen4(i))))/sqrt((sen4(i)+(1-spec4(i)))*(sen4(i)+(1-sen4(i)))*(spec4(i)+(1-spec4(i)))*(spec4(i)+(1-sen4(i))));
% end
% MCC5=zeros(35,1);
% for i=1:35
% MCC5(i)=(((sen5(i)*spec5(i))-(1-spec5(i))*(1-sen5(i))))/sqrt((sen5(i)+(1-spec5(i)))*(sen5(i)+(1-sen5(i)))*(spec5(i)+(1-spec5(i)))*(spec5(i)+(1-sen5(i))));
% end


% core_lrate=zeros(8,6);
% lindex=0;
% for core_num=2:8
% localrate=0;    
% for index=1:core_num
% for i=1:(13-(layernum-1))*26-1
% eval(['tmprate=sum(kmeans',num2str(layernum-1),'_rate_array(i,:,(index+lindex)));']);
% if tmprate>localrate
%     localrate=tmprate;
%     core_lrate(core_num,1)=index;
%     core_lrate(core_num,2)=(13-(layernum-1))*26-i;
%     core_lrate(core_num,3)=localrate/40;
%     eval(['core_lrate(core_num,4)=sum(kmeans',num2str(layernum-1),'_rate_array(i,1:20,(index+lindex)))/20;']);
%     eval(['core_lrate(core_num,5)=sum(kmeans',num2str(layernum-1),'_rate_array(i,21:40,(index+lindex)))/20;']);
%     core_lrate(core_num,6)=MCC_measure(core_lrate(core_num,4),core_lrate(core_num,5));
% end
% end
% end
% lindex=lindex+core_num;
% end


[lrate_layers(repnum),index_layers]=max(lrate);
sen_layers(repnum)=sen(index_layers);
spec_layers(repnum)=spec(index_layers);
end

meanvalue(layernum,1)=sum(lrate_layers)/10;
meanvalue(layernum,2)=sum(sen_layers)/10;
meanvalue(layernum,3)=sum(spec_layers)/10;
meanvalue(layernum,4)=MCC_measure(meanvalue(layernum,2),meanvalue(layernum,3));
end

