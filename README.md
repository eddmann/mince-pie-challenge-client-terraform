# Mince Pie Challenge Client Infrastructure

📝 [API](https://github.com/eddmann/mince-pie-challenge-api-serverless) - 🖥️ [Client](https://github.com/eddmann/mince-pie-challenge-client)

This [Terraform](https://www.terraform.io/) configuration demonstrates the following:

- Sets up an [Amazon S3](https://aws.amazon.com/s3/) bucket to store the compiled web-client assets.
- Configures another Amazon S3 endpoint to redirect `www` requests to `non-www`.
- Places [Amazon CloudFront](https://aws.amazon.com/cloudfront/) in-between the client and S3 bucket requests, managing static asset caching and HTTPS termination.
- Creates the required domain route records needed within [Amazon Route 53](https://aws.amazon.com/route53/).

## Usage

Ensure that you have provided the necessary credentials within a `terraform.tfvars` file, based on ` terraform.tfvars.example`.

```
$ terraform init
$ terraform apply
```
