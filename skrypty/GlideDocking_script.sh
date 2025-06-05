#!/bin/bash

GRID=$1
LIGANDS=$2
INFILE="${GRID/_grid-gridgen.zip/_}${LIGANDS/_ligprep.mae/_}dock.in"
JOBNAME=${INFILE/dock.in/docking}
echo ${INFILE}
LOGFILE="gnu_project_log.txt"

OUTDIR="docking_results/${JOBNAME}"
mkdir -p ${OUTDIR}

cat <<EOF > $INFILE
GRIDFILE $GRID
LIGANDFILE $LIGANDS
DOCKING_METHOD confgen  #metoda dokowania (elastyczna)
POSES_PER_LIG 5         #ilość póz dla każdego liganda
PRECISION SP            #tryb precyzji dokowania
EOF

$SCHRODINGER/glide $INFILE \
        -adjust -NJOBS 1 -HOST localhost -WAIT -JOBNAME $JOBNAME

# Przenoszenie wyników
mv "${JOBNAME}"* "$OUTDIR"/

echo "[$(date '+%Y-%m-%d %H:%M:%S')]" >> "${LOGFILE}"
echo "Script: $(basename "$0")" >> "${LOGFILE}"
echo "Input: ${GRID}, ${LIGANDS}" >> "${LOGFILE}"
echo "Output: ${JOBNAME}.maegz" >> "${LOGFILE}"
echo "-----------------------------" >> "${LOGFILE}"

echo "Wyniki zostaną zapisane w folderze ${OUTDIR}"

