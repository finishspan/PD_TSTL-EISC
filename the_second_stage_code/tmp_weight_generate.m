
function weight=tmp_weight_generate(tmptrain)
data=zeros(36,338);
data(1:18,:)=tmptrain(1:18,:);
data(19:36,:)=tmptrain(21:38,:);
[weight, g_numbertotal] = weighted(18,18,data');

