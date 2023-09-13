# ORRA Demonstration

This is part of the Open Retail Reference Architecture demo project coordinated by IBM, Intel, Scale Computing, IOTech Systems and others.

This part of the demo will show how product identification via visual inference and product identification by RFID & Bar Code Reader (both simulated) are collected and examined at the edge for discrepancies at the point of sale (as part of a theft / loss prevention system).  A discrepancy is an instance where by sensors and inference at the edge do not agree about what product is being purchased.  A discrepancy pops up in a user interface to allow the human in the loop to correctly identify the product at purchase and where necessary, trigger retraining of any inference system (in this example using Intel's Geti system to retrain the visual inference model when an inference is incorrect).

## IEAM Service Definition Files
The following folders contain the IBM Edge Application Manager (IEAM - commerical version of the OpenHorizon project) Service Definitions for each of IOTech's Edge Xpert (version 2.3) micro services used in this project.  Xpert is an edge data platform based on EdgeX Foundry that collects data/command's and controls devices and sensors at the edge.  In this ORRA demonstration, Xpert is being used to collect RFID, Bar Code and Visual Inference data at th edge.  Xpert also provide local analytics.  In this case, a rules engine that compares the data readings from the RFID Scanner, Bar Code Reader and camera/visual inference system for discrepancies at the point of sale.

- app-discrepancy
- app-postgres-write
- broker (MQTT broker)
- core-command
- core-data
- cts (corrective training system; a web application added extra to Xpert to display and manage the discrepancies seen by Xpert)
- device-mqtt
- device-virtual
- redis (Redis database)
- support-rulesengine
- timescaledb (Postgres Timescale DB)
- xpert-manager (Edge Xpert's UI)

## Testing
See the `orra-testing` folder to execute simulater RFID and Bar Code scans as well as simulate product identification by visual inference.  This helps exercise and demo the entire ORRA system except for physical device / sensor reading and deployment of new VI models that get produced.

