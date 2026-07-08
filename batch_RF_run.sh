#!/bin/bash
set -o pipefail
# batch file to the Tune, train, Variable importance code
# Tune. Run from the project root
# Rscript --no-save --no-restore --verbose \
#   ./R_code/analysis/fit_random_forest/tune_randomforest_nocluster.R \
#   2>&1 | stdbuf -oL -eL tee ./results/ranger/tune_randomforest_nocluster.log #\
#&& \
# Train \
#Rscript --no-save --no-restore --verbose \
#  ./R_code/analysis/fit_random_forest/train_randomforest_nocluster.R \
#  2>&1 | stdbuf -oL -eL tee ./results/ranger/train_randomforest_nocluster.log #\
#&& \
# Fit the Variable importance 
# Rscript --no-save --no-restore --verbose \
#   ./R_code/analysis/fit_random_forest/variable_importance_randomforest_nocluster.R \
#  2>&1 | stdbuf -oL -eL tee ./results/ranger/variable_importance_randomforest_nocluster.log

#################################################
# Perform the weighted calibration
#################################################
 Rscript --no-save --no-restore --verbose \
   ./R_code/analysis/fit_random_forest/weighted_calibration.R \
  2>&1 | stdbuf -oL -eL tee ./R_code/analysis/fit_random_forest/weighted_calibration.log

# you can also render a markdown doc 
# Predictions heatmap
Rscript -e "rmarkdown::render('writing/predictions_heatmap.Rmd', output_format='html_document')"
