


%biloadRawSaveInBIproj.m
%
%
%
% author : steeve laquitaine
%purpose : load raw data saved on local computer and save and organize in
%          project "projBrainInference"
%          raw data is a structure variable d.mat composed of
%
%          d
%            d.instances   : Ni instances by Nv voxels of voxels responses
%                            to stimulus presentation
%            d.myRandomDir : Ni displayed motion directions
%            d.myRandomCoh : Ni displayed motion coherences
%            d.mySwitch    : Ni labels for each instance: '1': switch to prior
%                            '- 2' switch to direction - '-1': prior mean is displayed - '0':
%                             subject response is missing
%            d.stimvols    : timestamp when stimulus volume is acquired by
%                            the scanner (need checking)
%
%usage : 
%     %set subject id, prior and roi  
%     subject = 's25';
%     prior = 'prior225';
%     roi = 'V1';
% 
%     %set raw file and path path in which "projBrainInference" project was
%     %cloned
%     rawfile = ['~/data/datafMRI/sltaskdotdirfmri05/slStckAnalyses/Concatenation/classif/' subject '/' prior '/myRandomCoh/accAtTimeleaveOneOutfisherbalancByRemovI/' roi '/d.mat'];
%     birootpath = '~/proj/steeve/';
%     
%     %save and organize data in project "projBrainInference" 
%     biloadRawSaveInBIproj(rawfile,birootpath,subject,prior,roi)


function biloadRawSaveInBIproj(rawfile,birootpath,subject,prior,roi)

%load raw data on local computer
load(rawfile)

%save and organized in project "projBrainInference"
mkdir([birootpath 'projBrainInference/data/' subject '/' prior '/' roi '/'])
save([birootpath 'projBrainInference/data/' subject '/' prior '/' roi '/data.mat'],'d')
