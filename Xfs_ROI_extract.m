function [aligned_ROIs, foopsi_ROIs, sp_ROIs, GG_final, c_final,sp_final] = Xfs_ROI_extract(template,roi_ave)
% Xfs_ROI_extract.m

% WAL3
% d050317

% Params
fs = 48000;
trial  = 1;

 FrameIgnore = 10;

for  i = 1:size(roi_ave.analogIO_dat,2) % for all trials
    

f= roi_ave.interp_time{i};
[song_start, song_end, score_d] = find_audio(roi_ave.analogIO_dat{i}, template, fs, 'match_single', false,'constrain_length', 0.25);


if isempty(song_start) == 1;
    break
else
    disp('songs identified, extracting...')
end


% Format data
    disp('Formatting Data');
for  cell = 1:size(roi_ave.interp_dff,1);
GG{i}(:,cell) = tsmovavg(roi_ave.interp_raw{cell,i},'s',2,2);
try
[c{i}(:,cell),b,c1,g,sn,sp{i}(:,cell)] = constrained_foopsi(GG{i}(FrameIgnore:end,cell)-min(GG{i}(FrameIgnore:end,cell)));
catch
    disp('?')
end
end

% extract trials
    disp('Extracting Data');
for ii = 1:size(song_start,2);
    
    %EXTRACT SONG TRIALS
val = song_start(ii); %value to find
tmp = abs(f-val);
[idx idx] = min(tmp); %index of closest value
closest = idx-15; %closest value

closest2 = closest+round(size(template,1)/fs*30+30);


for cell = 1:size(roi_ave.interp_dff,1); % extract for all cells
GGfinal(trial,:,cell) = (GG{i}(closest:closest2,cell))-min(GG{i}(closest:closest2,cell));
GGfinal_foopsi(trial,:,cell) = (c{i}(closest-FrameIgnore:closest2-FrameIgnore,cell))-min(c{i}(closest-FrameIgnore:closest2-FrameIgnore,cell));
GGfinal_sp(trial,:,cell) = (sp{i}(closest-FrameIgnore:closest2-FrameIgnore,cell))-min(sp{i}(closest-FrameIgnore:closest2-FrameIgnore,cell));
end
trial = trial+1; % increase trial number

end



end

    disp('Saving Data');
aligned_ROIs = GGfinal;
foopsi_ROIs = GGfinal_foopsi;
sp_ROIs = GGfinal_sp;
GG_final = GG;
c_final = c;
sp_final = sp;


