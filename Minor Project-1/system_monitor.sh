#!/bin/bash

# Log file location
LOGFILE="/var/log/system_performance.log"
INTERVAL=60  # Interval in seconds for generating reports (default: 60 seconds)

# Function to log CPU usage
log_cpu_usage() {
    echo "CPU Usage:" >> $LOGFILE
    top -b -n1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 + $4 "%"}' >> $LOGFILE
}

# Function to log memory usage
log_memory_usage() {
    echo "Memory Usage:" >> $LOGFILE
    free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3, $2, $3*100/$2 }' >> $LOGFILE
}

# Function to generate performance report
generate_report() {
    echo "=============================" >> $LOGFILE
    echo "System Performance Report - $(date)" >> $LOGFILE
    echo "=============================" >> $LOGFILE
    log_cpu_usage
    log_memory_usage
    echo "=============================" >> $LOGFILE
    echo "" >> $LOGFILE
}

# Run the monitoring in a loop with the specified interval
echo "Starting system performance monitoring. Reports will be generated every $INTERVAL seconds."
echo "Logs are saved to $LOGFILE"

# Infinite loop for continuous monitoring
while true; do
    generate_report
    sleep $INTERVAL
done
