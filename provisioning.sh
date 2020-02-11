#!/bin/sh

# Resource Provisioning AWS cli
aws sqs --endpoint-url http://localhost:31004 create-queue --queue-name test-queue
