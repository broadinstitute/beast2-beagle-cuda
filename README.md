# beast2-beagle-cuda
GPU-accelerated Docker images containing [BEAST2](http://www.beast2.org) and [BEAGLE](http://beast.community/beagle), compiled with [NVIDIA CUDA](https://developer.nvidia.com/cuda-zone) support

**Note:** BEAST2 is separate and different from BEAST. If you're looking for Dockerized BEAST with BEAGLE, see this repo: https://github.com/broadinstitute/beast-beagle-cuda

**IMPORTANT:** The XML file provided to BEAST2 will need to be generated by a version of BEAUTi2 compatible with the version of BEAST2 distributed within the Docker image (currently v2.5.0)

## Instructions
* (Follow the `dsub` instructions to [Get Started on Google Cloud](https://github.com/DataBiosphere/dsub#getting-started-on-google-cloud))
* Install [dsub](https://github.com/DataBiosphere/dsub)
* Create an input XML for BEAST (via [BEAUTi](http://beast.community/beauti))
* Transfer the XML file to a GS bucket
* Call `dsub_beast.sh`:
```
Usage:
  dsub_beast2.sh gs://path/to/in.xml gcp-project-name num_gpus [beagle_order]

  Note: The version of BEAST2 used should match the version of BEAUTi2
        used to generate the input xml file.

        Docker images have been built for several versions of BEAST2.
        The Docker image to be used can be selected by the BEAST_VERSION environment variable.
        For example:
          BEAST_VERSION='2.5.0' dsub_beast.sh gs://path/to/in.xml gcp-project-name num_gpus [beagle_order]
        For available versions of BEAST2, see the tags on Quay.io:
          https://quay.io/repository/broadinstitute/beast2-beagle-cuda?tab=tags
        If BEAST_VERSION is not specified the 'latest' tag will be used.

        The GPU type can be set via the BEAST_GPU_MODEL environment variable.
        For example:
          BEAST_GPU_MODEL='nvidia-tesla-v100' dsub_beast.sh gs://path/to/in.xml gcp-project-name num_gpus beagle_order
        For available GPU models, see:
          https://cloud.google.com/compute/docs/gpus/

        Extra arguments for BEAST2 may be passed via the BEAST_EXTRA_ARGS environment variable.
        For example:
          BEAST_EXTRA_ARGS='-beagle_instances 4' dsub_beast.sh gs://path/to/in.xml gcp-project-name num_gpus [beagle_order]
```
