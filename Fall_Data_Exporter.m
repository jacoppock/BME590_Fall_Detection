%% Falling Dataset Labeling
Path = '/Users/James/Desktop/Duke/Class/Fall 2020/Biomedical DS/ARS DLR Data Set/ARS_DLR_DataSet.mat';
Data = struct2cell(load(Path, '-mat')); 
Out = [];
 for jj = 1:length(Data)
 Vec = zeros(length(Data{jj}{1}),1);
 startInd = [];
 stopInd = [];
 for ii = 1:length(Data{jj}{3})
     if strcmp(Data{jj}{3}{ii},'FALLING')
         disp(['found a fall'])
         startInd = ii*2;
         stopInd = (ii*2)+1;
     else
     end
 end
if ~isempty(startInd)
Vec(startInd:stopInd) = 1;
else
end
Vec = logical(Vec);
%%%
for i = 2:10
% Regularize Variables
Data{jj}{1}(:,i) = (Data{jj}{1}(:,i) - mean(Data{jj}{1}(:,i)));
end
Out = [Out;[Data{jj}{1} ,Vec]];

end
 T = array2table(Out,...
    'VariableNames',{'Time','accX','accY','accZ','angX','angY','angZ','maxX','magY','magZ','Target'});
[len col] = size(T);
% Tout2 = T(round(len/2):end,:);
% Tout = T(1:round(len/2)-1,:);
filePath1 = fullfile(pwd,'Fall_Data.csv');

writetable(T,filePath1)
writetable(Tout2,filePath2)