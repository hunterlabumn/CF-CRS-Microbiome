---
title: "README"
author: "Sarah Lucas"
date: "July 6, 2020"
---

This repository documents the code and analysis for Ch. 3 The microbiome of chronic rhinosinusitis in a cystic fibrosis patient cohort at University of Minnesota.

# The microbiome of chronic rhinosinusitis in a cystic fibrosis patient cohort at University of Minnesota

**Abstract**
Chronic rhinosinusitis (CRS) affects nearly all patients with cystic fibrosis (CF). The upper airways are considered to be a focal point for pulmonary pathogen colonization, ultimately leading to chronic lung infection - the primary cause of CF morbidity and mortality. The goal of this study was to provide a descriptive molecular-based survey of endoscopically collected CF-CRS sinus mucus. 16S rRNA gene sequencing was used to survey sinus mucus isolated from CF patients. We show that CF-CRS sinuses harbor bacterial diversity that is not entirely captured by clinical culture. Clinical culture is able to identify the dominant organism in most communities for most patient samples. However, lower abundance organisms are not always identified, and anaerobic or fastidious bacterial taxa are seldom reflected in culture data. Results also demonstrate that canonical CF pathogens Staphylococcus aureus and Pseudomonas aeruginosa dominate sinus communities. Communities with dominant S. aureus were significantly more diverse compared to those dominated by Pseudomonas. Diversity was not significantly associated with age, however younger patient age groups tended to have a much larger range of bacterial diversity. Community composition was not significantly related to demographic and clinical factors such as polyps, GERD, asthma or allergies, nor CF genotype. Overall, this research supports previous culture-independent studies showing polymicrobial bacterial communities exist in the CF sinuses, and the diversity observed by molecular methods exceeds that which is captured by clinical culture. A clearer understanding of the polymicrobial membership of bacterial communities in CF patient sinuses is needed to better understand the contributions of ecological dynamics to airway disease.

## Sequence File Availibility
Please download sequence files associated with BioProject: 

## System Requirements
At the time of submission, this code was written with tools and dependencies that were operational on macOS Catalina 10.15.4. Session info including package versions is reported at the end of each R notebook. The development of this code was done using R (v. 4.0.0). The R Notebooks are written in Rmarkdown, which includes R code chunks and is best run in RStudio. The code was developed using RStudio (v. 1.2.5042).

## Prerequisites
**For sequence trimming and filtering**  
Running the cutadapt scripts requires the cutadapt command. Here cutadapt was installed as a conda package in miiconda3. Installation instructions can be found here: https://cutadapt.readthedocs.io/en/stable/installation.html  

**DADA2 formatted SILVA-132 taxonomy reference files**  
The DADA2 formatted Taxonomy training sets used in this publication are provided in "../data/DADA2/taxonomyTrainingSets".  
  
DADA2 formatted Taxonomy training sets are available to download through this link:https://benjjneb.github.io/dada2/training.html  
  
The original source of the downloads is here:https://zenodo.org/record/1172783

