# Run Demonstrations in the ORRA/Xpert

This is part of the Open Retail Reference Architecture demo project coordinated by IBM, Intel, Scale Computing, IOTech Systems and others.

This part of the demo will show how product identification via visual inference and product identification by RFID & Bar Code Reader (both simulated) are collected and examined at the edge for discrepancies at the point of sale (as part of a theft / loss prevention system).  A discrepancy is an instance where by sensors and inference at the edge do not agree about what product is being purchased.  A discrepancy pops up in a user interface to allow the human in the loop to correctly identify the product at purchase and where necessary, trigger retraining of any inference system (in this example using Intel's Geti system to retrain the visual inference model when an inference is incorrect).

As an example of "discrepancy", the RFID and Bar Code reader suggest that the product being purchased is a carton of yogart, yet the visual inference suggests the product being purchased is a bottle of Coke.

In order to run this demonstration, command line requests must be sent to trigger simulated RFID and Bar Code reads (via curl) as well as an MQTT message publication of a simulated camera/visual inference object detection.

## Simulate the RFID read
Use the following two curl commands to cause the Xpert service to think that an RFID reader has read an RFID tag for a product (in this case for a bottle of Coke)

```
    curl -s -o /dev/null -w "%{http_code}" -X PUT http://172.27.20.75:59882/api/v2/device/name/RFIDScanner/product_id -H "Content-Type: application/json" -d '{"product_id":"coke"}'

    curl -s -o /dev/null -w "%{http_code}" -X GET http://172.27.20.75:59882/api/v2/device/name/RFIDScanner/product_id?ds-pushevent=yes
```

## Simulate the Bar Code read
Use the following two curl commands to cause the Xpert service to think that a Bar Code reader has read a bar code for a product (also a bottle of Coke in this example)

```
    curl -s -o /dev/null -w "%{http_code}" -X PUT http://172.27.20.75:59882/api/v2/device/name/BarcodeReader/product_id -H "Content-Type: application/json" -d '{"product_id":"coke"}'

    curl -s -o /dev/null -w "%{http_code}" -X GET http://172.27.20.75:59882/api/v2/device/name/BarcodeReader/product_id?ds-pushevent=yes
```

## Simulate Visual Inference
Use the following MQTT message publishing (using Mosquitto's publishing client) to publish a message containing simulated visual inference results from a camera/OpenVino VI system.  In this example, the publish VI data collection is suggesting that the camera/OpenVino ML system sees a carton of yogart is being published.  The full Base64 of the image frame is removed from the message here for brevity.

```
    {"frame_id":"3ef4e7b1-ae55-4848-bce1-82a8863efdfe", "class_id":"yogart", "probability":"0.5590558850765228","frame":[frame base 64 would go here],"frame_content_type": "image/png"}
```

## See the results

Go to the Xpert Manager UI to see that raw data collection come into the Xpert system.
http://172.27.20.75:9090/data-center

Go to the Corrective Training System user interface to see the discrepancies come in (referred to as discrepancy "packages") and be handled.
http://172.27.20.75:9091/

Go to the Geti instance to see the visual inference training system (and data used to train it) along with tasks such as model retraining that can be kicked off by the Corrective Training System.
https://169.46.23.138

The Geti system is running in the cloud (vs the ORRA lab).

## More
See the execute-xpert-testing.txt for more information, options and details for running other demonstrations in the system.