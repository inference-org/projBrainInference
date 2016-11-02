
%bippcAnalysis00.m
%
%
% author: steeve laquitaine
%purpose: train and test probabilitic population code model (WJM 2005, NN) 
%         Train on uniform prior dataset 
%         Test on circular priors (e.g., 225 or 135)
%
%         Test whether decoded likelihoods are biased toward circular prior
%         means ?
%         bimodal ?
        
%setup
%set folder where you cloned project "projBrainInference"
myrootpath = '~/proj/steeve/';
subject = 's25';
prior = 'priorUnif';
roi = 'V1';

% set train (uniform prior) and test (prior 225) datasets
%move to data path, load Ni instances x Nv voxels instances data to 
%decode from and associated Ni directions which the model is trained 
%to decode. Instances are balanced across directions because prior is 
%uniform thus dataset is not skewed and need no balancing
cd([myrootpath 'projBrainInference/data/' subject '/' prior '/' roi])
load instances
load directions

% ------------------------  TRAIN ------------------------------

%1st step train encoding channels 
%hypothetized sinewave channels (no noise)
%K channels x 360 hypothetical directions space
model.phi_k = unique(directions);
model.exponent = 4;
model = slsimPPchannels(0,model);
%average channel responses to stimulus directions
%Ni instances x 8 channels
C = model.f_k_s(:,directions)';
b_train = instances;
model.W_tr = sltrainPPmodel(b_train,C);

%2nd step : train the model's noise parameters
[rho_tr,tau_tr,sigma_tr,nglogl] = sltrainPPmodelStep2(b_train,directions,model.f_k_s,model.W_tr);

%save model
model.rho_tr = rho_tr; model.tau_tr = tau_tr; model.sigma_tr = sigma_tr;
model.nglogl = nglogl;
mkdir([myrootpath 'projBrainInference/analyses/bippcAnalysis00/'  subject '/' prior '/' roi])
cd([myrootpath 'projBrainInference/analyses/bippcAnalysis00/'  subject '/' prior '/' roi])
save('model','model')

%%  ------------------------  TEST ------------------------------
clear;
load('model')

%setup
myrootpath = '~/proj/steeve/';
subject = 's25';
prior = 'prior225';
roi = 'V1';

%load test dataset
cd([myrootpath 'projBrainInference/data/' subject '/' prior '/' roi])
load instances
load directions

%decode likelihoods
b_test = instances;
directions_test = directions;
LLHs = slvoxppmodelTest(b_test,model.W_tr,model.rho_tr,model.tau_tr,model.sigma_tr,model);

%plot likelihoods
slppmodelPlotDecodedLLHs(LLHs,directions_test,model,'V1','priorUnif')


