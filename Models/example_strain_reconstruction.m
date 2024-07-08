pan_model = importdata('pan_model.mat');
rxn_strain_matrix = importdata('rxn_strain_matrix.mat');
strain_list = importdata('strain_list.mat');

%to reconstruct a strain specific model, identify its column of the rxn to
%strain association matrix, then remove the rxns associated with zeros in
%this binary vector.

%suppose you are interested in strain 30VD-1, linked to identifier
%GCF_004366695_1 in supplementary file S1:
%find where it is in the list of strains
idx = find(strcmp(strain_list,'GCF_004366695_1'));

%identify which reactions it can perform
rxn_presence = rxn_strain_matrix(:,idx);
%invert to find which reactions it cannot perform
absent = rxn_presence==0;
%then remove them
model_30VD1=removeRxns(pan_model,pan_model.rxns(absent));

%confirm that it runs:
FBA=optimizeCbModel(model_30VD1)
