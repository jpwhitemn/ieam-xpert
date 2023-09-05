#!/bin/sh

curl -s -o /dev/null -w "%{http_code}" -X GET http://10.0.0.75:59882/api/v2/device/name/BarcodeReader/product_id?ds-pushevent=yes
