%% Falling Dataset Labeling
clear all; close all; clc
Path = '/Users/James/Desktop/Duke/Class/Fall 2020/Biomedical DS/ARS DLR Data Set/ARS_DLR_DataSet.mat';
Data = struct2cell(load(Path, '-mat')); 
Out = [];
Out_unmod = [];
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
Vec(Data{jj}{4}(startInd):Data{jj}{4}(stopInd)) = 1;
else
end
Vec = logical(Vec);
%%%

for i = 2:10
% Regularize Variables
% Data{jj}{1}(:,i) = (Data{jj}{1}(:,i) - mean(Data{jj}{1}(:,i)));
Data{jj}{5}(:,i) = (Data{jj}{1}(:,i).*Data{jj}{2}(:,i));
end
Out_unmod = [Out_unmod;[Data{jj}{1} ,Vec]];
Out = [Out;[Data{jj}{5} ,Vec]];

end
 T = array2table(Out_unmod,...
    'VariableNames',{'Time','accX','accY','accZ','angX','angY','angZ','maxX','magY','magZ','Target'});
[len col] = size(T);
Tout2 = T(round(len/2):end,:);
Tout = T(1:round(len/2)-1,:);
filePath1 = fullfile(pwd,'Fall_Data1.csv');
filePath2 = fullfile(pwd,'Fall_Data2.csv');

writetable(Tout,filePath1)
writetable(Tout2,filePath2)
% figure()
% ind1 = Out(:,11) ==1;
% ind2 = Out_unmod(:,11) ==1;
% x = 1:(length(Out(:,2)));
% plot(Out_unmod(:,2))
% title('unmodified')
% hold on
% scatter(x(ind1),Out_unmod(ind1,2),'k')
% 
% figure()
% plot(Out(:,2))
% title('modified')
% hold on
% scatter(x(ind1),Out(ind1,2),'k')
