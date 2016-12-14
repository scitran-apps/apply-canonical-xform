# apply-canonical-xform
Reorient NIfTI data and metadata fields into RAS space by estimating and applying a canonical transform.

This Gear uses a compiled version of the [VISTASOFT](https://github.com/vistalab/vistasoft/) function [niftiApplyCannonicalXform](https://github.com/vistalab/vistasoft/blob/master/fileFilters/nifti/niftiApplyCannonicalXform.m).


### Example Usage

```bash
mkdir -p input/nifti && mkdir output
cp <nifti-file.nii.gz> input/nifti
docker run --rm -ti -v `pwd`/input:/flywheel/v0/input -v `pwd`/output:/flywheel/v0/output scitran/apply-canonical-xform
```
