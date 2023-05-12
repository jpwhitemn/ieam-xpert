#!/bin/sh

# Very simple Horizon sample edge service.

while true; do
  echo "$HZN_NODE_ID says: Hell ${HW_WHO}!"
  sleep 3
done
