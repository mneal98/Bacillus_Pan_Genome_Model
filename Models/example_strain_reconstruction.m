pan_model=importdata('pan_model.mat');
rxn_strain_matrix=importdata('rxn_strain_matrix.mat');
strain_list=importdata('strain_list.mat');

%to reconstruct a strain specific model, identify its column of the rxn to
%strain association matrix, then remove the rxns associated with zeros in
%this binary vector.

%suppose you are interested in strain TH016, linked to identifier
%GCF_016411905_1:
idx=find(strcmp(strain_list,'GCF_016411905_1'));
rxn_presence=rxn_strain_matrix(:,idx);
absent=rxn_presence==0;
TH016_model=removeRxns(pan_model,pan_model.rxns(absent));

