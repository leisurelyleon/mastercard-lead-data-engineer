# File: data_pipeline.sh
#!/bin/bash

# ETL pipeline orchestration script
# --------------------------------
set -euo pipefail

LOGDIR="logs"
mkdir -p "$LOGDIR"
LOGFILE="$LOGDIR/pipeline_$(date +%F).log"

# Log function
echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOGFILE"

echo "Starting data pipeline" 
log "Starting data pipeline"

# Extract step
echo "Extracting data from HDFS..."
hadoop fs -get /data/raw /tmp/raw_data 2>&1 | tee -a "$LOGFILE"

# Transform step
echo "Transforming data..."
python3 scripts/transform.py /tmp/raw_data /tmp/processed_data 2>&1 | tee -a "$LOGFILE"

# Load step
echo "Loading processed data back to HDFS..."
hadoop fs -put /tmp/processed_data /data/processed 2>&1 | tee -a "$LOGFILE"

log "Data pipeline completed successfully"
exit 0

# --------------------------------
# End of data_pipeline.sh
