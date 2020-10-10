# packer

```
                     IMAGE BUILD PROCESS

             +-----------+          +-----------+          +----------+
             |           |          |           |          |          |
             |           |          |           | ami-9999 |Terraform |
nginx   +----> Packer    +----------> Amazon    +---------->   app    |
.json        |           |          |  AMI      | parameter|          |
             |           |          |           |          |          |
             |           |          |           |          |          |
             +-----------+          +-----------+          +----------+
```

repository of packer resources.

Only a small number of servers are created via packer images.


## bootstrap

this is the bootstrap file passed as user-data when an aws instance is created by packer. It does things at startup like enable winrm.

## files

files used by the packer typically copied to the server being provisioned.

## provisioner

These as the scripts referenced in the packer template to install and config the required software.
Currently we have just a bash script.

## Installing Packer

Packer is simple to install. it has no dependencies.

Download windows 64 bit packer from https://www.packer.io/downloads.html

unzip and store the packer.exe in a folder on your windows path

## Running Packer

Run Packer in the AWS Account where we want to store the image


##  web_node.json

parker image to build nginx image. this uses a base ubuntu image.
base images can be found on AWS marketplace https://aws.amazon.com/marketplace.


in a command window
```
set AWS_PROFILE=xxxxxx_test
set AWS_DEFAULT_REGION=eu-west-1
```

to get debugging output add the following variables:
```
set PACKER_LOG=1
set PACKER_LOG_PATH=packerlog.txt
```
cd to this packer folder

to validate the config for base server:
```
packer validate  web_node.json
```
to build an image for base server (takes about 20 mins):
```
packer build  -debug  web_node.json
```

##  app_node.json

parker image to build go image. this uses a base ubuntu image.
base images can be found on AWS marketplace https://aws.amazon.com/marketplace.

## Naming Conventions

Need name convention for image names.

Need tag naming conventions.


## Image Heriarchy

In theory you can have 3 types of images.

1. Base Image - this is an image that all servers are built on.

2. Infrastructure Image - this image is build from the base image and has all the software required to run the application apart from the appication itself.

3. Application Image - This is an optional image that can be built by installing the application on to the Infrastructure image. This allows
   for faster autoscaling at the expense of longer built process.
