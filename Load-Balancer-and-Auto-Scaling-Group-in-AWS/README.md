# Mini Project: Configuring Auto Scaling with ALB using Launch Template

### Purpose:

In this mini project, we will learn how to configure Auto Scaling in AWS with an Application Load Balancer (ALB) using a Launch Template. The project aims to demonstrate the automatic scaling of EC2 instances based on demand, while leveraging the benefits of a Launch Template.

### Objectives:

1. Create Launch Template:

Learn how to create a Launch Template with the required specifications.

2. Set Up Auto Scaling Group:

Configure an Auto Scaling group to manage the desired number of EC2 instances using the Launch Template.
Configure Scaling Policies:

Set up scaling policies to adjust the number of instances based on demand.
Attach ALB to Auto Scaling Group:

Connect the Auto Scaling group to an existing ALB.
Test Auto Scaling:

Verify that the Auto Scaling group adjusts the number of instances in response to changes in demand.

## Project Tasks:

### Task 1: Create Launch Template**

1. Log in to the AWS Management Console.

2. Navigate to the EC2 service.

![EC2 service](./img/EC2.png)

3. In the left navigation pane, click on "Launch Templates."

![Launch Template](./img/Launch%20Template.png)

4. Click the "Create launch template" button.

![Create Launch Template](./img/Create%20Launch%20template.png)

5. Configure the launch template settings, including the AMI, instance type, and user data

![Configure Launch template 1](./img/Configure%20Launch%20template%201.png)

![Configure Launch template 2](./img/Configure%20Launch%20template%202.png)

![Configure launch template 3](./img/Configure%20launch%20template%203.png)

![Configure Launch template 4](./img/Configure%20Launch%20template%204.png)

![Successfully create lunch template](./img/Successfully%20create%20lunch%20template.png)

### Task 2: Set Up Auto Scaling Group

1. In the AWS Management Console, navigate to the EC2 service.

![EC2 services](./img/EC2.png)

2. In the left navigation pane, click on "Auto Scaling Groups.

![Navigate Autoscaling group](./img/Navigate%20Autoscaling%20group.png)

3. Click the "Create Auto Scaling group" button.

![Select create Autoscaling group](./img/Select%20create%20Autoscaling%20group.png)

4. Choose "Use Launch Template" and select the Launch Template you created.

![Choose Launch template](./img/Choose%20Launch%20template.png)

5. Configure the Auto Scaling group settings, including the group name, desired capacity, and initial instances.

![Instance type requirement](./img/Instance%20type%20requirement.png)

![Integrate with other services](./img/Integrate%20with%20other%20services.png)

![Configure group size and scaling](./img/Configure%20group%20size%20and%20scaling.png)

6. Set up additional configurations such as network settings, subnets, and scaling policies.

![Additional settings](./img/Additional%20settings.png)

![Review top](./img/Review%20top.png)

![Review Middle](./img/Review%20Middle.png)

![Review Bottom](./img/Review%20Bottom.png)

![My-ASG](./img/My-ASG.png)

### Task 3: Configure Scaling Policies

1. In the Auto Scaling group configuration, navigate to the "Scaling policies" section.

![Configure Scaling Policies](./img/Configure%20Scaling%20Policies.png)

2. Click on "Create scaling policy" and configure policies for scaling in and scaling out based on demand.

![Create dynamic scaling policy](./img/Create%20dynamic%20scaling%20policy.png)

### Task 4: Attach ALB to Auto Scaling Group

1. In the Auto Scaling group configuration, navigate to the "Load balancing" section.

![Load balancer](./img/Load%20balancer.png)

![Select Load balancer type](./img/Select%20Load%20balancer%20type.png)

![Create application Load balancer](./img/Create%20application%20Load%20balancer%20top.png)

![Create application Load balancer Middle](./img/Create%20application%20Load%20balancer%20Middle.png)

![Create application Load balance bottom](./img/Create%20application%20Load%20balance%20bottom.png)

![My-ALB](./img/My-ALB.png)

2. Click on "Edit" and select the ALB to associate with the Auto Scaling group.

![Edit autoscaling group](./img/Edit%20autoscaling%20group.png)

![My-target-group-http](./img/My-target-group-http.png)

![My-target-group-http Bottom](./img/My-target-group-http%20Bottom.png)

### Task 5: Test Auto Scaling

1. Generate traffic to trigger scaling policies.

![Traffic](./img/Traffic.png)

![Instances](./img/Instances.png)

Connect to Instance using EC2 Instance Connect

![Connected](./img/Connected.png)

2. Monitor the Auto Scaling group and verify that the number of instances adjusts based on demand.

END.