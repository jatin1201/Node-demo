#!/bin/bash

# Set the log directory and S3 bucket name
LOG_DIR=/var/log/myapp
S3_BUCKET=myapp-logs

# Create a timestamp for the log file name
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)

# Compress the log files into a single .tar.gz archive
cd $LOG_DIR && tar -czvf $TIMESTAMP.tar.gz *.log

# Copy the compressed archive to the S3 bucket
aws s3 cp $LOG_DIR/$TIMESTAMP.tar.gz s3://$S3_BUCKET/$TIMESTAMP.tar.gz
