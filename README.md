**Proof of Concept (PoC) on Terraform, Kubernetes(EKS) and CI/CD**

## **1\. Introduction**

### **1.1 Purpose**

The purpose of this POC is to demonstrate automated infrastructure deployment using Terraform, Jenkins, and Amazon EKS. The project provisions an EC2 instance with Jenkins server installed, which then automates the deployment of an EKS cluster and a WordPress application. This setup showcases the use of Infrastructure as Code (IaC) and CI/CD pipelines for efficient, scalable, and repeatable cloud deployments.

**1.2 Scope** 

The PoC will cover the following:

* Provision and manage AWS infrastructure, including EC2, VPC, EKS, and S3, to deploy and scale a WordPress application on an EKS cluster using Terraform and Jenkins

### **1.3 Objectives**

* Confirm Terraform’s ability to provision and manage AWS resources, including EC2, VPC, and EKS clusters.  
* Illustrate Jenkins role in CI/CD, automating the deployment of applications, specifically a WordPress setup, on an EKS cluster .

## **2\. Terraform, Jenkins and EKS**

* Terraform is an open-source infrastructure-as-code tool that enables users to define and provision infrastructure resources using a declarative configuration language.  
* Jenkins automates the CI/CD pipeline, facilitating the build, test, and deployment of applications through customizable pipelines and integrations. It supports automation across various stages of software development, improving efficiency and consistency.  
*  Amazon EKS is a managed Kubernetes service that simplifies deploying, managing, and scaling containerized applications using Kubernetes. It handles the underlying infrastructure, allowing users to focus on application development and operations.

## **3\. PoC Approach**

### **3.1 Infrastructure Resources(or) services**

**For Jenkins Server:**

* **VPC**: A Virtual Private Cloud with public subnets, and automatic public IP assignment on launch.  
* **Public Subnets**: Public subnets within the VPC, tagged as "jenkins-subnet."  
* **Security Group**: A security group for the Jenkins server with ingress rules allowing HTTP (port 8080\) and SSH (port 22\) from any IP, and egress rules allowing all traffic.  
* **EC2 Instance:** An EC2 instance named "Jenkins-Server" with the specified instance type, associated with the Jenkins security group, deployed in a public subnet, and configured with a Jenkins installation script.	

#### **For EKS:**

* **VPC**: A Virtual Private Cloud.  
* **Public Subnets**: Public subnets within the VPC, **Private Subnets**: Private subnets within the VPC  
* **NAT Gateway**: A single NAT gateway for the VPC.  
* **EKS Cluster**: An Amazon EKS cluster with public endpoint access.  
* **EKS Managed Node Group**: An Amazon EKS managed node group with `t2.small` instance type, configured with minimum, maximum, and desired sizes of 1, 3, and 2 nodes respectively


### **3.2 Terraform Setup**

**Install Terraform**:

* Install terraform on your local machine:- [https://developer.hashicorp.com/terraform/install](https://developer.hashicorp.com/terraform/install)

### **3.3 Cloning the Repo**

* Repo clone:- open your terminal and run this command:-   
                 **git clone [https://github.com/TEJASDP02/EKS-Terraform-Jenkins.git](https://github.com/TEJASDP02/EKS-Terraform-Jenkins.git)**  
* See the below picture for the directory structure of the repository.  



## **4\. Execution**

### **4.1 Initialize Configuration**	

* On the terminal go to this path:- EKS-Terraform-Jenkins/JenkinsServer  
* Run the this command in your local terminal:- **terraform init**  
* **`terraform init`** initializes a Terraform working directory by setting up the backend, installing provider plugins, and preparing modules for use.  



### **4.2 Plan Deployment**

* After initialization run this command:- **terraform plan**




* The above is the output after running the terraform plan.

### **4.3 Apply Configuration**

* After plan is successfully completed, run this command:- **terraform apply**

### **4.4 Evaluation**

* After running the terraform apply, you can check in the aws portal to validate if services are created or not.

### **4.5 Jenkins server setup and job creation**

* You can access the jenkins server using the ip address of the EC2 instance created and complete the initial setup of jenkins.   
* Create a new pipeline(CI/CD) job to automate the deployment of the EKS cluster and a web application on to the EKS Cluster.

 **Snapshots of the pipeline script we have implemented**. (Script is available in the repository)



 **Snapshot containing the overview of steps in the job we are running.**



 **Snapshot of the EKS Cluster created.**



 * You can access the wordpress application deployed using the DNS Name from the load balancer created.(This load balancer is created by the kubernetes service to expose the application to the outside world)



 **Snapshot of the Load balancer created by our deployment.**



 * **Accessing the Wordpress application using the DNS Name provided by the Load balancer**




 ### 

### 

### **4.6. Destroy configuration**


*  **terraform destroy \-** Use this command to delete all the resources which were provisioned using terraform.