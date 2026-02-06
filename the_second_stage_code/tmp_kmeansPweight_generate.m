
function weight=tmp_kmeansPweight_generate(tmptrain,Pnum)
data=zeros(36,26*Pnum);
data(1:18,:)=tmptrain(1:18,:);
data(19:36,:)=tmptrain(21:38,:);
[weight, g_numbertotal] = weighted(18,18,data');

