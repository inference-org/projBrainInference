
%biConvmatTocsv.m
%
%
% author: steeve laquitaine
%purpose: load raw data, extract data saved in structure and save them as
%         independent mat variables, convert each mat variable to .csv files
%
%input : 
%
%   myrootpath : folder where you cloned projBrainInference
%      subject : subject sid e.g., s24, s25, s323, s327, s357
%          roi : brain region: e.g., 'V1', 'V2', etc.,
%
%dependencies :
%
%   the code requires "slDataMunging" code library
%   git clone https://github.com/steevelaquitaine/sldataMunging.git
%
%
%
%usage :
%
%       %set subject id, prior and roi 
%       clear
%       subject = 's25';
%       prior = 'prior135';
%       roi = 'V1'; 
% 
%       %set raw file and path path in which "projBrainInference" project was
%       %cloned
%       rawfile = ['~/data/datafMRI/sltaskdotdirfmri05/slStckAnalyses/Concatenation/classif/' subject '/' prior '/myRandomCoh/accAtTimeleaveOneOutfisherbalancByRemovI/' roi '/d.mat']; 
%       birootpath = '~/proj/steeve/';
%         
%       %save and organize data in project "projBrainInference"
%       biloadRawSaveInBIproj(rawfile,birootpath,subject,prior,roi)
% 
%       %munge
%       biConvmatTocsv(birootpath,subject,prior,roi)


function biConvmatTocsv(myrootpath,subject,prior,roi)

%load raw data
cd([myrootpath 'projBrainInference/data/' subject '/' prior '/' roi]) 
load('data.mat')

%sort raw data from structure to variable in 
%separate.mat files
instances = d.instances; save('instances','instances')
directions = d.myRandomDir; save('directions','directions')
coherences = d.myRandomCoh; save('coherences','coherences')
switching = d.mySwitch; save('switching','switching')

%save each separate variable in a separate .csv files
slconvMatToCsv(d.instances,'instances')
slconvMatToCsv(d.myRandomDir,'directions')
slconvMatToCsv(d.myRandomCoh,'coherences')
slconvMatToCsv(d.mySwitch,'switching')



