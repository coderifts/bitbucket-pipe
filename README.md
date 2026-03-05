# CodeRifts Bitbucket Pipe

Detect breaking changes in OpenAPI schemas on every Bitbucket pull request.

This pipe uses the [CodeRifts CLI](https://www.npmjs.com/package/coderifts) to analyze OpenAPI spec changes and report breaking changes, risk scores, and policy violations directly in your Bitbucket pipeline.

## Usage

Add the following to your `bitbucket-pipelines.yml`:

```yaml
pipelines:
  pull-requests:
    '**':
      - step:
          name: CodeRifts API Governance
          script:
            - pipe: docker://coderifts/bitbucket-pipe:1.0.0
              variables:
                CODERIFTS_API_KEY: $CODERIFTS_API_KEY
                FAIL_ON_BREAKING: "true"
```

## Setup

1. Get a free API key at [app.coderifts.com/api/signup](https://app.coderifts.com/api/signup)
2. Add `CODERIFTS_API_KEY` as a repository variable in **Repository settings → Pipelines → Repository variables**
3. Add the pipeline config above to your `bitbucket-pipelines.yml`
4. Every pull request will now run a CodeRifts check

## Variables

| Variable | Required | Default | Description |
|---|---|---|---|
| `CODERIFTS_API_KEY` | Yes | — | CodeRifts API key. Get one free at [coderifts.com](https://app.coderifts.com/api/signup). |
| `BASE_BRANCH` | No | `main` | Base branch to compare against. |
| `FAIL_ON_BREAKING` | No | `true` | Fail the pipeline when breaking changes are detected. |

## What It Does

On every pull request, CodeRifts:

- Detects 10 types of breaking changes (endpoint removals, type changes, required field additions, etc.)
- Calculates a risk score (0–100) across 4 dimensions
- Checks policy violations (breaking budgets, freeze windows, no-delete rules)
- Runs security analysis (auth changes, sensitive field exposure)
- Fails the pipeline if breaking changes exceed your configured threshold

## Links

- [CodeRifts Website](https://coderifts.com)
- [Bitbucket Integration Guide](https://coderifts.com/integrations/bitbucket/)
- [Documentation](https://coderifts.com/docs/)
- [CLI on npm](https://www.npmjs.com/package/coderifts)

## License

Proprietary. See [Terms of Service](https://coderifts.com/terms/).
