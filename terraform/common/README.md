# module common

Repository of devops resources for common layer.

## Overview

Creates common AWS resources used by the application layer.


Creates application load balancers, listeners, cloudwatch logs, security groups, ssm documents.

This is run as separate terraform run with a separate state file.

The purpose is to not have to destroy and recreate these when we destroy and recreate the application states.

## Requirements

Core Layer must be setup

## Setup and Usage


## Output

the security ids

## Troubleshooting


## Outstanding Issues
