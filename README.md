# XECM - ARM

This is a simple project showing the deployment of resources into Azure and the scripts to deploy code into those VMs.

There were a few challenges that had to be solved:

## Deployment

Using Azure CLI 2.0 run the following commands:

```bash
az group create --location eastus2 --name pelasne-armtest
az group deployment create --resource-group pelasne-armtest --template-file main.json --parameters @param.json --parameters adminPassword=Password0000++++
```

## Password couldn't be passed at runtime

The syntax above will set the password to "Password0000++++", the problem seemed to be with the version of CLI that was being used, after upgrading to v2.0.9+dev then it worked fine.

## Installation of JRE + Tomcat

A Windows VM can only have 1 VM Extension, so it was necessary to combine the JRE and Tomcat installation scripts.