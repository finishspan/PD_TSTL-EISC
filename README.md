PD_TSTL&EISC: envelope two-stage convolutional sparse transfer Learning Algorithm for PD Speech Recognition
Xiaoheng Zhang, Yongming Li, Pin Wang, Oumei Cheng, Yu Han
we propose the PD_TSTL & EISC algorithm to address the few-shot problem in Parkinson's speech by leveraging convolutional sparse transfer learning and envelope instance construction.

###################data_code_description###################################################### 1、data/

Ainput.mat : Source domain feature data files

self_GK_data.mat: Intermediate dataset 1 feature data file

paralysis_traindata.mat: Intermediate dataset 2 feature data file

polyp_traindata.mat: Intermediate dataset 3 feature data file

train_data.txt: Target domain dataset

data/convolutional_kernels/ Trained multiple convolution kernels（Line 7 of the file ‘result_xinan.m’ is the convolution kernel training function ‘plearn_trainkernels’）

data/deep_space/: Deep instance space data

data/result/: Intermediate result data

data/result/optimal_kernels_index/ Optimal convolution kernel index file

data/result/original_layer(layer0)/ Original layer instance data

data/result/layer1-12_for_intermedia_dataset1/ 1-12 layer intermediate results of instance space based on intermediate set 1

data/result/layer1-12_for_intermedia_datase2/ 1-12 layer intermediate results of instance space based on intermediate set 2

data/result/layer1-12_for_intermedia_dataset3/ 1-12 layer intermediate results of instance space based on intermediate set 3

2、the_first_stage_code/

result_xinan.m-> seqindex_xinan.m: The output is the optimal convolution kernel index based on the intermediate set 1

result_paralysis.m-> seqindex_paralysis.m: The output is the optimal convolution kernel index based on the intermediate set 2

result_ polyp.m-> seqindex_polyp.m: The output is the optimal convolution kernel index based on the intermediate set 3

3、the_second_stage_code/

Execution order: cluster_data.m-> disc_test.m-> cluster_test.m

cluster_data.m : Generate deep instance space data

disc_test.m: Generate intermediate results of the deep instance space

cluster_test.m: Output accuracy, sensitivity, specificity, MCC and other final results