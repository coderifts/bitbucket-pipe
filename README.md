# CodeRifts Bitbucket Pipe

[![License: Proprietary](https://img.shields.io/badge/license-Proprietary-red.svg)](https://coderifts.com/terms/)

Official Bitbucket Pipe for [CodeRifts](https://coderifts.com). Detects breaking API changes on every Pull Request, scores risk, and enforces governance policies.

Works with GitHub, GitLab, Bitbucket, and any CI/CD pipeline.

## Quick Start

```yaml
pipelines:
  pull-requests:
    '**':
      - step:
          name: API Governance
          script:
            - pipe: docker://coderifts/bitbucket-pipe:1.0.0
              variables:
                CODERIFTS_API_KEY: $CODERIFTS_API_KEY
```

## Variables

| Variable | Required | Default | Description |
|---|---|---|---|
| `CODERIFTS_API_KEY` | Yes | — | Your CodeRifts API key |
| `BASE_BRANCH` | No | `main` | Branch to compare against |
| `FAIL_ON_BREAKING` | No | `false` | Fail pipeline on breaking changes |

## Setup

1. Get a free API key at [app.coderifts.com/api/signup](https://app.coderifts.com/api/signup)
2. Add `CODERIFTS_API_KEY` to your Bitbucket repository variables (**Repository settings → Pipelines → Repository variables**)
3. Add the pipe step to your `bitbucket-pipelines.yml`
4. Open a Pull Request that changes an OpenAPI schema

## What You Get

Every Pull Request that modifies an OpenAPI schema receives a governance report with:

- **Risk Score (0–100)** — Revenue impact, blast radius, compatibility, and security scored across 4 dimensions
- **Policy Violations** — Breaking budgets, freeze windows, and approval requirements checked against `.coderifts.yml`
- **Security Analysis** — Auth scheme changes detected with 5 severity levels and OAuth scope tracking
- **Migration Estimates** — Engineering effort and downstream service impact calculated per breaking change
- **Change Intent** — Every change classified as structural, behavioral, security, or performance
- **Confidence Score** — How certain CodeRifts is about each detected change

## Alternative: REST API

If you prefer not to use the Docker pipe, you can call the CodeRifts REST API directly:

```yaml
pipelines:
  pull-requests:
    '**':
      - step:
          name: API Governance
          image: curlimages/curl:latest
          script:
            - |
              curl -sf -X POST https://app.coderifts.com/api/diff \
                -H "Authorization: Bearer $CODERIFTS_API_KEY" \
                -H "Content-Type: application/json" \
                -d "{\"base\": \"main:api/openapi.yaml\",
                     \"head\": \"api/openapi.yaml\"}"
```

## Works Everywhere You Code

This is the Bitbucket Pipelines integration. CodeRifts also works with:

| Platform | How |
|---|---|
| GitHub App | Zero-config, one-click install |
| GitHub Actions | [`coderifts/action@v1`](https://coderifts.com/integrations/github-actions/) |
| GitLab CI | [CI/CD Catalog component](https://coderifts.com/integrations/gitlab/) |
| Bitbucket Pipelines | Docker pipe (this repo) |
| REST API | Bearer token, any CI/CD system |
| CLI | `npx coderifts diff` |
| Web UI | [app.coderifts.com/try](https://app.coderifts.com/try) |

Full integration docs: [coderifts.com/integrations/](https://coderifts.com/integrations/)

## Links

- **Website:** [coderifts.com](https://coderifts.com)
- **Bitbucket docs:** [coderifts.com/integrations/bitbucket/](https://coderifts.com/integrations/bitbucket/)
- **Install GitHub App:** [github.com/apps/coderifts](https://github.com/apps/coderifts)
- **All integrations:** [coderifts.com/integrations/](https://coderifts.com/integrations/)
- **CLI on npm:** [npmjs.com/package/coderifts](https://www.npmjs.com/package/coderifts)

## License

Proprietary. See [Terms of Service](https://coderifts.com/terms/).
