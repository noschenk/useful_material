####################
#
# README
#
####################
# this is the first upload of my script written to convert Bionano Optical Mapping .xmap output to a .bed file usable as input to ALLMAPS.
# please use it as a raw script, but feel free to change anything and let me know your inputs.
# ----------------------------------------------------------------------------------------------------------------------------------------

# coding: utf-8

# # Convert .xmap to .bed for ALLMAPS

# This script explains how to convert a Bionano .xmap file to .bed file which is suitable for input to ALLMAPS. I struggeled a lot to find a corresponding script and I found it hard to find information on the Bionano ouput. That's why this file explains step by step. For those who just want the job to be done, there is the file `xmap2allmaps.py`.
# 
# The **.xmap** file contains following columns : 
# 
# - #h XmapEntryID : the ID of the current row
# - QryContigID : The ID of the NGS Contig. Which Contig name corresponds to which ID is specified somewhere in the Bionano output files. (In my case the file had 'keys in its name.
# - RefContigID : The Super_Scaffold name/number
# - QryStartPos : where the NGS contig starts to match an optical mapping pseudomolecule
# - QryEndPos : where the NGS contig ends to match an optical mapping pseudomolecule
# - RefStartPos : where on the pseudomolecule the matching starts
# - RefEndPos : where on the pseudomolecule the matching stops
# - Orientation : the Orientation of the NGS Contig
# - Confidence : a confidence score
# - HitEnum, QryLen, RefLen, LabelChannel, Alignment can be deleted, they do not contain information which belongs into the .bed file.
# 
# My input files are named 'ngsbased.xmap' and 'names.txt'. There were several .xmap files in my Bionano ouptput, I work with the one from NGS. It rather has something like 'NGS' than 'BNG' in its name. 'NGS' : 'Next generation sequencing', 'BNG' : 'Bionano Genomics'
# 
# 'names.txt' contains information on all Contigs, not just the ones used for optical mapping, so this list can be much longer than the xmap file.

# In[74]:


import pandas as pd
import numpy as np
data = pd.read_table("ngsbased.xmap", header=8) # my header was 8 rows, It is not needed for conversion
names = pd.read_table("names.txt")


# In[75]:


data.head()


# In[76]:


names.head()


# Delete unneeded columns and rows.

# In[77]:


data = data.drop(['Alignment', 'HitEnum', 'QryLen', 'RefLen', 'LabelChannel'], axis=1)
data = data.drop(data.index[0]) # delete row 0


# The .bed file can not contain floats, they need to be rounded and changed to type 'integer'.

# In[78]:


data[['QryStartPos', 'QryEndPos','RefStartPos','RefEndPos']] = data.loc[:,['QryStartPos', 'QryEndPos','RefStartPos','RefEndPos']].astype('float')#.astype('int')
# round the columns before converting to int
# change : take out QryStartPos and End Pos as this can be a float
data[['RefStartPos','RefEndPos']] = np.ceil(data[['RefStartPos','RefEndPos']]).astype('int')
data.dtypes # shows all types occurring in the data frame column wise


# Rename contig Id column so it matches first column of 'names'.

# In[79]:


if(data.columns[2] == 'RefContigID'):
    data = data.rename(index=str,columns={data.columns[2] : 'CompntId'})


# Change Name column of data to int so it can be merged to names.

# In[80]:


data[['CompntId']] = data[['CompntId']].astype('int')


# Merge data and names dataframes.

# In[81]:


data = names.merge(data, on='CompntId')
data.head()


# ## Create bedfile
# Start creating columns of the new bed file named 'bed'.

# In[82]:


bed = pd.DataFrame(data['CompntName'])
# change start to reference (NGS) start position
bed['start'] = data['RefStartPos']
bed['end'] = data['RefEndPos']
bed['name'] = "SuperScaffold" + data['QryContigID'] + ":" + data['QryStartPos'].astype(str)
bed['score'] = data['Confidence']
bed['orientation'] = data['Orientation']


# In[83]:


bed.head()


# # change : if I take the RefStart and RefEnd positions, + and - strands are well formatted already.

# In[84]:


#new = bed[bed.orientation == '-']


# For rows with orientation -, the start and end positions are swapped. In the .bed file, start and end position must be ascending.

# In[85]:


#new = bed[bed.orientation == '-']
#new = new[['CompntName', 'end', 'start', 'name', 'score', 'orientation']]
#new.rename(columns={'end':'start', 'start':'end'}, inplace=True)
#bed[bed.orientation == '-'] = new


# The .bed file table is ready now, it only needs to be printed to a tab-delimined file now.

# In[86]:


bed.to_csv('bionano.bed', sep='\t', header=False, index=False)


# # Avoid bugs
# There have been several issues I have met during reformatting of the files. I will list them here in case you adapt the script for your own purposes:
# 
# - The name column (column 4 in the .bed file) consists of a name and a location. The name can not contain any underlines \_ , dashes - or points, the only special character allowed is ':'. E.g. don't change the name to 'Super_Scaffold_11:17683' but leave it like 'SuperScaffold11:17683'.
# Especially the dashes, because in the merged bed file (in case the optical mapping data is merged with another map data), the name will change to 'nameofmap-SuperScaffold11:17683' and if there is an additional dash - like 'nameofmap-SuperScaffold-11:17683', ALLMAPS will interpret 11:17683 as a location. The resulting Scaffolding output will then not contain any information of this map.
# 
# - make sure the 'CompntName' in the .bed file matches the Sequence names in the .fasta file you will feed into ALLMAPS.
# - make sure the .bed file is tab-delimined
# - if you have any other maps, like genetic maps, make sure the Linkage group names do not contain any special character like 'L.1', instead change the name to something like 'L1'.
# - getting an error like 'AttributeError: 'ScaffoldOO' object has no attribute 'object'' means there is something wrong with the names, in my case I had special characters at the wrong places in my .bed file.
# - I compared the [sample .bed file](https://figshare.com/articles/ALLMAPS_supporting_data_Medicago_genome_assembly/1057745) a lot with my own, in case you have more problems with conversion, this might help you as well. 
