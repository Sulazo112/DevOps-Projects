# Configuring Uptime Monitoring using Gatus

Ensuring that our services and websites are available and performing as expected is crucial for maintaining user satisfaction and trust. Gatus is a simple yet powerful tool for monitoring the uptime of services and websites. This project will guide us through setting up Gatus to monitor the availability of a website or API endpoint and receive alerts when it becomes unavailable.

### Objectives

1. Understand what Gatus is and its role in uptime monitoring.
2. Set up Gatus on your local machine or server.
3. Configure Gatus to monitor one or more endpoints.
4. Set up alerting for downtime events.
5. Visualize monitoring results through the Gatus dashboard.

### Prerequisites

1. Basic Knowledge: Familiarity with HTTP services, APIs, and configuration files (YAML).

2. Tools Required:

A machine with Docker installed (recommended for ease of setup).
A text editor for editing configuration files.
Internet access for testing live endpoints.

#### Tasks Outline

1. Install and set up Gatus locally.
2. Create a basic configuration file to monitor endpoints.
3. Test the Gatus setup with live endpoints.
4. Configure alerts for downtime using Slack, email, or another notification method.
5. Explore and customize the Gatus dashboard.

### Project Tasks

#### Task 1 - Install and Set Up Gatus Locally

1. Install Docker if it’s not already installed:

Follow the official Docker installation guide.https://docs.docker.com/get-docker/

I already have docker installed on my PC

![Docker](./img/Docker.png)

2. Pull the Gatus Docker image:

docker pull twinproduction/gatus

![Docker pull gatus](./img/Docker%20pull%20gatus.png)

3. Create a directory for Gatus configuration:

mkdir gatus && cd gatus

![Mkdir gatus and cd gatus](./img/Mkdir%20gatus%20and%20cd%20gatus.png)

4. Start Gatus using Docker with a basic setup:

docker run -d -p 8080:8080 --name gatus -v $(pwd)/config:/config twinproduction/gatus

![Docker run gatus](./img/Docker%20run%20gatus.png)

![Gatus container](./img/Gatus%20container.png)

5. Access the Gatus dashboard in your browser at http://localhost:8080

![Gatus health dashboard](./img/Gatus%20health%20dashboard.png)

#### Task 2 - Create a Basic Configuration File

1. Inside the gatus/config directory, create a config.yaml file.

![Config.yaml](./img/Config.%20yaml%20file.png)

2. Add a simple configuration to monitor a website:

![Config file snipet](./img/Config%20file%20snipet.png)

![Vi Config.yaml](./img/Vi%20Config.yaml.png)

![Cat Config.yaml](./img/Cat%20Config.yaml.png)

3. Restart the Gatus container to apply the configuration:

docker restart gatus

![Docker restart gatus](./img/Docker%20restart%20gatus.png)

![Gatus Restart](./img/Gatus%20restart.png)

#### Task 3 - Test the Setup with Live Endpoints

1. Add another endpoint to the config.yaml file for monitoring:

![Another Endpoint](./img/Another%20EndPoint.png)

![Cat endpoint config.yaml](./img/Add%20endpoint%20to%20config.yaml.png)

2. Restart Gatus and verify the new endpoint appears on the dashboard.

docker restart gatus

![Docker restart gatus dashboard](./img/Docker%20restart%20gatus%20dashboard.png)

3. Simulate a failure by adding a non-existent endpoint and observe the behavior:

![Simulate failure](./img/Simulate%20Failure.png)

![Updated vi config.yaml](./img/Updated%20Vi%20config.yaml.png)

![Cat nonexistent](./img/Cat%20nonexistent.png)

4. #### Task 4 - Configure Alerts for Downtime

1. Choose an alerting method, such as Slack or email. For example, for Slack:

Create a Slack webhook URL in your workspace.

2. Add an alert configuration to config.yaml:

![Alert config.yaml](./img/Alert%20config.yaml.png)

![Alert cat config.yaml](./img/Alert%20cat%20config.yaml.png)

3. Test the alerting by taking down a monitored service temporarily.

#### Task 5 - Explore and Customize the Gatus Dashboard

1. Access the Gatus dashboard to view uptime statistics for each endpoint.

![Uptime statistics for each endpoints](./img/Uptime%20statistics%20for%20each%20endpoints.png)

2. Customize the dashboard appearance (e.g., themes, logos) by modifying the configuration file.

3. Adjust monitoring intervals and conditions to optimize performance.

#### Conclusion

In this project, we learned how to set up and configure Gatus for monitoring uptime and performance of services and websites. You explored essential features like endpoint monitoring, alerting, and dashboard visualization. With this knowledge, you can expand your configuration to monitor multiple services, integrate with advanced alerting tools, and deploy Gatus in production environments.

End.



