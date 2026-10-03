# AI-Assisted DevOps Troubleshooting

The AI component should operate as a read-only incident-analysis assistant initially.

## Inputs

- Prometheus metrics
- Kubernetes pod/deployment state
- Kubernetes events
- Application logs
- Recent deployment metadata
- Git/Jenkins build information

## Structured output

```json
{
  "incident": "High HTTP 5xx",
  "severity": "critical",
  "observations": [],
  "possible_causes": [],
  "evidence": [],
  "recommended_actions": [],
  "requires_human_approval": true
}
```

## Safety

The AI should not automatically execute destructive operations.

Recommended workflow:

Alert -> Gather evidence -> AI analysis -> Human review -> Remediation/Rollback -> Verification
