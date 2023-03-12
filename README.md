#Dockerized Node.js Application on AWS EC2 with Autoscaling, Load Balancing, and Log Archival

This is a guide to deploy a Dockerized Node.js application on AWS EC2 instances with autoscaling, load balancing, and log archival. The application we are going to use is the express-example-app available at https://github.com/strongloop/express-example-app/blob/master/index.js.

# The solution uses the following AWS services:

EC2 instances running Docker containers to host the Node.js application

Application Load Balancer to distribute the incoming traffic across the EC2 instances

Auto Scaling Group to scale the EC2 instances up or down based on CPU usage

CloudWatch Alarms to monitor the health of the application and notify if there are any issues

S3 bucket to archive the application logs


#Cost Analysis#

The cost of running this solution depends on the following factors:

The number and type of EC2 instances used
The data transfer costs for incoming and outgoing traffic
The storage costs for the S3 bucket
EC2 Instance Costs
The cost of running EC2 instances depends on the instance type, region, and the number of instances used. For this solution, we are going to use t2.micro instances with on-demand pricing, which cost $0.0116 per hour. Assuming we run 2 instances 24/7 for a month, the cost would be:
 ### $0.0116 * 2 * 24 * 30 = $16.69 ###
 
 If we use spot pricing instead of on-demand pricing, the cost can be significantly reduced. For example, at the time of writing this README, the spot price for t2.micro instances in the us-east-1 region is around $0.002 per hour. This would reduce the cost to:
 ###$0.002 * 2 * 24 * 30 = $2.88###


# Load Balancer Costs #

The Application Load Balancer charges based on the number of Load Balancer Capacity Units (LCUs) used per hour and the amount of data processed. For this solution, assuming a low amount of traffic, we can use a single LCU and pay $0.008 per hour. Assuming we use the Load Balancer for the same amount of time as the EC2 instances, the cost would be:
###$0.008 * 24 * 30 = $5.76###

# Data Transfer Costs #

The data transfer costs depend on the amount of data transferred between the EC2 instances and the internet, and between the Load Balancer and the internet. For this solution, we assume a low amount of traffic, so the data transfer costs should be minimal.

# S3 Storage Costs #

The cost of storing data in S3 depends on the amount of storage used and the storage class used. For this solution, we are going to use the STANDARD storage class, which costs $0.023 per GB per month. Assuming we store 1 GB of data per month, the cost would be:
###$0.023 * 1 = $0.023###

