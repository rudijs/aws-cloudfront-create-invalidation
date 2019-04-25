# Bitbucket Pipelines Pipe: AWS Cloudfront Create Invalidation

Pipe to deploy to Amazon Cloudfront create-invalidation

## YAML Definition

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
- pipe: rudijs/aws-cloudfront-create-invlidation:1.0.0
  variables:
    AWS_ACCESS_KEY_ID: "<string>"
    AWS_SECRET_ACCESS_KEY: "<string>"
    DISTRIBUTION_ID: "<string>"
```

## Variables

| Variable                   | Usage                      |
| -------------------------- | -------------------------- |
| AWS_ACCESS_KEY_ID (\*)     | AWS access key.            |
| AWS_SECRET_ACCESS_KEY (\*) | AWS secret key.            |
| DISTRIBUTION_ID (\*)       | Cloudfront Distribution ID |

_(\*) = required variable._

## Basic example:

```yaml
script:
  - pipe: atlassian/aws-s3-deploy:0.2.4
    variables:
      AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
      AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
      DISTRIBUTION_ID: $DISTRIBUTION_ID
```
