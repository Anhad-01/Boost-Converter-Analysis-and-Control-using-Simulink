# Boost Converter Analysis and Control using Simulink

This repository contains the simulation models and analysis scripts for a **Boost Converter** system, developed using MATLAB and Simulink. The project closely follows expanding on system modeling, transfer function derivation, controller design, and closed-loop analysis.

## 🔍 Project Overview

A Boost Converter is a DC-DC power electronic converter that steps up (increases) input voltage while reducing current. This project simulates a boost converter’s behavior and designs a controller to regulate its output voltage using MATLAB and Simulink.

## 📁 Repository Contents

* — Simulink models of the open-loop and closed-loop boost converter system.
* — MATLAB scripts for transfer function derivation, frequency response analysis, and bode plot.
* `report.pdf` — Detailed report of the analysis, simulations, and results.
* `README.md` — This file.

## 🧪 Key Features

* **System Modeling:** Developed both averaged and state-space models of the Boost Converter in Simulink.
* **Linearization:** Obtained linearized transfer functions using MATLAB and Simulink linear analysis tools.
* **Frequency Response:** Analyzed the Bode and root locus plots to assess system characteristics.
* **Control Design:** Designed a PI controller to achieve desired performance (faster rise time, improved stability).
* **Simulation:** Compared open-loop and closed-loop performance under varying reference and load conditions.

## 📊 Results

* Derived and verified the small-signal transfer function.
* Designed a PI controller to improve transient response and steady-state error.
* Verified controller performance through time-domain simulations.

## 🛠️ Requirements

* MATLAB R2021a or later (earlier versions may work with minor adjustments)
* Simulink
* Control System Toolbox
* Simulink Control Design (for linear analysis)
