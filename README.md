# smallcorp_example

smallcorp aws terraform example

## Overview

a) Launch 3 separate Linux nodes using terraform
  2 x application nodes
  1 x web node
b) Deploy the sample application to the appropriate nodes

c) Install NGINX on the web node and balance requests in a round-robin fashion


## Steps involved

### 1. build packer image for go code.

- compile go code
- add go runtime and glide package manager to ubuntu image
- create ubuntu image

### 2. terrafom for app_node
app_node - EC2_instance of am AMI_XXXXX    packer useed to create ami from compiles version of go code
with 2 private_ip address in private_vpc

### 3. build an nginx image using packer

create packer ubuntu image  along the lines of

### 4. terraform for web node

web_node - EC2_instance with public ip address with
nginx config over 2 private addresses to round robin of the private ip address on port 8484 in userdata

app_node - 2 EC2 instances with go application
