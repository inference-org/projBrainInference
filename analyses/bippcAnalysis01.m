
%bippcAnalysis01.m
%
%
% author: steeve laquitaine
%   date: 161101
%purpose: train probabilitic population code model (WJM 2005, NN) 
%         Check how well the model was trained: if training is good 
%         likelihood sorted by predicted stimulus feature (e.g., directions)
%         and averaged over trials should peak at the true stimulus feature
%         (e.g., displayed motion direction)

%setup
%set folder where you cloned project "projBrainInference"
myrootpath = '~/proj/steeve/';
subject = 's25';
prior = 'priorUnif';
roi = 'V1';

%load training dataset
cd([myrootpath 'projBrainInference/data/' subject '/' prior '/' roi])
load instances
load directions

%load trained model
cd([myrootpath 'projBrainInference/analyses/bippcAnalysis00/'  subject '/' prior '/' roi])
load('model')

%Check model training performance 
%i.e., how well the model decodes displayed directions 
%from the trained voxels responses
%scatter plot true vs predicted
LLHs = slvoxppmodelTest(instances,model.W_tr,model.rho_tr,model.tau_tr,model.sigma_tr,model);

%plot
slppmodelPlotDecodedLLHs(LLHs,directions,model,'V1','priorUnif');




