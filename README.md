# temporalbandit_TDmodel

This repository contains modeling and analysis code for simulating and interpreting trial initiation behavior using a temporal-difference (TD) reinforcement learning framework. The model is applied to behavioral data from a temporal wagering task (Constantinople Lab) and evaluates how reward expectation and block context influence latent decision variables like response latency.

The code supports simulations and figure generation for model outputs and their comparison with dopamine recording (fiber photometry of an optical sensor, GRAB).

---

## 📂 Repository Structure
```
src/
├── modeling/ % Core TD model and ITI generation
├── preprocessing/ % Trial data cleaning and formatting
├── analysis/ % dopamine data analysis
├── plotting/ % plotting functions
└── main/ % Entrypoint scripts for running model or pipeline
utils/ % Helper functions
```
---

## 📄 Key Scripts

| File | Description |
|------|-------------|
| `simulateTD.m` | Runs TD learning simulation on behavioral trials |
| `generateITI_vanillaTD.m` | Generates model-based ITIs based on reward prediction error |
| `main_behavior_TDmodel.m` | Main script for loading rat data, simulating, and plotting |

---

## 📊 Figures & Outputs

The following outputs can be reproduced using scripts in `src/plotting/`:

- TD model simulations of ITI and value dynamics (trial-by-trial)
- Block- and reward-wise comparisons of RPEs and dopamine

---

## 🧪 Requirements

- MATLAB R2021a or newer

## 🚀 Getting Started

### 1. Clone this repository and also the shared utilities repo

```bash
git clone https://github.com/heejaeyunajang/temporalbandit_TDmodel.git
git clone https://github.com/heejaeyunajang/utils_core.git
```

### 2. Add all folders to your MATLAB path
```matlab
addpath(genpath('temporalbandit_TDmodel/src'))
addpath(genpath('utils_core'))
```

### 4. Run the main script
main_temporalbandit_TDmodel
