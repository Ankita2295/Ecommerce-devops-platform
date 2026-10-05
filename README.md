# Ecommerce-devops-platform
# AI-Assisted DevOps Troubleshooter

## Overview

The AI Troubleshooter is an AI-assisted incident analysis service
for the E-Commerce DevOps Platform.

It analyzes:

- Kubernetes logs
- Pod status
- Kubernetes events
- Prometheus metrics
- Deployment information

The service generates:

- Incident severity
- Problem description
- Probable root cause
- Supporting evidence
- Remediation recommendations
- Verification steps
- Rollback recommendation
- Confidence score
- Incident summary

---

## Architecture

GitHub
   |
   v
Jenkins
   |
   v
Docker Build
   |
   v
Kubernetes
   |
   +-------------------+
   |                   |
   v                   v
Prometheus          Application Logs
   |                   |
   +---------+---------+
             |
             v
      AI Troubleshooter
             |
             v
       Root Cause Analysis
             |
             v
     DevOps Recommendation
             |
       +-----+-----+
       |           |
      Fix       Rollback

---

## Requirements

- Python 3.12+
- Docker
- Kubernetes
- Prometheus
- OpenAI API key

---

## Environment Variable

Set:

```bash
export OPENAI_API_KEY="your-api-key"
