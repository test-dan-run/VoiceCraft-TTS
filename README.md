# VoiceCraft-TTS

[Official Repository](https://github.com/jasonppy/VoiceCraft) | [Official Demo](https://jasonppy.github.io/VoiceCraft_web) | [Official Paper](https://jasonppy.github.io/assets/pdfs/VoiceCraft.pdf)

## TL;DR
This is a minimal version of the [VoiceCraft repository](https://github.com/jasonppy/VoiceCraft), dedicated to VoiceCraft's TTS inference pipeline only. Built with Docker.<br>
The official repository recommends using MFA to align an audio file with its transcript. I suggest using a VAD model and an ASR model to generate a dedicated speech segment and corresponding transcript instead. (conda is a pain) <br> Something like [Faster-Whisper](https://github.com/SYSTRAN/faster-whisper) would do.

## TODOs
- [ ] Set-up VAD & ASR pipeline for automatic speech prompt creation
- [ ] Set-up Gradio demo

## Setup
The following setup was tested with WSL2 on Windows 11, with an RTX3080ti (12GB VRAM).

### Clone the repository
```sh
git clone https://github.com/test-dan-run/voicecraft-tts
```

### Docker
Make sure your system has Docker and one of the latest NVIDIA CUDA drivers installed. Then run the following command. It might take a while. Not as long as waiting for conda to resolve itself though.
```sh
docker-compose build
```

### Pretrained Models
Download the **Encodec model file** and 1 of the  **VoiceCraft model files** in the [official Huggingface repository](https://huggingface.co/pyp1/VoiceCraft/tree/main).<br>
Place them in the `pretrained_models` folder.

### Start up the Jupyter Notebook
You're pretty much all set. No need for conda and its shenanigans.
```sh
docker-compose up
```
The jupyter server should be started at `http://localhost:8888`

## Citation
```
@article{peng2024voicecraft,
  author    = {Peng, Puyuan and Huang, Po-Yao and Li, Daniel and Mohamed, Abdelrahman and Harwath, David},
  title     = {VoiceCraft: Zero-Shot Speech Editing and Text-to-Speech in the Wild},
  journal   = {arXiv},
  year      = {2024},
}
```

## Disclaimers and Licenses
The following details are duplicated from the official repository.

### License
The codebase is under CC BY-NC-SA 4.0 ([LICENSE-CODE](./LICENSE-CODE)), and the model weights are under Coqui Public Model License 1.0.0 ([LICENSE-MODEL](./LICENSE-MODEL)). Note that we use some of the code from other repository that are under different licenses: `./models/codebooks_patterns.py` is under MIT license; `./models/modules`, `data/tokenizer.py` are under Apache License, Version 2.0; the phonemizer we used is under GNU 3.0 License. For drop-in replacement of the phonemizer (i.e. text to IPA phoneme mapping), try [g2p](https://github.com/roedoejet/g2p) (MIT License) or [OpenPhonemizer](https://github.com/NeuralVox/OpenPhonemizer) (BSD-3-Clause Clear), although these are not tested.

### Disclaimer
Any organization or individual is prohibited from using any technology mentioned in this paper to generate or edit someone's speech without his/her consent, including but not limited to government leaders, political figures, and celebrities. If you do not comply with this item, you could be in violation of copyright laws.