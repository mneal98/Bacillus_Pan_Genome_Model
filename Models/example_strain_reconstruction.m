pan_model=importdata('pan_model.mat');
rxn_strain_matrix=importdata('rxn_strain_matrix.mat');
strain_list=importdata('strain_list.mat');

%to reconstruct a strain specific model, identify its column of the rxn to
%strain association matrix, then remove the rxns associated with zeros in
%this binary vector.

%suppose you are interested in strain 30VD-1, linked to identifier
%GCF_004366695_1 in supplementary file S1:
idx=find(strcmp(strain_list,'GCF_004366695_1'));
rxn_presence=rxn_strain_matrix(:,idx);
absent=rxn_presence==0;
model_30VD1=removeRxns(pan_model,pan_model.rxns(absent));

%confirm that it runs:
FBA=optimizeCbModel(model_30VD1)
