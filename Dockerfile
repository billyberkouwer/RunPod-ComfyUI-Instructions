# FROM timpietruskyblibla/runpod-worker-comfy:2.2.0 AS base
FROM timpietruskyblibla/runpod-worker-comfy:3.0.0-base AS base
# FROM timpietruskyblibla/runpod-worker-comfy:3.0.0-sd3 AS base

# WORKDIR /comfyui/models

# RUN mkdir -p ./vae_approx

# RUN wget -O ./checkpoints/sd_turbo.safetensors https://huggingface.co/stabilityai/sd-turbo/resolve/main/sd_turbo.safetensors?download=true
# RUN wget -O ./loras/mantra_alias.safetensors https://raw.githubusercontent.com/billyberkouwer/temp/main/mantra_alias.safetensors
# RUN wget -O ./vae_approx/taesd_decoder.pth https://raw.githubusercontent.com/billyberkouwer/temp/main/taesd_decoder.pth
# RUN wget -O ./vae_approx/taesd_encoder.pth https://raw.githubusercontent.com/billyberkouwer/temp/main/taesd_encoder.pth
# RUN wget -O ./vae/taesd_decoder.safetensors https://huggingface.co/madebyollin/taesdxl/resolve/main/taesdxl_decoder.safetensors?download=true
# RUN wget -O ./vae/taesd_encoder.safetensors https://huggingface.co/madebyollin/taesdxl/resolve/main/taesdxl_encoder.safetensors?download=true

WORKDIR /comfyui/custom_nodes

# RUN git clone https://github.com/ltdrdata/ComfyUI-Manager/comfyui/custom_nodes/ComfyUI-Manager
# RUN pip3 install -r requirements.txt

RUN git clone https://github.com/FizzleDorf/ComfyUI_FizzNodes.git ./ComfyUI_FizzNodes
RUN pip install -r ./ComfyUI_FizzNodes/requirements.txt

# RUN git clone https://github.com/WASasquatch/was-node-suite-comfyui.git ./was-node-suite-comfyui
# RUN pip install -r ./was-node-suite-comfyui/requirements.txt

# RUN git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git ./ComfyUI-Custom-Scripts

# RUN git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git ./ComfyUI_Comfyroll_CustomNodes

# RUN git clone https://github.com/jamesWalker55/comfyui-various.git ./comfyui-various

# RUN git clone https://github.com/cubiq/ComfyUI_essentials.git ./ComfyUI_essentials
# RUN pip install -r ./ComfyUI_essentials/requirements.txt

# RUN git clone https://github.com/gokayfem/ComfyUI_VLM_nodes.git ./ComfyUI_VLM_nodes
# RUN pip install -r ./ComfyUI_VLM_nodes/requirements.txt

# RUN git clone https://github.com/kadirnar/ComfyUI-YOLO.git ./ComfyUI-YOLO
# RUN pip install -r ./ComfyUI-YOLO/requirements.txt

# RUN git clone https://github.com/shadowcz007/comfyui-mixlab-nodes.git ./comfyui-mixlab-nodes
# RUN pip install -r ./comfyui-mixlab-nodes/requirements.txt

# RUN git clone https://github.com/Amorano/Jovimetrix.git ./Jovimetrix
# RUN pip install -r ./Jovimetrix/requirements.txt

# RUN git clone https://github.com/BadCafeCode/masquerade-nodes-comfyui.git ./masquerade-nodes-comfyui

# RUN git clone https://github.com/sipherxyz/comfyui-art-venture.git ./comfyui-art-venture
# RUN pip install -r ./comfyui-art-venture/requirements.txt

# RUN git clone https://github.com/twri/sdxl_prompt_styler.git ./sdxl_prompt_styler

# RUN git clone https://github.com/hylarucoder/ComfyUI-Eagle-PNGInfo.git ./ComfyUI-Eagle-PNGInfo

# Go back to the root
WORKDIR /

# Start the container
CMD /start.sh