# Client Recommendations

## Client A – Startup Company
**Recommended Platform:** Amazon Web Services (AWS)

**Justification:** Since the startup has a limited budget but expects rapid growth, AWS is the strongest fit because of its generous free tier and pay-as-you-go pricing, which keeps early costs low while allowing the company to scale seamlessly as its user base grows. AWS's mature ecosystem also means the startup can find abundant documentation, tutorials, and third-party tools to speed up development. Its broad service catalog means the company won't need to switch providers as its needs diversify over time.

**Services to use:**
- Amazon EC2 – for hosting the mobile app's backend servers
- Amazon S3 – for storing app assets, user uploads, and backups
- AWS Lambda – for serverless functions to handle app logic without managing servers

## Client B – University
**Recommended Platform:** Microsoft Azure

**Justification:** Because the university already relies on Windows Server, Microsoft 365, and Active Directory, Azure is the clear choice due to its native integration with these existing systems. Migrating to Azure allows the university to extend its current identity management setup into the cloud through Microsoft Entra ID rather than rebuilding it from scratch. This hybrid approach lets the university modernize gradually while preserving its existing investment in Microsoft technologies, minimizing disruption to staff and students.

**Services to use:**
- Microsoft Entra ID – to extend the university's existing Active Directory into the cloud
- Azure Virtual Machines – to host university applications and services
- Azure SQL Database – to manage student records and administrative databases

## Client C – AI Research Company
**Recommended Platform:** Google Cloud Platform (GCP)

**Justification:** Since the client develops AI and machine learning applications requiring high-performance computing, GCP is the strongest fit because of Google's deep investment in AI infrastructure and tools. GCP's Vertex AI platform simplifies building, training, and deploying machine learning models, while Compute Engine offers powerful GPU and TPU options tailored for ML workloads. GCP's leadership in Kubernetes also supports scalable, containerized deployment of AI models.

**Services to use:**
- Compute Engine – for high-performance computing with GPU/TPU support
- Vertex AI – for building and training machine learning models
- Google Kubernetes Engine (GKE) – for deploying containerized AI applications at scale

## Client D – Global E-Commerce Company
**Recommended Platform:** Amazon Web Services (AWS)

**Justification:** Given that the company serves customers worldwide and requires highly available infrastructure with automatic scaling, AWS is well suited due to its extensive global network of Regions, Availability Zones, and Edge Locations. Amazon CloudFront ensures fast content delivery to customers anywhere in the world, while EC2 Auto Scaling and Elastic Load Balancing handle traffic spikes automatically, such as during sales events. AWS's proven track record supporting large-scale e-commerce operations makes it a reliable choice for this use case.

**Services to use:**
- Amazon EC2 with Auto Scaling – to automatically handle fluctuating customer traffic
- Amazon CloudFront – to deliver content quickly to a global customer base
- Amazon RDS – for a managed, highly available product and order database

## Multi-Cloud Decision Matrix

| Business Requirement | Recommended Platform | Justification |
|---|---|---|
| Startup Company | AWS | Broad services, generous free tier, and easy scalability |
| Enterprise Organization | Multi-Cloud Strategy | Combines the strengths of multiple providers and reduces vendor dependency |
| Microsoft Environment | Azure | Native integration with Active Directory, Microsoft 365, and Windows Server |
| AI / Machine Learning | GCP | Strong AI/ML tooling (Vertex AI) and high-performance computing options |
| Kubernetes Deployment | GCP | Created Kubernetes and offers the most mature managed Kubernetes service (GKE) |
| Global Web Application | AWS | Extensive global infrastructure and automatic scaling capabilities |
