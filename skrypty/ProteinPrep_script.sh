#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=${INPUT_FILE/.pdb/_proteinprep.mae}

LOGFILE="gnu_project_log.txt"
# USTAWIENIA PrepWizard
# -epik_pH: pH dla stanu protonacji ligandów (het group)
# -propka_pH: pH do określenia stanu protonacji reszt aminokwasów
# -disulfides: Dodaj wiązania disiarczkowe między cysteinami
# -fillsidechains: Uzupełnij brakujące łańcuchy boczne (z użyciem Prime)
# -fillloops: Uzupełnij brakujące pętle (też z Prime)
# -rmsd: Minimalizacja: RMSD cutoff dla konwergencji (domyślnie 0.3 Å)
# -watdist: Usuń cząsteczki wody odległe >5.0 Å od het grup (np. ligandów)

$SCHRODINGER/utilities/prepwizard \
  -epik_pH 7.4 \
  -propka_pH 7.4 \
  -disulfides \
  -fillsidechains \
  -fillloops \
  -rmsd 0.3 \
  -watdist 5.0 \
  ${INPUT_FILE} \
  ${OUTPUT_FILE}

echo "[$(date '+%Y-%m-%d %H:%M:%S')]" >> ${LOGFILE}
echo "Script: $(basename "$0")" >> ${LOGFILE}
echo "Input: ${INPUT_FILE}" >> ${LOGFILE}
echo "Output: ${OUTPUT_FILE}" >> ${LOGFILE}
echo "-----------------------------" >> ${LOGFILE}

echo "Wynik zostanie zapisany do pliku ${OUTPUT_FILE}"
