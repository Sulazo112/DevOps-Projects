# Jenkins Freestyle Project

### Jenkins Job

In Jenkins, a job is a unit of work or a task that can be executed by the Jenkins automation server.

A Jenkins job represents a specific task or set of tasks that needs to be performed as part of a build or deployment process. Jobs in Jenkins are created to automate the execution of various steps such as compiling code, running tests, packaging applications, and deploying them to servers. Each Jenkins job is configured with a series of build steps, post-build actions, and other settings that define how the job should be executed.

### Creating a Freestyle Project

Let's create our first build job

i. From the dashboard menu on the left side, click on new item

![New Item](./img/New%20item.png)

ii. Create a freestyle project and name it "my-first-job"

![Freestyle](./img/Freestyle.png)

### Connecting Jenkins To Our Source Code Management

Now that we have created a freestyle project, let connect jenkins with github.

i. Create a new github repository called jenkins-scm with a README.md file

![Jenkins scm](./img/Jenkins%20scm.png)

ii. Connect jenkins to jenkins-scm repository by pasting the repository url in the area selected below. Make sure your current branch is main.

![Connect Jenkins top](./img/Connect%20Jenkins%20top.png)

![Connect Jenkins bottom](./img/Connect%20Jenkins%20bottom.png)

iii. Save configuration and run "build now" to connect jenkins to our repository.

![Build now](./img/Build%20now.png)

We have successfully connected jenkins with our github repository (jenkins-scm)

### Configuring Build Trigger

As an engineer, we need to be able to automate things and make our work easier in possible ways. We have connected jenkins to jenkins-scm, but we cannot run a new build with clicking on Build Now. To eliminate this, we need to confiure a build trigger to our jenkins job. With this, jenkins will run a new build anytime a change is made to our github repository.

i. Click "Configure" your job and add this configurations.

![Configure](./img/Configure.png)

ii. Click on build trigger to configure triggering the job from GitHub webhook.

![Triggers](./img/Trigger.png)

iii. Create a github webhook using jenkins ip address and port

Now, Lets go ahead and make some change in any file in our GitHub repository (e.g. README.MD file) and push the changes to the master branch.

You will see that a new build has been launched automatically (by webhook)

![Webhook](./img/Webhook.png)

![New build github](./img/New%20build%20github.png)

![New build Jenkins](./img/New%20build%20Jenkins.png)

END.
