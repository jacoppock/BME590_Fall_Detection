%% Falling Dataset Labeling
Out = [];
 for jj = 1:length(Data)

 Data = [{Dat1},{Dat2},{Dat3}];

 Vec = zeros(length(Data{jj}{1}),1);
 for ii = 1:length(Data{jj}{3})
     if strcmp(Data{jj}{3}{ii},'FALLING')
         disp(['found a fall'])
         startInd = ii*2;
         stopInd = (ii*2)+1;
     else
     end
 end
 Vec(startInd:stopInd) = 1;
 
Vec = logical(Vec);

Out = [Out;[Data{jj}{1} ,Vec]];
end
 T = array2table(Out,...
    'VariableNames',{'Time','accX','accY','accZ','angX','angY','angZ','maxX','magY','magZ','Target'});
filePath = fullfile(pwd,'Fall_Data.xlsx');
writetable(T,filePath)