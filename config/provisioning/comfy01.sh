#!/bin/bash

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

DEFAULT_WORKFLOW="https://raw.githubusercontent.com/ai-dock/comfyui/main/config/workflows/flux-comfyui-example.json"

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Inspire-Pack"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/rgthree/rgthree-comfy" 
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes"
    "https://github.com/melMass/comfy_mtb"
    "https://github.com/TinyTerra/ComfyUI_tinyterraNodes"
    "https://github.com/jamesWalker55/comfyui-various"
    "https://github.com/KoreTeknology/ComfyUI-Universal-Styler"
    "https://github.com/godmt/ComfyUI-List-Utils"
    "https://github.com/crystian/ComfyUI-Crystools" 
    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/sipherxyz/comfyui-art-venture"
    "https://github.com/theUpsider/ComfyUI-Logic"
    "https://github.com/shadowcz007/comfyui-mixlab-nodes"
    "https://github.com/receyuki/comfyui-prompt-reader-node"
    #"https://github.com/pamparamm/sd-perturbed-attention"
    "https://github.com/Fannovel16/comfyui_controlnet_aux"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus"
    "https://github.com/giriss/comfy-image-saver"
    # --- POST PROCESSING ---
    ###"https://github.com/EllangoK/ComfyUI-post-processing-nodes"
    "https://github.com/digitaljohn/comfyui-propost"
    # --- UPSCALER ---
    #"https://github.com/kijai/ComfyUI-CCSR"
    #"https://github.com/kijai/ComfyUI-SUPIR"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    ###"https://github.com/pikenrover/ComfyUI_PRNodes"
    # --- PORTRAIT MASTER + LIVE PORTRAIT ---
    "https://github.com/florestefano1975/comfyui-portrait-master"
    "https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait"
    # --- SEGMENTATION ---
    "https://github.com/kijai/ComfyUI-Florence2"
    "https://github.com/kijai/ComfyUI-segment-anything-2"
    "https://github.com/Ryuukeisyou/comfyui_face_parsing" 
    # --- LLM ---
    #"https://github.com/stavsap/comfyui-ollama"
    "https://github.com/glibsonoran/Plush-for-ComfyUI"
    #"https://github.com/ronniebasak/ComfyUI-Tara-LLM-Integration"
    # --- SDXL ---
    #"https://github.com/cubiq/PuLID_ComfyUI"
    #"https://github.com/TheMistoAI/ComfyUI-Anyline"
    # --- FLUX ---
    #"https://github.com/XLabs-AI/x-flux-comfyui"
    #"https://github.com/sipie800/ComfyUI-PuLID-Flux-Enhanced"
    #"https://github.com/fairy-root/Flux-Prompt-Generator"
    # --- LoRA Training ---
    #"https://github.com/omar92/ComfyUI-QualityOfLifeSuit_Omar92"
    #"https://github.com/LEv145/images-grid-comfy-plugin"
    #"https://github.com/idrirap/ComfyUI-Lora-Auto-Trigger-Words"
    #"https://github.com/jitcoder/lora-info"
    #"https://github.com/ycyy/ComfyUI-YCYY-LoraInfo"
    #"https://github.com/BlackVortexAI/ComfyUI-BVortexNodes"
    # --- Conflicted at last ---
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/WASasquatch/was-node-suite-comfyui"
)

CHECKPOINT_MODELS=(
)

CLIP_MODELS=(
)

UNET_MODELS=(
)

VAE_MODELS=(
)

LORA_MODELS=(
)

ESRGAN_MODELS=(
)

CONTROLNET_MODELS=(
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    if [[ ! -d /opt/environments/python ]]; then 
        export MAMBA_BASE=true
    fi
    source /opt/ai-dock/etc/environment.sh
    source /opt/ai-dock/bin/venv-set.sh comfyui

    # Get licensed models if HF_TOKEN set & valid
    #if provisioning_has_valid_hf_token; then
    #    UNET_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/flux1-dev.safetensors")
    #    VAE_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-dev/resolve/main/ae.safetensors")
    #else
    #    UNET_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/flux1-schnell.safetensors")
    #    VAE_MODELS+=("https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors")
    #    sed -i 's/flux1-dev\.safetensors/flux1-schnell.safetensors/g' /opt/ComfyUI/web/scripts/defaultGraph.js
    #fi

    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_default_workflow
    provisioning_get_nodes
    provisioning_get_pip_packages
    #provisioning_get_models \
    #    "${WORKSPACE}/storage/stable_diffusion/models/ckpt" \
    #    "${CHECKPOINT_MODELS[@]}"
    #provisioning_get_models \
    #    "${WORKSPACE}/storage/stable_diffusion/models/unet" \
    #    "${UNET_MODELS[@]}"
    #provisioning_get_models \
    #    "${WORKSPACE}/storage/stable_diffusion/models/lora" \
    #    "${LORA_MODELS[@]}"
    #provisioning_get_models \
    #    "${WORKSPACE}/storage/stable_diffusion/models/controlnet" \
    #    "${CONTROLNET_MODELS[@]}"
    #provisioning_get_models \
    #    "${WORKSPACE}/storage/stable_diffusion/models/vae" \
    #    "${VAE_MODELS[@]}"
    #provisioning_get_models \
    #    "${WORKSPACE}/storage/stable_diffusion/models/clip" \
    #    "${CLIP_MODELS[@]}"
    #provisioning_get_models \
    #    "${WORKSPACE}/storage/stable_diffusion/models/esrgan" \
    #    "${ESRGAN_MODELS[@]}"
    provisioning_print_end
}

function pip_install() {
    if [[ -z $MAMBA_BASE ]]; then
            "$COMFYUI_VENV_PIP" install --no-cache-dir "$@"
        else
            micromamba run -n comfyui pip install --no-cache-dir "$@"
        fi
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip_install ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip_install -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip_install -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_default_workflow() {
    if [[ -n $DEFAULT_WORKFLOW ]]; then
        workflow_json=$(curl -s "$DEFAULT_WORKFLOW")
        if [[ -n $workflow_json ]]; then
            echo "export const defaultGraph = $workflow_json;" > /opt/ComfyUI/web/scripts/defaultGraph.js
        fi
    fi
}

function provisioning_get_models() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif 
        [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi
    if [[ -n $auth_token ]];then
        wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
    fi
}

provisioning_start
