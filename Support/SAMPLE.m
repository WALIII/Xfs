

% Sample Scripts


% PLOT one of the entire bout's worth of data
cell = 18; % sample cell
trial = 1; % sample trial
figure(); 

hold on;
plot(c_final{trial}(:,cell)','b'); 
plot(GG_final{trial}(:,cell)-min(GG_final{trial}(:,cell)),'r');
plot(zscore(sp_final{trial}(:,cell))','b');

% Plot some trial aligned data:
figure(); 
hold on; 
for i= 16 
    plot(aligned_ROIs(1:10,:,i)'+i*10,'r');
    plot(foopsi_ROIs(2:10,:,i)'+i*10,'g'); 
    plot(zscore(mean(sp_ROIs(:,:,i)))'+i*10,'b'); 
end

