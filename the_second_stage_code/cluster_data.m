
train_data=importdata('../data/train_data.txt');
re_data=zeros(520,26);
for i=1:40
    re_data(1+13*(i-1):3+13*(i-1),:)=train_data(11+26*(i-1):13+26*(i-1),2:27);
    re_data(4+13*(i-1):13+13*(i-1),:)=train_data(1+26*(i-1):10+26*(i-1),2:27);
end

for repnum=1:10
rng(repnum,'v4');    

for layernum=1:12
    train_data_cluster=[];
for i=1:40
    data=re_data(1+13*(i-1):13+13*(i-1),:);
    [Idx,data1]=kmeans(data,13-layernum);
    train_data_cluster=[train_data_cluster;data1];
end
save(['train_data_cluster' num2str(layernum) '_rep' num2str(repnum)], 'train_data_cluster');
end
end