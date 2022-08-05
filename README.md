# A CI/CD Pipeline On AWS Platform Using Terraform & Jenkins

## Project's Description

- Project aim is to build a two CI/CD pipeline on a AWS Platform
- The first pipeline is for building the infrastructure
- The seconed pipeline is for building and deploying the nodeJS application
- Building a docker image from a nodejs application
- Using Dockerhub as our image repository to push the image to it

## Requirments

1. Linux os, Windows or Mac os  
2. A valid AWS account  
3. Docker to be installed on your machine 
4. Deploy jenkins as container on your machine  [ Setup ](https://davelms.medium.com/run-jenkins-in-a-docker-container-part-1-docker-in-docker-7ca75262619d) 


## Building Network infrastructure using terraform 

1. Creating a vpc 

2. Created four subnets (two puplic subnets & two private subnets) 

3. The bastion host is placed in a puplic subnet as it will later it will <br />
    be used as an ssh jump host to the jenkins slave

4. The nodeJS application server is deployed in one of the private subnets

5. allowing the http and ssh inboud internet access to the public subents

6. Denying all inboud internet access to the private subents

7. Created a nat-gateway in order that my resources in the private subnets <br />
   can access the internet safely<br /> 
![](./images/network.png "The example")


## Steps
1. Go to the `Terraform code` directory then Run `terraform apply --var-file dev.tfvars` in the terminal <br />
   to start the project <br />
   Note: <br />
   Before you run the command you need firstly to change some values passed in the `dev.tfvars` in order to <br />
   connect to your project properly

2. Connect to the newly created bastion host `gcloud compute ssh gke-bastion  --project=omar-gcp-project-1` <br />
   Note that: <br />
   there is no puplic ip added so gcloud will use the IAP tunneling to reach the bastion host <br />
     
3. Authenticate your account with the gcloud tool `gcloud auth login` it will pop up a browswer page  <br /> 
   where you can login with your gcp account

4. Inside the `jenkins_deployment` directory you will find deployments, service templates files which will <br />
   be used to create jenkins master pod to build the pipline

5. The bastion host  communicate with Master node due to the a startup script `startup_script.sh`  <br />
    Note That: <br /> 
    the startup script installs kubectl tool which is used to communicate with Master node, moreover <br />
    we created a service account with `container.admin` premission to have full access to the gke <br />
    cluster and attached it to the bastion host while creating the bastion host from the terraform <br />
    code

6. Now copy the kubernetes yaml files found in templates folder from your local machine to your <br />
    bastion host, type in the terminal: <br />
    `gcloud compute scp --recurse ../jenkins_deployment gke-bastion:~/ --project=omar-gcp-project-1` <br />
    Note that: <br />
    `gke-bastion` is the name of the bastion host

7. Authenticate the kubectl with the gke cluster `gcloud container clusters get-credentials  my-gke-cluster `
    Note that: <br />
    `my-gke-cluster` is the name of the cluster 

8. Change directory to `jenkins_deployment` by typing `cd ./jenkins_deployment`

9. Inside the bastion host create the namespace that jenkins will run on `kubectl create namespace master`


10. Inside the bastion host create the namespace that the deployed application will run on `kubectl create namespace dev`


11. Now run the following command to start all deploymet and service files. `kubectl create -Rf .`<br />

12. wait 1-2 minutes for the the jenkins pod to be running then run `kubectl get svc -n master`<br />
![](./images/svc.png "svc")

13. You need to get the initial admin password `kubectl logs [pod-id] -n master `.<br />
![](./images/pass.png "admin password")

12. Copy the  `External-ip:8080` address to your browser.<br />
![](./images/browser.png "testing")

13. Now refer to the `README.md` file  inside the `jenkins_deployment` directory to complete <br />
    the installation guide.

## Author

[Omar Kamal ](https://www.linkedin.com/in/omar-soliman-617188208/)
