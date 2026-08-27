# Google Cloud Platform (GCP) Research

## Brief Overview
Google Cloud Platform (GCP), introduced in 2008, provides cloud services for computing, storage, networking, databases, artificial intelligence, machine learning, and big data analytics. GCP runs on the same global infrastructure that powers Google Search, YouTube, and Gmail. It is best known for its leadership in cloud-native technologies and for creating Kubernetes, the industry-standard container orchestration platform.

## Global Infrastructure
GCP organizes its infrastructure into:
- **Regions** – geographical locations containing multiple data centers (e.g., us-central1 Iowa, europe-west1 Belgium, asia-southeast1 Singapore).
- **Zones** – isolated locations within a region used to deploy resources for fault tolerance.
- **Google's Private Global Network** – unlike many providers, Google owns and operates its own fiber-optic backbone connecting its data centers worldwide, improving speed and reliability.

## Cloud Management Console
The **Google Cloud Console** is a web-based interface for creating and managing GCP resources. Users can create virtual machines, configure storage, deploy Kubernetes clusters, manage databases, and monitor resources. The `gcloud` CLI is available for automation and scripting.

## Four Core Services
1. **Compute Engine** – Infrastructure as a Service (IaaS) offering for virtual machines.
2. **Cloud Storage** – object storage for unstructured data such as backups and media.
3. **Virtual Private Cloud (VPC)** – software-defined secure networking for cloud resources.
4. **Cloud IAM** – identity and access management following the Principle of Least Privilege.

## Three Advantages
1. **Leadership in AI and machine learning** – strong tools like Vertex AI for building ML models.
2. **Best-in-class Kubernetes and container support** – GCP created Kubernetes and offers Google Kubernetes Engine (GKE).
3. **High-performance global network** – Google's private fiber backbone reduces latency between data centers.

## Typical Enterprise Use Cases
- Building and training machine learning models with Vertex AI.
- Running containerized, microservices-based applications with GKE.
- Performing large-scale data analytics on big datasets.
- Developing modern DevOps workflows with Kubernetes.
- Hosting cloud-native, scalable web applications.
