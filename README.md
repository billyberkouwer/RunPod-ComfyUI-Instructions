**DIRECTIONS FOR GENERATING COMFYUI DOCKER IMAGES FOR RUNPOD**

**DOCKER COMMANDS**

_Docker build command_. 
This command builds a docker image with the custom nodes and .safetensor files you declare in the docker file.

In terminal ->

``cd /your-docker-file-folder``

E.g. ``/tomas/documents/code/temp``

``docker build -t <your_dockerhub_username>/runpod-worker-comfy:<chosen_tag_name> --target base --platform linux/amd64 <custom-docker-file-location>`` (in this case "." because you have cd'd into the repo)

E.g. ``docker build -t billymylesberkouwer/runpod-worker-comfy:test --target base --platform linux/amd64 .``
__________________________________________________________________________________

_Docker run command:_
You can run the image locally after building the image. To do so use the following command:

In terminal ->

``docker run <your_dockerhub_username>/runpod-worker-comfy:<chosen_tag_name>``

E.g. ``docker run -t billymylesberkouwer/runpod-worker-comfy:test``

_N.B. unless you are running this inside a linux virtual machine that has drivers for your GPU successfully installed, you cannot perfectly replicate the RunPod image running process. Despite following directions from NVIDIA and Docker, I've been unable to get it to register my GPU drivers properly for inside my Linux VM._

**DOCKER FILE EXPLANATION**

_The 'FROM' command_ takes the official runpod-worker-comfy repo as a base, executing the functions required to create the ComfyUI image.

E.g.:
- ``FROM timpietruskyblibla/runpod-worker-comfy:2.2.0 as base ``
uses version 2.2.0 as a base
- ``FROM timpietruskyblibla/runpod-worker-comfy:3.0.0-base as base ``
uses the latest version as a base. This one contains no built in .safetensor files and requires you to manually install the required safetensor files (see Docker file for the ones you need)
- ``FROM timpietruskyblibla/runpod-worker-comfy:3.0.0-sd3 as base``
uses the latest version as a base. This one contains stable diffusion 3

_______________________________________________________________________________

_The 'WORKDIR' command_ sets the path that you are working in. This is important as you will need to make sure you are installing the files in the correct directory. It uses the following pattern:
``WORKDIR <some-path>``

E.g.:
- ``WORKDIR /comfyui/custom_nodes``
_______________________________________________________________________________

_The 'RUN' command_ allows you to run different commands and installs. Timpietruskyblibla's runpod-worker-comfy installs python and git amongst other things so you are able to use git clone, pip, and wget to install the required packages.
It uses the following pattern:

``RUN git clone https://github.com/<some-repository> <install-location-relative-to-WORKDIR>``
``RUN wget -O <install-location-relative-to-WORKDIR> <some-download-link>``

E.g.:

``WORKDIR /comfyui/custom_nodes``
``RUN git clone https://github.com/FizzleDorf/ComfyUI_FizzNodes.git ./ComfyUI_FizzNodes``

This will install fizz nodes in /comfyui/custom_nodes/ComfyUI_FizzNodes

``WORKDIR /comfyui/models``
``RUN wget -O ./checkpoints/sd_turbo.safetensors https://huggingface.co/stabilityai/sd-turbo/resolve/main/sd_turbo.safetensors?download=true``

This will install sd_turbo.safetensors inside /comfyui/models/checkpoints/sd_turbo.safetensors

**Requirements**

Some of these custom nodes contain a requirements.txt file in their repositories. This lists additional installations required for the plugin to work. To install these requirements, follow this pattern:

``RUN pip install -r <location-of-requirements.txt-file-relative-to-working-diretory>/requirements.txt``

E.g. after installing FizzNodes:
``WORKDIR /comfyui/custom_nodes``
``RUN pip install -r ./ComfyUI_FizzNodes/requirements.txt``

**NOTES**

You do not need to include any .safetensors files in your docker image in order to test Custom Nodes. You will still get logs on which plugins loaded successfully and which failed, even though the workflow.json will fail to return any images. It might be better to perform quick tests on which custom nodes are working with the base version of runpod-worker-comfy and no .safetensors files as it has much less data to fetch. It also takes up less space on your local machine.

Use the test_input.json to test your deployed ComfyUI API through the RunPod interface. I've added a copy to this repository.
