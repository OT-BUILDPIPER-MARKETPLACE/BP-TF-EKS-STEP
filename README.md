# BP-TF-EKS-STEP

I'll steup EKS using opstree tf module

## Setup
* Clone the code available at [BP-TF-EKS-STEP](https://github.com/OT-BUILDPIPER-MARKETPLACE/BP-TF-EKS-STEP)
* Build the docker image

```
git submodule init
git submodule update
docker build -t ot/tf-eks-step:0.1 .
```

* Perform local testing using the Docker image

#### To apply Terraform changes
```
docker run -it --rm -v $PWD:/src -e WORKSPACE=/src -e CODEBASE_DIR=/ -e TF_CODE_LOCATION=<?> -e AWS_ACCESS_KEY_ID=<?> -e AWS_SECRET_ACCESS_KEY=<?> -e INSTRUCTION=apply ot/tf-eks-step:0.1
```

#### To plan Terraform changes
```
docker run -it --rm -v $PWD:/src -e WORKSPACE=/ -e CODEBASE_DIR=/src -e TF_CODE_LOCATION=<?> -e AWS_ACCESS_KEY_ID=<?> -e AWS_SECRET_ACCESS_KEY=<?> -e INSTRUCTION=plan ot/tf-eks-step:0.1
```
### Using Custom Configurations

* Copy the necessary Terraform configuration files (backend.tf, data_network.tf, output.tf, _override.tf, provider.tf, terraform.tfvars) to the current working directory of the TF_CODE_LOCATION repository.

* Update the files as needed to configure the backend, data network, output values, provider configuration, and variable values for your specific use case.

* Run the Terraform commands mentioned in the "Local Testing" section to apply or plan the network skeleton setup using the updated files.

#### File Configurations

* backend.tf: Configure the backend for remote state storage, such as an AWS S3 bucket and DynamoDB table.

* data_network.tf: Fetch network values from remote state.

* output.tf: Specify the outputs you want to display after the Terraform apply.

* _override.tf: Override any default module settings if necessary.

* provider.tf: Configure the AWS provider with your AWS credentials and region.

* terraform.tfvars: Set the variable values needed for the setup.
