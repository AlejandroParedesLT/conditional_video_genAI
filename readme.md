# Stable Video Diffusion Image to Video Generator

This repository contains a script for generating videos from still images using Stable Video Diffusion models. The tool supports several SVD variants including standard SVD, SVD-XT, and SV3D for 3D-aware video generation.

## Overview

Stable Video Diffusion (SVD) is a diffusion-based AI model that transforms a single input image into a coherent video sequence. This implementation supports:

- Standard SVD for short video generation (14 frames)
- SVD-XT for longer video generation (25 frames)
- SV3D for 3D-aware video generation with camera control

## Features

- Generate videos from a single image or batch process multiple images in a folder
- Control motion intensity via `motion_bucket_id` parameter
- Adjust frame rate with the `fps_id` parameter
- Support for 3D-aware video generation with camera trajectory control (SV3D)
- Background removal for 3D object visualization
- Frame-by-frame export option
- Watermarking for generated content

## Installation

Clone the repository and install the required dependencies:

```bash
git clone https://github.com/AlejandroParedesLT/conditional_video_genAI
cd conditional_video_genAI
pip install -r requirements.txt
```

### Requirements

- PyTorch
- OpenCV
- imageio
- einops
- fire
- omegaconf
- PIL
- rembg (for background removal)

## Usage

```bash
python sample.py --input_path "path/to/image.png" --version "svd_xt" --motion_bucket_id 127 --fps_id 6
```

### Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `input_path` | Path to input image or folder containing images | "assets/test_image.png" |
| `num_frames` | Number of frames to generate | Model-dependent |
| `num_steps` | Number of sampling steps | Model-dependent |
| `version` | Model version to use (svd, svd_xt, sv3d_u, sv3d_p) | "svd_xt" |
| `fps_id` | Controls the frames per second of the output | 6 |
| `motion_bucket_id` | Controls the amount of motion (0-255) | 127 |
| `cond_aug` | Controls the conditioning augmentation | 0.02 |
| `seed` | Random seed for reproducibility | 23 |
| `decoding_t` | Number of frames decoded at a time (reduce if out of VRAM) | 14 |
| `device` | Device to use for inference (cuda or cpu) | "cuda" |
| `output_folder` | Where to save generated videos | Model-dependent |
| `elevations_deg` | Camera elevations in degrees (for SV3D) | 10.0 |
| `azimuths_deg` | Camera azimuths in degrees (for SV3D) | None (auto-calculated) |
| `image_frame_ratio` | Controls object size in frame | None |
| `verbose` | Enable verbose output | False |

### Models

1. **SVD (Stable Video Diffusion)**
   - Default frames: 14
   - Best for: Short video clips

2. **SVD-XT (Extended)**
   - Default frames: 25
   - Best for: Longer video sequences

3. **SV3D-U (3D-aware, Unconditioned)**
   - Default frames: 21
   - Best for: 3D object visualization with automatic camera paths

4. **SV3D-P (3D-aware, Path-conditioned)**
   - Default frames: 21
   - Best for: 3D object visualization with custom camera paths
   - Requires: Elevation and azimuth degree inputs

### Examples

#### Generate a standard video with default settings:
```bash
python sample.py --input_path "my_image.png"
```

#### Generate a high-motion video:
```bash
python sample.py --input_path "my_image.png" --motion_bucket_id 250
```

#### Generate a 3D-aware video with custom camera path:
```bash
python sample.py --input_path "my_object.png" --version "sv3d_p" --elevations_deg "[10,15,20,15,10,5,0]"
```

#### Process all images in a folder:
```bash
python sample.py --input_path "my_images_folder/"
```

## Output

The script generates:

- MP4 video files in the specified output folder
- Individual JPEG frames fo

# This inference project is based on its entirety from Stability AI's research on video generation. Please check out their papers and implementations

https://github.com/Stability-AI/generative-models
