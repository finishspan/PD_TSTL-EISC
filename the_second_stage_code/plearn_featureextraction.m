function srate=plearn_featureextraction()
% example of feature extraction - runs the same function as for training: convsparseF with
% only one main iteration and no kernel optimization

%% load data and set parameters
%load  out_mesto_4
Binput=importdata('train_data.txt');
Binput1=mapminmax(Binput',0,1);
Binput2=Binput1';
for i=1:40
traindata(1+26*(i-1):26+26*(i-1),:)=localnormalize(Binput2(1+26*(i-1):26+26*(i-1),2:27),4,4);
end

for findex=1:40
nexp = 1; % experiment number
q = 40; % figures to display results
method = -4; % for feature extraction we could use any of 0,-1,-2,-3,-4 (all these are equivalent)

%image = double(rgb2gray(squeeze(im(:,:,1,:))))/65535; % let us try the first image
% in this example we use grayscale but we could use RGB, which would work layer-wise:
% image = double((squeeze(im(:,:,1,:))))/65535; 
%image = localnormalize(image,4,4);
image = traindata(1+26*(findex-1):26+26*(findex-1),:);
load(['example_trainingresults_' num2str(nexp)],'H'); % loads variable 'H'
K = {[8 32 64]}; % number of kernels for each scale (for one scale simply K = {8})

iters.maxiter_main = 1; % one main iteration
iters.maxiter_A = 100; % max number of iterations in the minAstep
iters.maxiter_H = 0; % no iterations in the minHstep
iters.showims = false;

tic;[Un, A, ~, report2_0] = convsparseF(image,H,0,iters);toc % Ours
%tic;[Un, A, ~, report2_2] = convsparseF(image,H,2,iters);toc % Bristow
%tic;[Un, A, ~, report2_3] = convsparseF(image,H,3,iters);toc % CG
new_train(1+26*(findex-1):26+26*(findex-1),:)=A(:,:,1);
end

%new_train(1+26*(index-1):26+26*(index-1),:)=[];

rate=0;

for index=1:40
trainlabel=Binput(:,29);    
testlabel=trainlabel(1+26*(index-1):26+26*(index-1));
trainlabel(1+26*(index-1):26+26*(index-1))=[];
trainpart=new_train;
trainpart1=mapminmax(trainpart',0,1);
trainpart2=trainpart1';
testpart=trainpart2(1+26*(index-1):26+26*(index-1),:);
trainpart2(1+26*(index-1):26+26*(index-1),:)=[];

model_pre=svmtrain(trainlabel,trainpart2,'-s 0 -t 2 -c 35 -g 15'); %建立SVR模型
%model_pre=svmtrain(trainlabel,trainpart2,'-s 0 -t 0'); %建立SVR模型
[prey, mse, ~] = svmpredict(testlabel,testpart,model_pre);
tcun=mse(1)/100;

if tcun>=0.5
rate=rate+1;
else
rate=rate+0;    
end
%end

srate=rate/40;
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

