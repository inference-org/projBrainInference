# projBrainInference
--------------------

Analysis of how the Human brain uses knowledge of motion direction statistics to improve motion direction inference

Full analysis : http://steevelaquitaine.github.io/projBrainInference/
---------------------------------------------------------------------




[biloadRawSaveInBIproj.m](munging/biloadRawSaveInBIproj.m) : load raw data saved on local computer and save and organize in project "projBrainInference". Raw data are saved in a structure variable "d.mat" composed of "d.instances; d.myRandomDir..."

[biConvmatTocsv.m](munging/biConvmatTocsv.m) : load raw data, extract data saved in structure and save them as independent mat variables, convert each mat variable to .csv files.

[bippcAnalysis00](analyses/bippcAnalysis00.m) : train on uniform prior dataset and test on circular prior dataset (no validation).

[bippcAnalysis01](analyses/bippcAnalysis01.m) :

[bippcAnalysis02](analyses/bippcAnalysis02.m) :

[bippcAnalysis03](analyses/bippcAnalysis03.m) : split uniform prior dataset into train and validation, train on train, validate generalizability and training quality on validate and test on circular prior dataset. The model chooses the split that produces the best model performance in the validation dataset, i.e., that is that minimizes the sum of squared error between the model maximum likelihood direction predictions and the actual directions from the validation dataset.


