#!/bin/sh

mosquitto_pub -h 10.0.0.75 -f data-collection-msg-with-base64.json -t geti_classification_demo/object
