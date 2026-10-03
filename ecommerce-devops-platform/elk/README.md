# Centralized Logging

This directory is reserved for an ELK deployment.

Recommended production flow:

Application -> Fluent Bit/Filebeat -> Logstash -> Elasticsearch -> Kibana

For the lightweight local demonstration, the application logs to stdout so Docker/Kubernetes can collect them.

Useful commands:

kubectl logs -n ecommerce deploy/ecommerce-app
docker logs ecommerce
