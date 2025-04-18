# temporalbandit_TDmodel

This repository contains modeling and analysis code for simulating and interpreting trial initiation behavior using a temporal-difference (TD) reinforcement learning framework. The model is applied to behavioral data from a temporal wagering task (Constantinople Lab) and evaluates how reward expectation and block context influence latent decision variables like response latency.

The code supports simulations and figure generation for model outputs and their comparison with dopamine recording (fiber photometry of an optical sensor, GRAB).

---

## 📂 Repository Structure

src/
├── modeling/ % Core TD model and ITI generation
├── preprocessing/ % Trial data cleaning and formatting
├── analysis/ % dopamine data analysis
├── plotting/ % plotting functions
└── main/ % Entrypoint scripts for running model or pipeline


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

```matlab
% Clone the repo and set up your path
addpath(genpath('path/to/temporalbandit_TDmodel/src'))

% Run full simulation and generate figure panels
main_behavior_TDmodel
