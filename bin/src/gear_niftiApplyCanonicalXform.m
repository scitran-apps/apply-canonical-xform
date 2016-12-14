function gear_niftiApplyCanonicalXform( niFile, outDir, canXform, phaseDir,outName )
% Gear version of niftiApplyCannonicalXform.
%
%   Read NIfTI file
%   Apply CanXForm
%   Write NIfTI file
%
% COMPILE:
%   git clone https://github.com/vistalab/vistasoft
%   mcc -m gear_niftiApplyCanonicalXform.m -I vistasoft
%

%% Read file and do sanity checks
ni = niftiRead(niFile);

if(~exist('canXform','var') || isempty(canXform))
    canXform = mrAnatComputeCannonicalXformFromDicomXform(ni.qto_xyz, ni.dim(1:3));
end

if(exist('phaseDir','var') && ~isempty(phaseDir))
    ni.phase_dim = phaseDir;
else
    phaseDir = [];
end

if(~exist('outDir','var') || isempty(outDir))
    outDir = '/flywheel/v0/output';
end


%% Apply xForm
ni = niftiApplyCannonicalXform(ni, canXform, phaseDir);


%% File output
if (~exist('outName','var') || isempty(outName))
    [~, outName, ~] = fileparts(ni.fname);
    outName = strsplit(outName,'.nii');
    outName = [outName{1}, '_canXformed.nii.gz'];
end

ni.fname = outName;

niftiWrite(ni, fullfile(outDir, outName));

end
