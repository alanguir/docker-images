#!/bin/bash

set -m

/entrypoint.sh couchbase-server &

sleep 15

curl -v -X POST http://127.0.0.1:8091/pools/default -d memoryQuota=512 -d indexMemoryQuota=256 -d ftsMemoryQuota=256
curl -v http://127.0.0.1:8091/node/controller/setupServices -d services=kv%2Cn1ql%2Cindex%2Cfts
curl -v http://127.0.0.1:8091/settings/web -d port=8091 -d username=SDKAdmin -d password=Onstar!23
# curl -v -u Administrator:password -X POST http://127.0.0.1:8091/sampleBuckets/install -d '["travel-sample"]'

fg 1
