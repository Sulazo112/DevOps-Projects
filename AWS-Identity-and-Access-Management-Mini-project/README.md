# AWS Identity and Access Management Mini project

We're going to learn about AWS Identity and Access Management (IAM), which helps control who can access what in Amazon Web Services. We'll cover things like users, roles, policies, and groups, and we'll also show you how to actually set them up to keep your AWS resources safe.

But before we get into all that, let's make sure you understand the basics of cloud computing. If terms like "Cloud" sound new to you, it's a good idea to go back and review some earlier materials to get a solid grasp of what it's all about.

### Project Goals :

1. Understand AWS Identity and Access Management (IAM) principles and components.

2. Learn to create and manage IAM policies for regulating access to AWS resources securely.

3. Apply IAM concepts practically to control access within AWS environments.

4. Explore best practices for IAM implementation and security in AWS.

### Learning Outcomes :

1. Recognize IAM components like users, roles, policies, and groups.

2. Create and manage IAM policies to define permissions for users and roles.

3. Set up IAM users, groups, and roles to control access to AWS services.

4. Understand IAM best practices for maintaining security and managing access to AWS resources.

### What is IAM?

IAM, or Identity and Access Management. Lets think of it as the gatekeeper for our AWS resources, its job is to decide who gets in and what they're allowed to do once they're inside.

Imagine you have this big digital "house" full of all our AWS stuff our data, our applications, the whole shebang. Now, you don't want just anyone wandering in and messing around with your things, right? That's where IAM steps in.

It's like having your own VIP list for your digital world. IAM helps us keep our AWS resources safe and sound, making sure only the right people get in and that they're only allowed to do what you say they can. It's all about keeping our digital house in order and protecting our precious stuff from any unwanted guests.

![IAM dashboard](./img/IAM%20dashboard.png)

Note- AWS resources are the various services and tools provided by Amazon Web Services (AWS) that users can utilize to build and manage their applications and infrastructure in the cloud

### What is IAM user?

IAM users are like individual accounts for different people or entities within our AWS environment.

For example, if you have a team working on a project, you can create separate IAM users for each team member. Each IAM user would have their own unique username and password, allowing them to access the AWS resources they need for their work.

IAM users help you manage and control access to your AWS resources securely, ensuring that each user only has access to the resources they need to perform their tasks.

![Users John and Mary](./img/Users%20John%20and%20Mary.png)

### What is IAM Role?

An IAM role defines what someone or something (like an application or service) can do within our AWS account. Each role has a set of permissions that determine which actions it can perform and which AWS resources it can access.

For example, you might have an "admin" role that gives full access to all resources, or a "developer" role that only allows access to certain services for building applications.

Or if we take another example, imagine you have a visitor who needs temporary access to your house to fix something. Instead of giving them a permanent key (IAM user), you give them a temporary key (IAM role) that only works for a limited time and grants access to specific rooms (AWS resources).

IAM roles are flexible and can be assumed by users, services, or applications as needed. They are commonly used for tasks such as granting permissions to AWS services, allowing cross-account access, or providing temporary access to external users. IAM roles enhance security and efficiency by providing controlled access to AWS resources without the need for permanent credentials.

![Roles](./img/Roles.png)

### What is IAM Policy?

An IAM policy is a set of rules that define what actions a role can take. These rules specify the permissions granted to the role. Think of a policy as a rulebook for the role. It outlines which actions are allowed and which are not, helping to ensure secure and controlled access to your AWS resources.

For example, the rulebook might say that the "admin" key (IAM role or user) can open any door and perform any action within the house (AWS resources), while the "viewer" key (IAM role or user) can only open certain doors and look around, but not make any changes.

IAM policies define the permissions granted to IAM roles and users, specifying which AWS resources they can access and what actions they can take. They are essential for maintaining security and controlling access to AWS resources, ensuring that only authorized actions are performed by users and roles within your AWS account.

![Policies](./img/Policies.png)

### What is IAM group?

IAM Groups are like collections of IAM users. Instead of managing permissions for each user individually, you can organize users into groups based on their roles or responsibilities.

You can think IAM Groups as these neat little collections of users with similar roles or responsibilities. It's like putting everyone into teams based on their tasks. So, you might have a group for developers, another for administrators, and so on. So instead of setting permissions for each person one by one, you set them up for the whole group at once.

For example, let's say you have a development team working on a project. Instead of assigning permissions to each developer one by one, you can create an IAM Group called "Developers" and add all the developers to that group. Then, you assign permissions to the group as a whole. So, if you want all developers to have access to the same resources, you only need to set it up once for the group.

![User group](./img/User%20group.png)

### Best Practices:

Give only the permissions needed: Don't give more access than necessary.

Use roles instead of users: Roles are safer and can be used when needed.

Review roles regularly: Remove unused roles to keep things tidy and secure.

Add extra security with MFA: Use Multi-Factor Authentication for extra protection.

Use ready-made policies: They're safer and easier to use.

Keep policies simple: Make separate policies for different tasks.

Keep track of changes: Keep a record of who changes what.

Test policies before using them: Make sure they work the way you want them to before applying them to real stuff.

Use descriptive names: Choose clear and descriptive names for IAM groups to facilitate understanding and management.

Enforce strong password policies: Encourage users to create strong passwords and implement expiration and complexity requirements.

Note- (difference between users and roles) In AWS, users are like individual people with their own set of keys to access resources. These keys are permanent and tied to specific individuals. It's similar to having your own key to the front door of your house—it's always yours.

On the other hand, roles in AWS are more like special keys that can be used by different people or even programs. These keys provide temporary access and can be used by different users as needed. Roles are like master keys that can be used by anyone who needs access to certain things temporarily. So, while users are tied to specific individuals, roles are more flexible and can be shared among different users for specific tasks.

For MFA we can check Multi-Factor Authentication (MFA) for IAM

#### Now come to the practical part after understanding all about IAM:
A growth marketing consultancy company called GatoGrowFast.com wants to give some access to their employee Eric, Jack and Ade to the Aws resources. Let’s see how it is being setup.

We’ll do it in Two parts. In the first part of the practical, we'll create a policy granting full access to EC2. Then, we'll create a user named Eric and attach that policy to him.

In the second part, we'll create a group and add two more users, Jack and Ade, to that group. Afterward, we'll create a policy for granting full access to EC2 and S3, and attach it to the group.

### Part-1

1. Let's navigate to the AWS Management Console.

a) use the search bar to locate the Identity and Access Management (IAM) service.

![IAM services](./img/IAM%20services.png)

2. Now, on the IAM dashboard, navigate to the left sidebar and click on "Policies."

a) From there, search for "EC2" and select "AmazonEC2FullAccess" from the list of policies.

b) Proceed by clicking on "Create policy" to initiate the policy creation process.

![Ec2 full access policy](./img/Ec2%20full%20access%20Policy.png)

3. Now, select all EC2 actions.

![All Ec2 actions](./img/All%20EC2%20actions.png)

4. Tick "All resources" and click "Next."

![All resources](./img/All%20resources.png)

5. Now click on create policy

This is the policy we have created.

![Policy-for-Eric-Created](./img/Policy-for-Eric-created.png)

6. Now, proceed to the "Users" section, and select the option to "Create User."

![Users](./img/Users.png)

7. Enter the desired username for the user.

a) Then select the option "Provide user access to the AWS Management Console" if access to the web-based console interface is required.

b) Proceed to set up a password for the user.

c) check the box "Users must create a new password at next sign-in" if allowing users to change their password upon first sign-in is preferred.

![User details](./img/User%20details.png)

8. Select "Attach policy directly" and navigate to "Filter customer managed policies."

a) Choose the policy you created named "policy_for_eric."

b) Then proceed by clicking "Next."

![Attach policy](./img/Attach%20policy.png)

### Note- Aws policies –

Managed Policies: Made by AWS, used by many.

Customer Managed Policies: We make and manage them.

Inline Policies: Made for one specific thing.

For further details, please refer to Policies and permissions in IAM in IAM documentation.
 https://docs.aws.amazon.com/IAM/latest/UserGuide/access_policies.html

 9. Next, click on "Create User."

 ![Review and create user](./img/Review%20and%20create%20user.png)

 10. Let's ensure to save these details securely for future reference. a) Click on “Return to user list”

 ![User created successfully](./img/User%20created%20successfully.png)

 Eric's user has been successfully created, and the policy granting him full access to EC2 has been attached.

 ### Part-2

 On the "User Groups" section, enter a name for the group.

a) click on "Create User Group."

b) Then, proceed to the "Users" section.

![Name for user group](./img/Name%20for%20user%20group.png)

![name-for-user-group click create](./img/name-for-user-group%20click%20create.png)

This is the user you've created.

c) Now, let's proceed to the "User Group.

![User group created](./img/User%20group%20created.png)

2. Now, let's create a user named Jack.

![Creating user name Jack](./img/Creating%20user%20name%20Jack.png)

![Jack user deatils](./img/Jack%20user%20details.png)

3. In the "Permissions" options, select "Add user to group."

a) Then, in the "User groups" section,

b) choose the group you created named "development-team,".

c) click "Next."

![Set permission](./img/Set%20permission.png)

4. Now, click on create user

![Jack review and create](./img/Jack%20review%20and%20create.png)

![User Jack created successfully](./img/user%20Jack%20created%20successfully.png)

We need to repeat the same process for user Ade. Create user Ade and add him to the user group "Development-team."

![Creating user Ade](./img/Creating%20user%20Ade.png)

![Review and creating Ade](./img/Review%20and%20creating%20Ade.png)

![User Ade successfully created](./img/User%20Ade%20successfully%20created.png)

5. Navigate to the "Policies" section and click on "Create Policy" to begin crafting a new policy.

![Crafting a new policy](./img/Crafting%20a%20new%20policy.png)

6. Choose the two services, EC2 and S3, from the available options.

![Specify permission EC2](./img/Specify%20permission%20EC2.png)

![Specify permission and resources S3](./img/Specify%20permission%20and%20resources%20S3.png)

7. Enter the desired policy name and proceed to click on the "Create policy" button.

![Policy name](./img/Policy%20name.png)

8. Navigate to the "Users group" section and select the "Development-team" group.

![User group section select](./img/User%20group%20section%20select.png)

9. Proceed to the "Permissions" section and add the necessary permissions.

10. Click on attach policy

![Click on attach policy](./img/Click%20on%20attach%20policy.png)

11. Select "Customer Managed Policy" as the policy type.
a) Then choose the "development-policy" we created.

b) click "Attach Policy."

![Customer managed policy](./img/Customer%20managed%20policy.png)

The policy is now attached to the group, granting full permissions to EC2 and S3 for the group's users.

![Policy attached to the Developer team](./img/Policy%20attached%20to%20the%20Developer%20team.png)

### Project reflection:

Understanding IAM: IAM serves as the security foundation for AWS resources, controlling access and permissions.

Security Importance: IAM ensures data protection, compliance, and prevents unauthorized access.

Policy Creation: Participants learned to craft IAM policies to regulate resource access effectively.

Practical Application: Hands-on exercises equipped participants to set up IAM users, groups, and roles, enhancing their real-world IAM implementation skills.

END.





