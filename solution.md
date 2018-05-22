# Solution 

## 1. Set up Dokku in AWS with Terraform

You can find the configuration to setup dokku in the folder terraform.
It will create in AWS a virtual machine (EC2 Ubuntu 16.04) with Dokku.

### Requirements:
  - Terraform in your local machine
  - API AWS ACCESS: access_key and secret_key
  - Private key for ssh connexion with the VM.
  
### Configuration in terraform

#### Variables file

You can find or add there all the keys and another variables as region in aws, ...

#### Main file: Dokku.tf

Defined the provider aws with two resource the aws_instance and a elastic ip.
In the aws_instance is defined the ami, type and a connexion for the provisioner.
With the provisioner Dokku is installed.

### Extra steps

Set up the Dokku ssh key in the web.
  
## 2. Dockerfile

For create a docker image of our node-sample-app we need a Dockerfile.

 - Define the base image for nodejs
 - Create a workdir
 - Copy the packcage.json
 - Install dependencies
 - Copy the code
 - Expose the port of the container
 - Run npm start
 
## 3. CI

### Create an account in Circle CI

https://circleci.com/ 

### Connect with GitHub

Automatically done using the sing up with github 

### Build a project

Once the project is in github, we just need to find the project in circleci and click in Build.

### Connect CircleCI with Dokku

- Create a ssh key in dokku
- Add the ssh key in CircleCI.
- Create circle.yaml with a deplyoment that make the push to dokku.
 
## 4. URL
 
http://18.207.17.46:3000/ 




