# Statistical Analysis of ODI Cricketers (2019–2023)

![Banner](assets/banner.png)

End‑to‑end analysis of ODI cricketers from 2019–2023:
- **Descriptive**: player aggregates, rate stats, role‑adjusted comparisons
- **Clustering**: k‑means (role/skill archetypes)
- **Predictive**: logistic models / random forest for match‑level outcomes
- **Visualization**: ggplot2/Matplotlib charts for rankings and trends

> Structured for clean reproducibility and recruiter‑friendly browsing.

---

## 📦 Project structure

```
.
├─ assets/                # banner & images for README
├─ data/
│  ├─ raw/               # raw CSVs (do not edit)
│  └─ processed/         # cleaned/derived data (gitignored)
├─ notebooks/            # analysis notebooks (.ipynb/.Rmd)
├─ reports/
│  └─ figures/           # exported plots (PNG/SVG)
├─ src/                  # reusable scripts (R and/or Python)
├─ .github/workflows/    # CI (optional)
├─ .gitignore
├─ LICENSE
└─ README.md
```

Auto‑placed from your upload:
- notebooks: []
- scripts: ['src/Cluster.R', 'src/Heirarchical Clustering.R', 'src/Heirarchical Clustering1.R', 'src/Hotelling Tsquare.R', 'src/K Fold Cross Validation.R', 'src/KNN Prediction.R', 'src/Logistic Regression.R', 'src/MANOVAASIA.R', 'src/MANOVAMEN.R', 'src/MANOVAWOMEN.R', 'src/MatchResultPrediction.R', 'src/MenAsiaHeirarchichalClustering.R', 'src/MenKC.R', 'src/MenKMeansClustering.R', 'src/Multinomial.R', 'src/Naive Bayes.R', 'src/Neural Network.R', 'src/PCA.R', 'src/Random Forest Prediction.R', 'src/SVM.R', 'src/SVM1.R', 'src/SVMPrediction.R', 'src/wlb.R', 'src/Women Classification Techniques.R', 'src/Women Feature Importance.R', 'src/Women K Means Clustering.R', 'src/WomenAsiaHeirarchichalClustering.R', 'src/WomenCluster1.R', 'src/WomenKmeansClustering.R']
- raw data: ['data/raw/Asia.csv', 'data/raw/Aus&NZ.csv', 'data/raw/Continents.csv', 'data/raw/Matches.csv', 'data/raw/MenbowlerAsia.csv', 'data/raw/MenCluster.csv', 'data/raw/MENCRICKETDATA.csv', 'data/raw/Mentoss.csv', 'data/raw/Women Ranking (Batters).csv', 'data/raw/women12.csv', 'data/raw/WomenAsia.csv', 'data/raw/WomenAsiaBatsmans.csv', 'data/raw/WomenbatsmanAsia.csv', 'data/raw/womenbatting.csv', 'data/raw/Womenbowling.csv', 'data/raw/WomenCluster.csv', 'data/raw/WomenContinents.csv', 'data/raw/Womendata.csv']

> If something is missing, drop the file into the correct folder and commit.

---

## 🚀 How to run

### Option A — R
1. Open R/RStudio, set working dir to repo root.
2. Install packages:
   ```r
   install.packages(c("tidyverse","ggplot2","cluster","factoextra","randomForest"))
   ```
3. Open a notebook in `notebooks/` or source scripts in `src/`.

### Option B — Python
1. Create & activate env
   ```bash
   python -m venv .venv
   # Windows: .\.venv\Scripts\activate
   # macOS/Linux: source .venv/bin/activate
   ```
2. Install
   ```bash
   pip install pandas numpy scikit-learn matplotlib seaborn jupyter
   ```
3. Run notebooks in `notebooks/`.

---

## 🖼️ Figures
Save plots to `reports/figures/` and reference them in notebooks. Commit selected plots in the repo for the README.

## 📄 License
MIT © Lohith B N
