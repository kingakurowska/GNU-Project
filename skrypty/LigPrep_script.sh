#!/bin/bash

INPUT_FILE=$1
OUTPUT_FILE=${INPUT_FILE/.sdf/_ligprep.mae}
LOGFILE="gnu_project_log.txt"
#  USTAWIENIA LigPrep
# -isd: wejściowy plik SD
# -osd: wyjściowy plik SD
# -epik: użyj Epik Classic do jonizacji/tautomerii
# -s 32: wygeneruj do 32 stereoizomerów
# -ph 7.4: pH do Epik
# -bff 14: użyj pola sił OPLS_2005

$SCHRODINGER/ligprep \
	-isd ${INPUT_FILE} \
	-omae ${OUTPUT_FILE} \
	-epik \
	-s 32 \
	-ph 7.4 \
	-bff 14 \
	-RETRIES 3

echo "[$(date '+%Y-%m-%d %H:%M:%S')]" >> ${LOGFILE}
echo "Script: $(basename "$0")" >> ${LOGFILE}
echo "Input: ${INPUT_FILE}" >> ${LOGFILE}
echo "Output: ${OUTPUT_FILE}" >> ${LOGFILE}
echo "-----------------------------" >> ${LOGFILE}

echo "Wynik zostanie zapisany do pliku ${OUTPUT_FILE}"
