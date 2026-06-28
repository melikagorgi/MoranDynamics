# Evolutionary Wave Speed Simulations

Numerical simulations comparing traveling-wave solutions in three evolutionary models: **Birth-Death (BD)**, **Death-Birth (DB)**, and **Fisher-KPP (FK)**. Each model tracks how an allele frequency wave propagates across a 1D spatial lattice under selection.

## Models

| Notebook | Model | Description |
|----------|-------|-------------|
| `BD.ipynb` | Birth-Death | A randomly chosen individual reproduces proportional to fitness; a random neighbor is replaced |
| `DB.ipynb` | Death-Birth | A randomly chosen individual dies; neighbors compete to fill the vacancy proportional to fitness |
| `FK.ipynb` | Fisher-KPP | Deterministic PDE (reaction-diffusion) benchmark |
| `plots.ipynb` | Comparison | Loads saved outputs and plots wave speed vs. mean frequency across all three models |

## Parameters

- `K = 500` — number of spatial sites (lattice size)
- `s` — selection coefficient (e.g. `s = 0.5`)
- `q` — dominance parameter (e.g. `q = 0` for additive, `q = -0.5`)
- Initial condition: single mutant placed at the center of the lattice

## Output files (`.npy`)

Each simulation saves two arrays per run:

- `speed_<MODEL>_<K>_s_<s>_q_<q>.npy` — wave speed measured at each timestep
- `w_<MODEL>_<K>_s_<s>_q_<q>.npy` — mean allele frequency at each timestep

Pre-computed outputs are included in this repo for the parameter combinations:

| File set | Model | K | s | q |
|----------|-------|---|---|---|
| `*_BD_500_s_05_q_0` | BD | 500 | 0.5 | 0 |
| `*_DB_500_s_05_q_0` | DB | 500 | 0.5 | 0 |
| `*_FK_500_s_05` | FK | 500 | 0.5 | — |
| `*_BD_500_s_0_q_-05` | BD | 500 | 0 | −0.5 |
| `*_DB_500_s_0_q_-05` | DB | 500 | 0 | −0.5 |

To regenerate these files, run each model notebook end-to-end.

## Requirements

```bash
pip install numpy matplotlib jupyter
```

## Usage

1. Run `BD.ipynb`, `DB.ipynb`, or `FK.ipynb` to simulate a parameter set and save outputs.
2. Run `plots.ipynb` to load saved `.npy` files and compare wave speed curves across models.
