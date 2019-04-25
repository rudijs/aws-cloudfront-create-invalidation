# Bitbucket Pipelines Pipe: AWS Cloudfront Create Invalidation

Pipe to deploy to Amazon Cloudfront create-invalidation

## YAML Definition

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
- pipe: docker://rudijs/aws-cloudfront-create-invlidation:1.0.1
  variables:
    AWS_ACCESS_KEY_ID: "<string>"
    AWS_SECRET_ACCESS_KEY: "<string>"
    DISTRIBUTION_ID: "<string>"
    # PATHS: "<string> <string>" # Optional. Space separated one or more paths (ex: "/index.html /404.html"). Default is '/*' (everything)
```

## Variables

| Variable                   | Usage                               |
| -------------------------- | ----------------------------------- |
| AWS_ACCESS_KEY_ID (\*)     | AWS access key.                     |
| AWS_SECRET_ACCESS_KEY (\*) | AWS secret key.                     |
| DISTRIBUTION_ID (\*)       | Cloudfront Distribution ID.         |
| PATHS                      | Cloudfront paths to be invalidated. |

_(\*) = required variable._

## Basic examples:

Invalidate entire cache:

```yaml
script:
  - pipe: docker://rudijs/aws-cloudfront-create-invlidation:1.0.1
    variables:
      AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
      AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
      DISTRIBUTION_ID: $DISTRIBUTION_ID
```

Invalidate selected files:

```yaml
script:
  - pipe: docker://rudijs/aws-cloudfront-create-invlidation:1.0.1
    variables:
      AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
      AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
      DISTRIBUTION_ID: $DISTRIBUTION_ID
      PATHS: $PATHS
```

## Example building a GatsbyJS static site, deploy to S3, invalidate Cloudfront cache

```yaml
image: node:10.15.3

pipelines:
  default:
    - step:
        name: Build Static Site
        deployment: production # can be test, staging or production
        script:
          - cd website
          - npm install
          - npm run build
          - pipe: atlassian/aws-s3-deploy:0.2.4
            variables:
              AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
              AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
              AWS_DEFAULT_REGION: "ap-southeast-1"
              S3_BUCKET: $S3_BUCKET
              LOCAL_PATH: "public"
              DELETE_FLAG: "true"
          - pipe: docker://rudijs/aws-cloudfront-create-invalidation:1.0.2
            variables:
              AWS_ACCESS_KEY_ID: $AWS_ACCESS_KEY_ID
              AWS_SECRET_ACCESS_KEY: $AWS_SECRET_ACCESS_KEY
              DISTRIBUTION_ID: $DISTRIBUTION_ID
```
