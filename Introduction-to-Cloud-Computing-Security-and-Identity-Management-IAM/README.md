# Introduction to Cloud Computing – Security & Identity Management (IAM)

This mini project is designed to guide through the intricacies of Amazon Web Services (AWS), specifically focusing on Identity and Access Management (IAM). Before diving into the specifics of IAM, it’s crucial to establish that a basic understanding of cloud computing principles is a prerequisite for this project.

As a recap, it involves delivering computing services over the internet, including servers, storage, databases, networking, software, analytics, and intelligence, to offer faster innovation, flexible resources, and economies of scale.

In this project, we will be working with a hypothetical fintech startup named Zappy e-Bank. This fictitious company represents a typical startup venturing into the financial technology sector, aiming to leverage the cloud's power to innovate, scale, and deliver financial services. The scenario is set up to provide a realistic backdrop that will help us understand the application of AWS IAM in managing cloud resources securely and efficiently.

The Importance of IAM for Zappy e-Bank For Zappy e-Bank, like any company dealing with financial services, security and compliance are paramount. The company must ensure that its data, including sensitive customer information, is securely managed and that access to resources is tightly controlled. AWS IAM plays a critical role in achieving these security objectives by allowing the company to define who is authenticated (signed in) and authorized (has permissions) to use resources.

### IAM will enable Zappy e-Bank to:

Create and manage AWS users and groups, to control access to AWS services and resources securely.

Use IAM roles and policies to set more granular permissions for AWS services and external users or services that need to access Zappy e-Bank' AWS resources.

Implement strong access controls, including multi-factor authentication (MFA), to enhance security.

This project will walk us through setting up IAM for Zappy e-Bank, creating a secure environment that reflects real-world usage and challenges. Through this hands-on experience, we will learn the fundamentals of IAM, how to manage access to AWS resources, and best practices for securing your cloud environment.

### Project Goals and Learning Outcomes

By the end of this project, we will have:

1. Gained a solid understanding of AWS IAM, including users, groups, roles, and policies.

2. Learned how to apply IAM concepts to secure a fintech startup’s cloud infrastructure.

3. Developed practical skills in using the AWS Management Console to manage IAM.

4. Understood the significance of secure access management and its impact on compliance and data security in the fintech industry.

### Project Setup

1. Log in to the AWS Management Console: Use your administrator account to log in.

![Login to the aws management console](./img/Login%20to%20the%20aws%20management%20console.png)

2. Navigate to the IAM Dashboard: Here, you'll manage users, groups, roles, and policies.

![IAM Dashboard](./img/IAM%20dashboard.png)

### Excercises:

### Creating IAM Users

An IAM user is a unique identity within an AWS account that represents a person or service, granting specific permissions to access and interact with AWS resources under controlled and customizable security policies.

Imagine that you have a big, secure building (AWS account) that you own and control. When you first get the keys to this building, you're given a master key (root user) that can open every door, access every floor, and make changes to the building's structure itself.

This master key is powerful, allowing you to do anything from adding new rooms (services) to changing the locks (security settings). However, because this key can do so much, it's also very risky to use it for daily tasks—like if you lost it, someone could do anything they want with your building.

Now, imagine you have specific tasks that need to be done in the building, like cleaning, maintenance, or security checks. You wouldn't give out your master key to every person who needs to do those jobs. Instead, you create specific keys (IAM users) that can only open certain doors or access certain floors. These keys are less powerful but much safer to use for everyday tasks. They ensure that the people holding them can only access the parts of the building they need to do their jobs and nothing more.

Let's set up IAM users for a backend developer, John, and a data analyst, Mary, by first determining their specific access needs.

As a backend developer, John requires access to servers (EC2) to run his code, necessitating an IAM user with policies granting EC2 access.

As a data analyst, Mary needs access to data storage (AWS S3 service), so her IAM user should have policies enabling S3 access.

Considering Zappy e-Bank's plan to expand its team with 10 more developers and 5 additional data analysts in the coming months, it's inefficient to individually create similar policies for each new member. A more streamlined approach involves:

1. Crafting a single policy tailored to each role's access requirements.

2. Associating this policy with a group specifically designed for that role.

3. Adding all engineers or analysts to their respective groups, simplifying the management of permissions and ensuring consistent access across the team.

### Create policy for the Development team

1. In the IAM console, click on policies

2. Click on create policy

![create Policy](./img/Create%20policy.png)

3. In the select a service section, search for ec2

![Select a service](./img/Select%20a%20service.png)

4. For simplicity sake, select the "All EC2 actions" checkbox

![EC2 allow action](./img/EC2%20allow%20all%20action.png)

5. Also, make sure to select "All" in the Resources section

![Resource all](./img/Resources%20all.png)

6. Click Next

7. Provide the name developers and description for the policy.

8. Click on Create Policy

![Review and create policy](./img/Review%20and%20create%20policy.png)

Notice that after creating the policy, if you search for "developer" in the search box, you will notice that a number of policies are returned. This highlights the presence of both AWS managed and customer managed policies. AWS managed policies are predefined by AWS and provide permissions for many common use cases, allowing for quick and broad access management across AWS services without the need for custom policy creation like we just did. In contrast, customer managed policies are created and fully controlled by you, allowing for more tailored, specific access controls that can be finely tuned to your organization's requirements.

![Search Developer](./img/Search%20Developer.png)

### Create policy for the Data Analyst team

We will Repeat the process above for the Data Analysts team, but instead of EC2, search for S3. Also name the policy analyst instead of developers. You can give it any description of your choice see below:

1. In the IAM console, click on policies

2. Click on create policy

![Click on create policy](./img/Click%20on%20create%20policy%20.png)

3. In the select a service section, search for S3

4. For simplicity sake, select the "All S3 actions" checkbox

![S3 all action check box](./img/S3%20all%20action%20check%20box.png)

5. Also, make sure to select "All" in the Resources section

6. Click Next

![Resource all S3](./img/resource%20all%20S3.png)

7. Provide the name analyst and description for the policy.

8. Click on Create Policy

![Create policy for Analyst](./img/Create%20policy%20for%20Analyst.png)

Policy created for analyst and available in AWS management by me.

![Policy created by me](./img/Policy%20created%20by%20me.png)

### Create Group for the Development team

1. In the IAM console navigation, select User group and in the top right click Create group

![Create user group](./img/Create%20user%20group.png)

2. Provide a name for the group

3. Attach the developer policy we created earlier to the group. This will allow any user in the Development-Team group to have access to EC2 instances alone

![Attach Developer poliyc](./img/Attache%20Developer%20policy.png)

4. You have successfully created a group and attached a permission policy for any user added to the group to have access to the EC2 instance only. Recall that users in this group will be backend developers only.

![Developmen-team user group](./img/Development-team%20user%20group.png)

### Create Group for the Data Analysts team

Create Group for the Data Analysts team Repeat the process above for the Data Analysts team.

i. The Group name should be Analyst-Team

ii. Instead of attaching developers policy, attach analyst policy.

Recall that you only allowed S3 access for this policy. So any user in this group will have access to S3 Service. In our case, our users will be the data analysts.

1. In the IAM console navigation, select User group and in the top right click Create group

2. Provide an a name for the group

3. Attach the analyst policy we created earlier to the group. This will allow any user in the Analyst-Team group to have access to S3 alone.

4. You have successfully created a group and attached a permission policy for any user added to the group to have access to the S3 only. Recall that users in this group will be Data Analyst only.

![analyst team user cfeated](./img/Analyst%20team%20user%20created.png)

### Creating IAM User for John

Let's recall that John is a backend developer, therefore he need to be added as a user to the Development-Team group

Navigate to the IAM dashboard, select "Users" and then click "Create user".

![User](./img/User.png)

Review the highlights in the screenshot

Provide the name of the user. In this case "John"

Ensure that the user can access the AWS Management Console. If this is not selected, the user will not be able to login from the web browser.

![User details](./img/User%20details.png)

Permissions: Add user John to the development team group.

![Set permission](./img/Set%20permission.png)

Click on Create user

![Review and create user](./img/Review%20and%20create%20user.png)

Download the login credentials for John

![Download login credentials for John](./img/Download%20login%20credentials%20for%20john.png)

### Creating IAM User for Mary

Repeat the same step for Mary. But recall that Mary is a Data analyst, which means she need to be added as a user to the Analyst-Team group

Navigate to the IAM dashboard, select "Users" and then click "Create user".

![User for mary](./img/User%20for%20mary.png)

Review the highlights in the screenshot

Provide the name of the user. In this case "Mary"

Ensure that the user can access the AWS Management Console. If this is not selected, the user will not be able to login from the web browser.

![Name of user Mary](./img/Name%20of%20user%20mary.png)

Permissions: Add Mary to the Analyst team group.

![Permission Mary](./img/Permission%20Mary.png)

Click on Create user

![Create user Mary](./img/Create%20user%20Mary.png)

Download the login credentials for Mary

![Download login credentials for Mary](./img/Download%20login%20credentials%20for%20Mary.png)

Both user John and Mary created

![Both user John and Mary created](./img/Both%20user%20John%20and%20Mary%20created.png)

### Testing and Validation

#### Testing John's Access

Login as John: Use the credentials provided to John to log into the AWS Management Console. This simulates John's user experience and ensures he has the correct access.

John AWS Dashbaord

![John dashboard](./img/John%20dashboard.png)

Access EC2 Dashboard: Navigate to the EC2 dashboard within the AWS Management Console. John should be able to view, launch, and manage EC2 instances as his role requires access to servers for deploying and managing backend applications.

![John EC2 Instances dashboard](./img/John%20EC2%20Instatnces%20dashboard.png)

Perform EC2 Actions: Attempt to create a new EC2 instance or modify an existing one to confirm that John has the necessary permissions. If John can successfully perform these actions, it indicates his IAM user has been correctly set up with the appropriate policies for a backend developer.

![John EC2 instance running](./img/John%20EC2%20instances%20running.png)

### Testing Mary's Access

Login as Mary: Use the credentials provided to Mary to log into the AWS Management Console. This ensures that Mary's user experience is as expected and that she has the correct access.

![Mary access](./img/Mary%20Access.png)

Access S3 Dashboard: Navigate to the S3 dashboard within the AWS Management Console. Mary should be able to view, create, and manage S3 buckets as her role requires access to data storage for analyzing and managing data.

Mary S3 dashboard

![Mary S3 dashboard](./img/Mary%20S3%20dashboard.png)

Perform S3 Actions: Try to create a new S3 bucket or upload data to an existing bucket to verify that Mary has the necessary permissions. Successful execution of these tasks will confirm that Mary's IAM user has been properly set up with the appropriate policies for a data analyst.

![Mary S3 bucket](./img/Mary%20S3%20bucket.png)

### Validating Group Policies
For both users, ensure that their access is confined to their role-specific resources (EC2 for John and S3 for Mary) and that they cannot access other AWS services beyond what their group policies permit. This validation ensures adherence to the principle of least privilege, enhancing security by limiting access to only what is necessary for each user's role.

John Can not create Bucket as shown below:

![John failed to create bucket](./img/John%20failed%20to%20create%20bucket.png)

Mary can not create EC2 instance

![Mary Cannot create EC2 instance](./img/Mary%20cannot%20create%20EC2%20instance.png)

### Implement Multi-Factor Authentication (MFA)

Now that you have created a new users. Let's create Multi-Factor Authentication for John. But before we to that, what is MFA ?

Multi-Factor Authentication (MFA) is a security feature that adds an extra layer of protection to our AWS account and resources. With MFA enabled, users are required to provide two or more forms of authentication before they can access AWS resources.

John, the backend developer, logs into the AWS Management Console to access EC2 instances for deploying and testing his code. However, to further secure his access, Zappy e-Bank requires John to use MFA in addition to his regular username and password.

When John attempts to log in, after providing his username and password, AWS prompts him to enter a one-time code generated by an MFA device.

### Setting Up MFA for John

1. CLick on User and then click on john. We already created a user account for john

![Setting up MFA for John](./img/Setting%20up%20MFA%20for%20John.png)

2. Click on enable MFA as shown in the image below

![Click on enable mfa](./img/Click%20on%20enable%20mfa.png)

3. Enter a device name for john MFA and select authenticator app

![Enter a device name for John](./img/Enter%20a%20device%20name%20for%20john.png)

Note: You should install authenticator app like Google authenticator or microsoft authenticator on your mobile device if you don't have it installed which I already have.

4. Click on Next

5. Open your Google authenticator or microsoft authenticator application on your mobile device to scan the QR Code, then you can fill in the 2 consecutive codes as shown in the image below

6. By completing step 1-5, MFA will be enabled for john

![Enabling MFA for John](./img/Enabling%20MFA%20for%20John.png)

### Setting Up MFA for Mary

Lets repeat the same step for Mary

1. CLick on User and then click on Mary. We already created a user account for Mary

![Setting up MFA for Mary](./img/Setting%20up%20MFA%20for%20Mary.png)

2. Click on enable MFA as shown in the image below

![Click on enable mfa for Mary](./img/Click%20on%20enable%20mfa%20for%20Mary.png)

3. Enter a device name for Mary MFA and select authenticator app

![Enter a device name for Mary MFA](./img/Enter%20a%20device%20name%20for%20Mary%20MFA.png)

4. Click on Next

5. Lets open our microsoft authenticator application on our mobile device to scan the QR Code, then you can fill in the 2 consecutive codes as shown in the image below

![set up a device for Mary](./img/Set%20up%20a%20device.png)

6. By completing step 1-5, MFA will be enabled for Mary.

![Adding MFA for Mary](./img/Adding%20MFA%20for%20Mary.png)

### Project reflection

1. Explain the Role of IAM in AWS: Describe the purpose of Identity and Access Management (IAM) in Amazon Web Services and how it contributes to the security and efficient management of cloud resources.

2. Differentiate Between IAM Users and Groups: Discuss the differences between IAM users and IAM groups within the context of AWS. Provide examples of when you would create an IAM user versus when you would organize users into groups.

3. Describe the Process of Creating IAM Policies: Explain the steps involved in creating a custom IAM policy for a specific role within an organization. Include details on selecting permissions and attaching the policy to users or groups.

4. Explain the Significance of the Principle of Least Privilege: Describe what the principle of least privilege means in the context of IAM and AWS, and why it is important for maintaining security in cloud environments.

5. Reflect on the Scenario with John and Mary: Based on the hands-on project setup for John (backend developer) and Mary (data analyst), outline the specific IAM configurations (users, groups, policies) created for each role. Discuss how these configurations align with their job functions and the principle of least privilege.

END.






