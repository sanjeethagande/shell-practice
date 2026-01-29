#!/bin/bash

start_time=$(date +%s)
echo "script started at $start_time"
sleep 10
end_time=$(date +%s)
echo "script ended at $start_time"
total_time=$(($end_time-$start_time))
echo "script executed in  :$total_time"


