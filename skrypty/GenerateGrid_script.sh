#!/bin/bash

INPUT_FILE=$1
LIG_ASL="mol.num 2"
JOBNAME=${INPUT_FILE/proteinprep.mae/grid}

LOGFILE="gnu_project_log.txt"
# USTAWIENIA Generate glide grids
# -rec_file: ścieżka do struktury receptora
# -lig_asl: określa pozycje ligandu, na podstawie którego zostanie
#       wycentrowana siatka (ZAZWYCZAJ jest to pozycja 2)
# -inner_box: rozmiar obszaru aktywnego wiązania
# -outer_box: rozmiar maksymalnego obszaru prób dopasowania ligandu
# -j: nazwa zadania 

$SCHRODINGER/utilities/generate_glide_grids \
        -rec_file "${INPUT_FILE}" \
        -lig_asl "${LIG_ASL}" \
        -inner_box 10 \
        -outer_box 30 \
        -j "${JOBNAME}"

echo "[$(date '+%Y-%m-%d %H:%M:%S')]" >> "${LOGFILE}"
echo "Script: $(basename "$0")" >> "${LOGFILE}"
echo "Input: ${INPUT_FILE}" >> "${LOGFILE}"
echo "Output: ${JOBNAME}.zip" >> "${LOGFILE}"
echo "-----------------------------" >> "${LOGFILE}"

echo "Plik zostanie zapisany w ${JOBNAME}.zip"
