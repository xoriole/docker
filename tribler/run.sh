# Prepare experiment environment
echo "Setting up environment"
cd /tribler
export SRC_DIR=/tribler/tribler/src
export PYTHONPATH="$PYTHONPATH:$SRC_DIR/pyipv8:$SRC_DIR/anydex:$SRC_DIR/tribler-common:$SRC_DIR/tribler-core:$SRC_DIR/tribler-gui"

# Run the experiment
echo "Running experiment"
python3 $SRC_DIR/tribler-core/run_popularity_helper.py

# Save the results to /data
echo "Saving experiment results"
chmod 777 *.txt
cp *.txt /data
