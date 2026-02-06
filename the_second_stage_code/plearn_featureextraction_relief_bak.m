function [srate,srate1,srate2,raw_rate]=plearn_featureextraction_relief_bak(core_num,nexp,dim)
% example of feature extraction - runs the same function as for training: convsparseF with
% only one main iteration and no kernel optimization

%% load data and set parameters
%load  out_mesto_4
Binput=importdata('train_data.txt');
Binput1=mapminmax(Binput',0,1);
Binput2=Binput1';
Binput3=zeros(520,26);

%load xinan_weight_index_code
%load xinan_weight_array_index 
%load meanxinan_weight 
for i=1:40
Binput3(1+13*(i-1):3+13*(i-1),:)=Binput2(11+26*(i-1):13+26*(i-1),2:27);
Binput3(4+13*(i-1):13+13*(i-1),:)=Binput2(1+26*(i-1):10+26*(i-1),2:27);
end

for i=1:40
traindata(1+13*(i-1):13+13*(i-1),:)=localnormalize(Binput3(1+13*(i-1):13+13*(i-1),:),4,4);
end

for findex=1:40
%nexp = 3; % experiment number
q = 40; % figures to display results
method = -4; % for feature extraction we could use any of 0,-1,-2,-3,-4 (all these are equivalent)

%image = double(rgb2gray(squeeze(im(:,:,1,:))))/65535; % let us try the first image
% in this example we use grayscale but we could use RGB, which would work layer-wise:
% image = double((squeeze(im(:,:,1,:))))/65535; 
%image = localnormalize(image,4,4);
image = traindata(1+13*(findex-1):13+13*(findex-1),:);
load(['fast_trainingresults_' num2str(core_num) '_' num2str(nexp)],'H'); % loads variable 'H'
K = {[8 32 64]}; % number of kernels for each scale (for one scale simply K = {8})

iters.maxiter_main = 1; % one main iteration
iters.maxiter_A = 100; % max number of iterations in the minAstep
iters.maxiter_H = 0; % no iterations in the minHstep
iters.showims = false;

%tic;
[Un, A, ~, report2_0] = convsparseFF(image,H,0,iters);
%toc % Ours
%tic;[Un, A, ~, report2_2] = convsparseF(image,H,2,iters);toc % Bristow
%tic;[Un, A, ~, report2_3] = convsparseF(image,H,3,iters);toc % CG
new_train(1+13*(findex-1):13+13*(findex-1),:)=A(:,:,dim);
end

%new_train(1+26*(index-1):26+26*(index-1),:)=[];
%[fs_weight3,Swarry,Sbarry,Starry]=weight_generate_inv(new_train,Binput);
%seqindex=[11:20;31:40];
%seqindex=[1:10;21:30];
trainpart=[];
trainlabel=[];
for i=1:40
    %ll=seqindex(i);
    trainpart=[trainpart;reshape(new_train(1+(i-1)*13:13+(i-1)*13,:)',1,338)];    
    trainlabel=[trainlabel;Binput(1+(i-1)*26,29)];
end
trainhebin=[trainpart,trainlabel];
% 第一步：对原始基因表达谱数据归一化。方法：（样本－样本均值）/样本方差。同时计算每类样本的个数。
[stand_trainpart,~,~] = standardization ( trainhebin',26 );
%stand_trainpart(isnan(stand_trainpart))=0;


srate=zeros(1,337);
srate1=zeros(1,337);
srate2=zeros(1,337);
%uuu=randperm(337);
raw_rate=zeros(337,40);
xinan_weight=zeros(40,338);
for index=1:40   
tmptrain=stand_trainpart';
tmptrain(index,:)=[];
xinan_weight(index,:)=tmp_weight_generate(tmptrain);
end

for j=1:(26*13-1)
rate=0;   
rate1=0; 
rate2=0; 
for index=1:40   
[w_a,w_b]=sort(xinan_weight(index,:));
%vindex=uuu(1:j);
vindex=w_b(1:j); 
trainpart1=stand_trainpart';
trainpart1(:,vindex)=[];
testpart=trainpart1(index,:);
trainpart1(index,:)=[];
trainlabel1=trainlabel;
testlabel=trainlabel1(index);
trainlabel1(index)=[];
%model_pre=svmtrain(trainlabel1,trainpart1,'-s 0 -t 2 -c 35 -g 15'); %建立SVR模型
%% raw fun
model_pre=svmtrain(trainlabel1,trainpart1,'-s 0 -t 0'); %建立SVR模型
[prey, mse, ~] = svmpredict(testlabel,testpart,model_pre);
tcun=mse(1)/100;

%% TCA fun
% Init_options.lambda=0.001;  %选择规范化参数            
% Init_options.dim=dim;  %选择维度                  
% Init_options.kernel_type='rbf';  %选择核函数  
% Init_options.gamma=162;  %  rbf核函数 带宽选择           
% Init_options.T=1; 
% 
% [X_src_new,X_tar_new,~] = TCA(trainpart1,testpart,Init_options);
% model_pre=svmtrain(trainlabel1,X_src_new,'-s 0 -t 0'); %建立SVR模型
% [prey, mse, ~] = svmpredict(testlabel,X_tar_new,model_pre);
% tcun=mse(1)/100;
%%    
if tcun>=0.5
rate=rate+1;
if testlabel==1
rate1=rate1+1;  
else 
rate2=rate2+1;    
end
raw_rate(j,index)=1;
else
rate=rate+0;
if testlabel==1
rate1=rate1+0;
else 
rate2=rate2+0;    
end
raw_rate(j,index)=0;
end
%end
end
srate(j)=rate/40;
srate1(j)=rate1/20;
srate2(j)=rate2/20;
end
%% show results
% figure(q+1);imshow(image);title('Locally normalized image');
% figure(q+2);imshow(Un);title('Image obtained from convolutional sparse model');
% mapn = 10; % show feature map 10 but we could take any ...
% figure(q+3);imshow(abs(squeeze(A(:,:,mapn,:)))./max(max(max(abs(A(:,:,mapn,:))))));title(['Feature map n. ' num2str(mapn)]); 

%% Time of feature extraction 
% figure(q+6); 
% x = 1:iters.maxiter_A;
% plot(...%x,report2_3.timeit_A,'k:',...     %barvy: b,r,g,k,m,y,k
%         ...%x,report2_2.timeit_A,'b--',...
%         x,report2_0.timeit_A,'r-.',...
%         'linewidth',2);
% xlabel('Number of iterations');
% ylabel(['Computation time [s]']);
% title('Time of feature extraction')
% % legend('Zeiler et al. [21]','Bristow et al. [23]','Proposed','Location','NorthWest');
% % saveas(q+6,['time2iters' '.fig']);
% %print( q+6, ['time2iters' '.eps'], '-deps2c', '-tiff' );
% %eps2pdf(['time2iters' '.eps'],'c:\program files\gs\gs9.10\bin\gswin64c.exe');

