# Xfs
Freedomscope Analysis Pipeline for the Directed/Undirected project

requires the following packages:

FinchScope

Find-audio


## Main pre-processing functions

# Pre-flight
Clean ROIs based on a few criteria


## Pre-Usage

1. Parse .mov files ( same procedure as described in Finchscope protocol)

```
>> FS_AV_Parse
```

2. Enter the MAT folder, and run max projection. Create a ROI_map.tif with ImageJ

```
>> FS_DFF_STD_Image
```

3. Annotate, then extract ROIs, and load in a song template.

```
>> FS_annotate_image('ROI_map.tif')
% Load in 'ROI', and run in mat folder
>> FS_plot_ROI(ROI);
% Load in template:
>> FS_TemplateMatch % can abort function once a song is selected
```

# Main Usage:

4. Move/separate data. Extract songs

```
% Load in directed/undirected index ( in context_index.m)
>> FS_Move(directed, undirected, type)
% index into one of the folders:
>> cd(directed);
>> [DAT_d] = Xfs_ROI_extract(template,roi_ave)
>> cd ..
>> cd(undirected)
>> [DAT_u] = Xfs_ROI_extract(template,roi_ave)
```

5. QUALITY CONTROL/ Pre-flight

simple visuals can be found in SAMPLE.m



6. ANALYSIS
