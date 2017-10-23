### Notes

* This is a fork of [SkeletonThatcher](https://github.com/SkeltonThatcher/aws-terraform-rancher-single-node-ha) using my Makefile setup I modified (more details below ST's README).  Based on [terraform-multienv-example](https://github.com/mike-zipit/terraform-multienv-example)
* I set this up, but did NOT deploy it, so it might require some tweaking 
* You can see the [directory structure here](DIRECTORY.md)
* The setup.sh used:


    ENVIRONMENTS="staging production"
    COMPONENTS="rancher_server rancher_hosts"


# Single Node HA for Rancher Server in AWS

This repo contains Terraform code and supporting scripts to deploy single node HA Rancher server and Rancher hosts in AWS.

The Terraform plan is designed to be applied in two stages. It will build out and deploy the following resources.

* x1 VPC + IGW
* x2 Public subnets
* x2 Private subnets
* RDS DB subnet group
* Single-AZ or Multi-AZ RDS MySQL DB instance
* Application load balancer + listener + target group
* Launch configuration + fixed Multi-AZ auto-scaling group of x1 instance for the Rancher server
* Launch configuration + fixed Multi-AZ auto-scaling group of a specified instance amount for the Rancher hosts
* RancherOS instance with active Docker running a password protected deployment of the latest version of Rancher server
* RancherOS instances with active Docker running the latest version of the Rancher host agent
* Route 53 DNS alias record for the ALB

The estimated deployment time from start to finish is 20-30 minutes.

### Prerequisites

* AWS account
* AWS IAM user account with AWS access/secret keys and permission to create specified resources
* Cygwin (or similar) installed to enable running of .sh scripts if using Windows
* Git installed and configured
* Terraform installed and configured

### How to use the Terraform plan to deploy Rancher server and Rancher hosts

#### Version advisories

* RancherOS v0.9.1
* Rancher server v1.5.3
* Rancher agent v1.2.1

#### Stage One

* Clone the repo
* Create an EC2 keypair in AWS
* Create an S3 bucket to hold remote state
* Update `init.sh` with the S3 bucket name
* Run `init.sh` to initialise remote state
* Create `terraform.tfvars` in the root of the cloned folder (see `terraform.tfvars.example`)
* Set `hst_max`, `hst_min` and `hst_des` in `terraform.tfvars` to zero (0)
* Make up a temporary reg_token in `terraform.tfvars`
* Run `terraform plan` from the root of the folder
* Run `terraform apply` from the root of the folder
* Wait until the installation has completed
* Access Rancher server at the displayed output URL
* Log in with the name and password specified in the `terraform.tfvars` file

#### Stage Two
* Enable hosts registration from within Rancher and copy the token from the registration string. The token will be in the format similar to `6C8B0D1B2E95DD1AA07A:1483142400000:PKQGzShMCv3wtD02DvlU4MkBY0`
* Update `reg_token` in `terraform.tfvars` with the registration token
* Update `hst_max`, `hst_min` and `hst_des` in `terraform.tfvars` with the max, min and desired amount of host instances
* Re-run `terraform plan`
* Re-run `terraform apply`
* The launch configuration will be replaced with a new version and applied to the auto scaling group
* The specified amount of host instances will launch and register with the Rancher server

#### How to remove
* To remove all deployed resources run `terraform destroy`

### Supplemental
*  [Container Clustering with Rancher Server (Part 5) – Automating the deployment of AWS infrastructure and Rancher with Terraform](https://skeltonthatcher.com/blog/container-clustering-rancher-server-part-5-automating-deployment-aws-infrastructure-rancher-terraform/)

### Licence

Copyright (c) 2017 Skelton Thatcher Consulting Ltd.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

### Acknowledgments

* Based on works produced by [George Cairns](https://www.linkedin.com/in/george-cairns-9624b621/) from [Automation Logic](http://www.automationlogic.com/)


===================== [ Additions by Mike Crowe ] =====================

# Introduction

After reviewing the Makefile used here by [the Rancher team](https://github.com/rancher/terraform-modules/blob/master/example_ha/aws/Makefile), I realized this was how I wanted to segregate my setups, rather than using something like terragrunt.  At a high level, I wanted:

* Different environments (staging, production) with the ability to use different classes of machines
* Shared setup of the *.tf files
* Ability to use different AWS acccounts (potentially) for each environment

This is that system.  Here's the effective directory setup:

NOTE:  At various times, I refer to Components and Modules.  Heres' how I see the different:

* Component -- This is a group of terraform files you run together.  For instance, the [the Rancher team](https://github.com/rancher/terraform-modules) broke their setup into 3 stages/components:  network, database, compute (mgmt)
* Modules -- These are 3rd party modules you use in each component

Within each environment (staging, production, etc), the only static files are typically `terraform.tfstate` (and backup).  Everything else is a simlink.

### Setup / Updating

* All your global variables end go in `common/variables.tf` that will be used throughout your application.  These will be instantiated in 2 different places
  * Global variables across all environments will be at `environment/terraform.tf`
  * Enter the environment specific variables in each environment-specific tfvars file.  For instance, you may have something like this:
    * `environment/staging/staging.tfvars`: `aws_instance_type = "t2.small"`
    * `environment/production/production.tfvars`: `aws_instance_type = "c4.2xlarge"`
* If you add new terraform.tf files to the common/* directory, they will automatically be included during your make commands

### Make targets

    plan:           Run terraform plan
    plan-output:    Run terraform plan and save output to a plan file
    plan-landscape: Run terraform plan and route the output thru landscape
    plan-destroy:   Run terraform plan -destroy and create a plan destroying your infrastructure 
    apply-plan:     Run terraform apply with using the PLAN environment variable


* landscape:  [Nice formatter for terraform output](https://github.com/coinbase/terraform-landscape)

### Running

    cd environment/staging/network
    make plan-output
    // (If all goes well, then run)
    PLAN=network-####### make apply-plan

OR, if you're crazy confident:

    rm -f *.plan; make plan-output; PLAN=$(ls -1 *.plan) make apply-plan

### Destroying

The first time I started playing with this makefile, I didn't get how to destroy things.  Turns out, it follows the same patter:

    cd environment/staging/network
    make plan-destroy
    // (If all goes well, then run)
    PLAN=network-####### make apply-plan
    
OR, if you're crazy confident:

    rm -f *.plan; make plan-destroy; PLAN=$(ls -1 *.plan) make apply-plan
  

### Example Directory Struccture

First time `update.sh` is run, I answered the with the following:

* Environments (one line, space separated): __staging production__
* Components (one line, space separated): __network database compute__

At the end, you can see the full directory structure

    .
    ├── common
    │   ├── compute
    │   │   └── main.tf
    │   ├── data.aws-ami-rancheros.tf
    │   ├── data.aws-ami-ubuntu.tf
    │   ├── database
    │   │   └── main.tf
    │   ├── network
    │   │   └── main.tf
    │   └── variables.tf
    ├── environment
    │   ├── production
    │   │   ├── compute
    │   │   │   ├── data.aws-ami-rancheros.tf -> ../../../common/data.aws-ami-rancheros.tf
    │   │   │   ├── data.aws-ami-ubuntu.tf -> ../../../common/data.aws-ami-ubuntu.tf
    │   │   │   ├── main.tf -> ../../../common/compute/main.tf
    │   │   │   ├── Makefile -> ../../../Makefile
    │   │   │   ├── modules -> ../../../modules
    │   │   │   ├── provider.tf -> ../provider.tf
    │   │   │   └── variables.tf -> ../../../common/variables.tf
    │   │   ├── database
    │   │   │   ├── data.aws-ami-rancheros.tf -> ../../../common/data.aws-ami-rancheros.tf
    │   │   │   ├── data.aws-ami-ubuntu.tf -> ../../../common/data.aws-ami-ubuntu.tf
    │   │   │   ├── main.tf -> ../../../common/database/main.tf
    │   │   │   ├── Makefile -> ../../../Makefile
    │   │   │   ├── modules -> ../../../modules
    │   │   │   ├── provider.tf -> ../provider.tf
    │   │   │   └── variables.tf -> ../../../common/variables.tf
    │   │   ├── network
    │   │   │   ├── data.aws-ami-rancheros.tf -> ../../../common/data.aws-ami-rancheros.tf
    │   │   │   ├── data.aws-ami-ubuntu.tf -> ../../../common/data.aws-ami-ubuntu.tf
    │   │   │   ├── main.tf -> ../../../common/network/main.tf
    │   │   │   ├── Makefile -> ../../../Makefile
    │   │   │   ├── modules -> ../../../modules
    │   │   │   ├── provider.tf -> ../provider.tf
    │   │   │   └── variables.tf -> ../../../common/variables.tf
    │   │   ├── production.tfvars
    │   │   └── provider.tf
    │   ├── staging
    │   │   ├── compute
    │   │   │   ├── data.aws-ami-rancheros.tf -> ../../../common/data.aws-ami-rancheros.tf
    │   │   │   ├── data.aws-ami-ubuntu.tf -> ../../../common/data.aws-ami-ubuntu.tf
    │   │   │   ├── main.tf -> ../../../common/compute/main.tf
    │   │   │   ├── Makefile -> ../../../Makefile
    │   │   │   ├── modules -> ../../../modules
    │   │   │   ├── provider.tf -> ../provider.tf
    │   │   │   └── variables.tf -> ../../../common/variables.tf
    │   │   ├── database
    │   │   │   ├── data.aws-ami-rancheros.tf -> ../../../common/data.aws-ami-rancheros.tf
    │   │   │   ├── data.aws-ami-ubuntu.tf -> ../../../common/data.aws-ami-ubuntu.tf
    │   │   │   ├── main.tf -> ../../../common/database/main.tf
    │   │   │   ├── Makefile -> ../../../Makefile
    │   │   │   ├── modules -> ../../../modules
    │   │   │   ├── provider.tf -> ../provider.tf
    │   │   │   └── variables.tf -> ../../../common/variables.tf
    │   │   ├── network
    │   │   │   ├── data.aws-ami-rancheros.tf -> ../../../common/data.aws-ami-rancheros.tf
    │   │   │   ├── data.aws-ami-ubuntu.tf -> ../../../common/data.aws-ami-ubuntu.tf
    │   │   │   ├── main.tf -> ../../../common/network/main.tf
    │   │   │   ├── Makefile -> ../../../Makefile
    │   │   │   ├── modules -> ../../../modules
    │   │   │   ├── provider.tf -> ../provider.tf
    │   │   │   └── variables.tf -> ../../../common/variables.tf
    │   │   ├── provider.tf
    │   │   └── staging.tfvars
    │   └── terraform.tfvars
    ├── Makefile
    ├── modules
    │   └── example_module_you_will_remove
    ├── README.md
    ├── setup.sh
    └── update.sh
    

