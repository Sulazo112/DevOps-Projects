# Working with Kubernetes Pods

## Pods in Kubernetes

### Definition and Purpose:

A Pod in Kubernetes is like a small container for running parts of an application. It can have one or more containers inside it that work closely together. These containers share the same network and storage, which makes them communicate and cooperate easily. A Pod is the smallest thing you can create and manage in Kubernetes. In Minikube, which is a tool to run Kubernetes easily, Pods are used to set up, change the size, and control applications.

### Creating and Managing Pods:

Interaction with Pods in Minikube involves using the powerful kubectl command-line tool. kubectl is the command-line interface (CLI) tool for interacting with Kubernetes clusters. It allows users to deploy and manage applications, inspect and manage cluster resources, and execute various commands against Kubernetes clusters.

1. #### List Pods:

kubectl get po -A

This command provides an overview of the current status of Pods within the Minikube cluster.

![Kubectl get po-A](./img/Kubectl%20get%20po%20-A.png)

2. #### Inspect a Pod:

kubectl describe pod <pod-name>

The command above can be used to gain detailed insights into a specific Pod, including events, container information, and overall configuration.

I selected the CoreDNS Pod for deeper inspection:

kubectl get pods -n kube-system

This get the actual CoreDNS Pod name

![CoreDNS name](./img/CoreDNS%20name.png)

Using the real Pod name: kubectl describe pod coredns-66bc5c9577-5pnm6 -n kube-system

![Real Pod name top](./img/Real%20Pod%20name%20top.png)

![Real Pod name bottom](./img/Real%20Pod%20name%20bottom.png)

The describe command provides detailed insights into a Pod’s lifecycle, including:

Container image (coredns:<version>)

Pod IP and node assignment

Events such as scheduling, pulling images, and readiness checks

Restart counts and health probe results

This helps diagnose issues and understand how Kubernetes manages Pod state.

3. #### Delete a Pod:

kubectl delete pod <pod-name>

![Delete Pod](./img/Delete%20Pod.png)

Removing a Pod from the Minikube cluster is as simple as issuing this command.

kubectl get pods -n kube-system: for self healing

![Self healing](./img/Self%20healing.png)

The old pod terminating, and a new CoreDNS pod being created automatically.

### Containers in Kubernetes

#### Definition and Purpose:

From our knowledge of docker, we know Container represents a lightweight, standalone, and executable software package that encapsulates everything needed to run a piece of software, including the code, runtime, libraries, and system tools. Containers are the fundamental units deployed within Pods, which are orchestrated by Kubernetes. In Minikube, containers play a central role in providing a consistent and portable environment for applications, ensuring they run reliably across various stages of the development lifecycle.

A Pod is the smallest deployable unit in Kubernetes and may contain one or more containers. Containers inside a Pod share:

The same network namespace (same IP, same ports)

The same storage volumes

The same lifecycle (start, stop, restart together)

#### Multi‑Container Pod orchestration:

Kubernetes does not scale containers individually

Scaling happens at the Pod level

If a Pod has two containers, both scale together

Multi‑container Pods are used for patterns like:

Sidecar containers (logging, monitoring)

Ambassador containers (proxying)

Adapter containers (format conversion)

This demonstrates how Kubernetes orchestrates containers as a single atomic unit.

#### Integrating Containers into Pods: Pod Definition Using YAML and Deployment Using kubectl apply

Pod Definition with Containers: In the Kubernetes world, containers come to life within Pods. Developers define a Pod YAML file that specifies the containers to run, their images, and other configuration details. This Pod becomes the unit of deployment, representing a cohesive application.

Using kubectl, we can deploy Pods and, consequently, the containers within them to the Minikube cluster. This process ensures that the defined containers work in concert within the shared context of a Pod.

#### Create the YAML file

touch my-nginx.yaml

![Touch YAML](./img/Touch%20YAML.png)

![YAML file](./img/YAML%20file.png)

Apply the Pod to Kubernetes:

kubectl apply -f my-nginx.yaml

![Applying the Pod](./img/Applying%20the%20pod.png)

Verify the Pod is running:

kubectl get pods
kubectl describe pod my-nginx

![Verifying Pod top](./img/Verifying%20Pod%20top.png)

![Verifying Pod bottom](./img/Verifying%20Pod%20bottom.png)

END.

