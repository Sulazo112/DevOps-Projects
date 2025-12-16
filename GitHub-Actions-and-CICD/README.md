# GitHub Actions and CICD

## GitHub Actions and CI/CD Course Project - YAML

Welcome to this engaging and practical course on GitHub Actions and Continuous Integration/Continuous Deployment (CI/CD). In this course, we'll embark on a journey to master the art of automating our software development processes using one of the most powerful tools available on GitHub. Whether you're a seasoned developer or a beginner, this course is designed to equip us with the essential skills needed to streamline our development workflow, enhance the quality of our code, and significantly reduce the time to deploy new features and fixes.

### Why This Course is Relevant for Learners

![Orchestral Analogy](./img/Orchestra%20Analogy.png)

Imagine you are a conductor of an orchestra. Each musician (developer) plays a different instrument (code) and must synchronize perfectly to create harmonious music (software). In this scenario, GitHub Actions and CI/CD processes are like your conductor's baton, helping you to orchestrate the diverse elements of software development. Just as a conductor ensures that each musician enters at the right time and the music flows smoothly, CI/CD coordinates the various stages of development, testing, and deployment, ensuring that the final product is delivered seamlessly and efficiently. This course, therefore, is not just about learning the technicalities of GitHub Actions; it's about learning how to conduct your software development orchestra with skill and precision, leading to a symphony of streamlined processes and high-quality outcomes.

### Lesson 3: Workflow Syntax and Structure

#### Objectives:

Understand YAML syntax for workflows.
Learn the structure and components of a workflow.

### Pre-requisites

1. GitHub Account:

Necessary for repository management and GitHub Actions.
Sign up at GitHub. https://github.com/

2. Git Installed:

Required for version control and managing code changes.
Installation guide: Git Installation. https://git-scm.com/book/en/v2/Getting-Started-Installing-Git

3. Basic Knowledge of Git:

Understanding of basic Git commands (clone, commit, push, pull).
Tutorial: Git Basics.https://git-scm.com/docs/gittutorial

4. Node.js and npm Installed:

Node.js is the runtime for the project, and npm is the package manager.
Download and installation: Node.js Downloads. https://nodejs.org/en/download/
Verify installation with node -v and npm -v in the terminal.

5. Familiarity with JavaScript:

Basic understanding of JavaScript programming.
Tutorial: JavaScript Guide. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide

6. Text Editor or IDE:

A code editor such as Visual Studio Code, Atom, or Sublime Text.
Visual Studio Code: Download VS Code. https://code.visualstudio.com/download

7. Access to a Command Line Interface (CLI):

Terminal on macOS/Linux or Command Prompt/PowerShell on Windows.
Guide: The Command Line Interface. https://www.codecademy.com/article/command-line-interface

8. Basic Understanding of YAML:

YAML is used for writing GitHub Actions workflows.
Tutorial: Learn YAML in Y Minutes. https://learnxinyminutes.com/docs/yaml/

9. Internet Connection:

Required for accessing GitHub, documentation, and online resources.

10. Willingness to Learn and Experiment:

Openness to exploring new tools and troubleshooting.

### Lesson Details:

#### YAML Syntax for Workflows:

YAML is a human-readable data serialization standard used for configuration files.

Key concepts: indentation, key-value pairs, lists.

Example snippet:

![Yaml file Snippet](./img/YAMLFile%20Snippet.png)

#### Workflow Structure and Components:

Workflow File: Located in .github/workflows directory, e.g., main.yml.

Jobs: Define tasks like building, testing, deploying.

Steps: Individual tasks within a job.

Actions: Reusable units of code within steps.

Events: Triggers for the workflow, e.g., push, pull_request.

Runners: The server where the job runs, e.g., ubuntu-latest.

### Module 3: Implementing Continuous Integration

#### Lesson 1: Building and Testing Code

#### Objectives:

Set up build steps in GitHub Actions.

Run tests as part of the CI process.

#### Setting Up Build Steps:

1. #### Defining the Build Job:

In our GitHub Actions workflow file (e.g., .github/workflows/main.yml), start by defining a job named build.

This job is responsible for building our code.

![Code building](./img/Code%20building.png)

![Define build job](./img/Define%20build%20job.png)

2. #### Adding Build Steps:

Each step in the job performs a specific task.

Here, we add three steps: checking out the code, installing dependencies, and running the build script.

![Code steps](./img/Code%20Steps.png)

![Adding build steps](./img/Adding%20steps.png)

### Running Tests in the Workflow:

1. #### Adding Test Steps:

After the build steps, include steps to execute our test scripts.

This ensures that our code is not only built but also passes all the tests.

![Test steps](./img/Test%20Steps.png)

#### My Learner Notes:

The build job consists of steps to check out the code, install dependencies, build the code, and run tests.
The runs-on: ubuntu-latest line specifies that the job should run on the latest version of Ubuntu provided by GitHub Actions.
Using actions like actions/checkout@v2 helps in leveraging community-maintained actions to simplify common tasks.
Commands like npm install, npm run build, and npm test are standard Node.js commands used for managing dependencies, building, and testing Node.js applications.

### Additional YAML Concepts in GitHub Actions

#### Objectives:

Deepen understanding of advanced YAML features used in GitHub Actions.
Explore the use of environment variables and secrets in workflows.

### Detailed Steps and Code Explanation:

1. ##### Using Environment Variables:

Environment variables can be defined at the workflow, job, or step level.

They allow us to dynamically pass configuration and settings.

![Environment variables](./img/Environment%20Variables.png)

2. ##### Working with Secrets:

Secrets are encrypted variables set in your GitHub repository settings.

Ideal for storing sensitive data like access tokens, passwords, etc.

![Using secret](./img/Using%20Secrete.png)

3. ##### Conditional Execution:

You can control when jobs, steps, or workflows run based on conditions.

![Using Condition](./img/Using%20Condition.png)

4. ##### Using Outputs and Inputs between Steps:

Share data between steps in a job using outputs.

![Share data](./img/Share%20Data.png)

The Formatted Code

![Formatted code top](./img/Formatted%20code%20top.png)

![Formatted code middle](./img/Formatted%20code%20middle.png)

![Formatted code middle2](./img/Formatted%20code%20middle2.png)

![Formatted code bottom](./img/Formatted%20code%20bottom.png)

#### My Learner Notes:

Environment variables and secrets are crucial for managing configurations and sensitive data in your CI/CD pipelines.

Conditional execution helps tailor the workflow based on specific criteria, making your CI/CD process more efficient.

Sharing data between steps using outputs and inputs allows for more complex workflows where the output of one step can influence or provide data to subsequent steps.

These advanced features enhance the flexibility and security of your GitHub Actions workflows, enabling a more robust CI/CD process.

### Lesson 2: Configuring Build Matrices

#### Objectives:

Implement parallel and matrix builds.
Manage dependencies across different environments.

Below is a complete, clean, and properly formatted GitHub Actions workflow that includes:

✅ Matrix Builds (Parallel Jobs)

✅ Multiple Node.js Versions

✅ Different Operating Systems

✅ Managing dependencies for each environment

This is exactly what we need for:

Implementing parallel and matrix builds and managing dependencies across different environments.

✅ GitHub Actions Workflow: Parallel & Matrix Builds Across Environments.

![Configuring build matrix top](./img/Configuring%20build%20matrix%20top.png)

![Configuring build matrix bottom](./img/configuring%20build%20matrix%20bottom.png)

![All workflow](./img/All%20workflow.png)

✅ What This Workflow Does

1. Parallel Jobs (Matrix Build)
Matrix strategy creates multiple CI jobs simultaneously:

![Matrix strategy](./img/Matrix%20strategy.png)

→ 12 parallel test environments

→ Faster feedback + broader compatibility testing

✅ 2. Managing Dependencies Across Environments

Each matrix job:

Installs Node-specific dependencies

Uses the correct OS package manager

Builds the project

Runs tests

The workflow ensures your application works on:

✔ Old Node versions

✔ New Node versions

✔ Ubuntu

✔ Windows

✔ macOS

This is critical if you're building:

NPM libraries

Cross-platform apps

Frameworks

Dependency-heavy applications

END.

