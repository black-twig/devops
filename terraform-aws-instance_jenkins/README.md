# KPI_DevOps_Task4_Terraform_Jenkins

## Create AWS EC2 instance with UserData (Pull docker Jenkins image and start Jenkins server)

### Write Terraform configuration

Create a directory for your configuration:
```
$ mkdir terraform-aws-instance_jenkins
```

Change into the directory:
```
$ cd terraform-aws-instance_jenkins
```

Create the main Terraform file where the code that describes the AWS cloud provider with necessary resources will be placed:
```
$ touch main.tf
```

We need to install docker and run Jenkins server in a container once our instance launches. The user_data argument is used to achieve this. So, create the .sh file where a corresponding script will be provided and pass that to the user_data argument:
```
$ touch install_docker_jenkins.sh
```

Create a file called `variables.tf` where would be declared some important variables:
```
$ touch variables.tf
```

Variables, or Input Variables, or Terraform Variables, serve as parameters for a Terraform module. Some important terms used while declaring variables:
1. `variable`: We can declare the variables within a variable block followed by a unique name.
2. `description`: We can set a brief description for the variable.
3. `default`: Requires a literal value. If present, the default value will be used to set the value for the variable when calling the module or running Terraform.

In this lab there are declared variables necessary for creating AWS instance.

Create an outputs.tf file to display some important information regarding the created resources on their successful completion:
```
$ touch outputs.tf
```

Open  created files in your foavourite editorand provide necesary script into them.

The scipt `install_docker_jenkins.sh` cosists of three main parts:
- install the docker engine on the created AWS instance 
- configure docker as service
- download and install jenkins server image

Now the Terraform configuration is ready to be used.

### Initialise the directory with created Terraform configuration
For new configuration, or checked out an existing configuration from version control — we need to initialise the directory with terraform init command.
```
$ terraform init
```

###  Format and validate the  configuration
Format the configuration. Terraform will print out the names of the files it modified, if any. 
In a case when the configuration file was already formatted correctly Terraform won't return any file names:
```
$ terraform fmt
```

Also, to make sure your configuration is syntactically valid and internally consistent, we can use the validate command to check if the terraform configuration is correct:
```
$ terraform validate
```

### Executing Plan and Applying the Changes

Now we can generate the execution plan by running the plan command and checking if everything is as expected:
```
$ terraform plan
```

Once confirmed, we can proceed with the apply command to provision a new or apply the changes to existing infrastructure:
```
$ terraform apply
```

On successful applications, we will get the public DNS and IP address of the instance created by Terraform that you can use to log in using SSH (there will be also outputted commands to connect to instance and get the Jenkins administrative key value).
After logging in using,  run `docker ps` command and see the running Jenkins container.


Useful resources:

https://faizanbashir.me/building-an-nginx-webserver-on-aws-using-terraform

https://developer.hashicorp.com/terraform/language

https://docs.docker.com/engine/install/ubuntu/#installation-methods 

https://github.com/jenkinsci/docker/blob/master/README.md
