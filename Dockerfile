FROM timpietruskyblibla/runpod-worker-comfy:2.2.0 as base

# WORKDIR /comfyui/custom_nodes

# RUN git clone https://github.com/ltdrdata/ComfyUI-Manager /comfyui/custom_nodes/ComfyUI-Manager
# RUN pip3 install -r requirements.txt

# WORKDIR /comfyui

# RUN python_embeded/python.exe -s -m pip install -r requirements.txt

WORKDIR /comfyui/custom_nodes

RUN git clone https://github.com/FizzleDorf/ComfyUI_FizzNodes.git ./ComfyUI_FizzNodes
RUN pip install -r ./ComfyUI_FizzNodes/requirements.txt

RUN git clone https://github.com/WASasquatch/was-node-suite-comfyui.git ./was-node-suite-comfyui
RUN pip install -r ./was-node-suite-comfyui/requirements.txt

RUN git clone https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git ./ComfyUI-Custom-Scripts

RUN git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git ./ComfyUI_Comfyroll_CustomNodes

RUN git clone https://github.com/jamesWalker55/comfyui-various.git ./comfyui-various

RUN git clone https://github.com/cubiq/ComfyUI_essentials.git ./ComfyUI_essentials
RUN pip install -r ./ComfyUI_essentials/requirements.txt

RUN git clone https://github.com/gokayfem/ComfyUI_VLM_nodes.git ./ComfyUI_VLM_nodes
RUN pip install -r ./ComfyUI_VLM_nodes/requirements.txt

RUN git clone https://github.com/kadirnar/ComfyUI-YOLO.git ./ComfyUI-YOLO
RUN pip install -r ./ComfyUI-YOLO/requirements.txt

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