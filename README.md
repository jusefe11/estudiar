🚀 Sobre BankCloud

BankCloud es un laboratorio empresarial diseñado para demostrar la construcción de una plataforma moderna sobre Amazon Web Services, desde networking e Infrastructure as Code hasta despliegues automatizados, seguridad y observabilidad.

La solución implementa una arquitectura basada en Terraform + ECS Fargate + Docker + RDS PostgreSQL + GitHub Actions, siguiendo principios de automatización, seguridad por capas, separación de ambientes y reproducibilidad.

🎯 Objetivo: construir una plataforma Cloud/DevOps cercana a un escenario empresarial real, completamente administrada mediante código.

🧭 Arquitectura

                                  ┌──────────────┐
                                  │   INTERNET   │
                                  └──────┬───────┘
                                         │
                                  ┌──────▼───────┐
                                  │     ALB      │
                                  │ Public Tier  │
                                  └──────┬───────┘
                                         │
                       ┌─────────────────┴──────────────────┐
                       │                                    │
                ┌──────▼───────┐                     ┌──────▼────────────┐
                │   Frontend   │        gRPC         │ Product Catalog  │
                │ ECS Fargate  │────────────────────▶│   ECS Fargate    │
                │    :8080     │                     │      :3550       │
                └──────┬───────┘                     └──────┬────────────┘
                       │                                    │
                 Target Group                         AWS Cloud Map
                       │
                  /_healthz

        ┌──────────────────── PRIVATE SUBNETS ────────────────────┐
        │                                                        │
        │    ECS Fargate        Prometheus        Grafana         │
        │                                                        │
        └──────────────────────────┬─────────────────────────────┘
                                   │
                          ┌────────▼────────┐
                          │ Amazon RDS      │
                          │ PostgreSQL      │
                          │ Database Tier   │
                          └─────────────────┘

         CloudWatch · Secrets Manager · KMS · ECR · VPC Endpoints

🛡️ Diseño de red

Capa

Componentes

🌐 Public Tier

Internet Gateway, ALB, NAT Gateway

🔒 Private Tier

ECS Fargate, Prometheus, Grafana

🗄️ Database Tier

Amazon RDS PostgreSQL

🔐 Security

Security Groups, NACL, IAM, KMS, Secrets Manager

🔌 Private AWS Access

S3, ECR, CloudWatch Logs y STS mediante VPC Endpoints

⚙️ Stack

<table>
<tr>
<td width="33%" valign="top">

☁️ Cloud

Amazon VPC

Amazon ECS

AWS Fargate

Amazon ECR

Application Load Balancer

Amazon RDS

AWS Cloud Map

</td>
<td width="33%" valign="top">

🔄 DevOps

Terraform

Docker

Git

GitHub

GitHub Actions

Amazon ECR

ECS Deployments

</td>
<td width="33%" valign="top">

🔐 DevSecOps

Trivy

AWS IAM

AWS KMS

Secrets Manager

Security Groups

Network ACL

VPC Endpoints

</td>
</tr>
<tr>
<td valign="top">

📊 Observability

Amazon CloudWatch

CloudWatch Logs

CloudWatch Metrics

CloudWatch Alarms

Container Insights

</td>
<td valign="top">

📈 Monitoring

Prometheus

Grafana

ECS Health Checks

ALB Health Checks

Smoke Tests

</td>
<td valign="top">

🏗️ IaC

Terraform Modules

Remote State

Amazon S3 Backend

State Locking

DEV / QA / PROD

</td>
</tr>
</table>

📁 Estructura

estudiar/
│
├── 🐙 .github/
│   └── workflows/
│       ├── terraform-dev.yml
│       └── security.yml
│
├── 🐳 bankcloud-app/
│   ├── frontend/
│   │   ├── Dockerfile
│   │   └── main.go
│   ├── productcatalogservice/
│   │   └── Dockerfile
│   └── docker-compose.yml
│
├── 🏗️ terraform/
│   ├── bootstrap/
│   ├── environments/
│   │   ├── dev/
│   │   ├── qa/
│   │   └── prod/
│   └── modules/
│       ├── alb/
│       ├── cloudmap/
│       ├── cloudwatch/
│       ├── ecr/
│       ├── ecs/
│       ├── iam/
│       ├── monitoring/
│       ├── rds/
│       └── vpc/
│
└── 📄 README.md

🔄 CI/CD

El pipeline automatiza el proceso completo desde un commit hasta AWS:

┌─────────────┐
│ Git Commit  │
└──────┬──────┘
       ▼
┌────────────────┐
│ GitHub Actions │
└──────┬─────────┘
       │
       ├── 🐳 Docker Build
       ├── 🛡️ Trivy Scan
       ├── 📦 Push → Amazon ECR
       ├── 🏗️ Terraform Validate / Plan / Apply
       ├── 🚀 ECS Deployment
       ├── ⏳ Wait Services Stable
       └── ❤️ Smoke Test /_healthz
                         │
                ┌────────┴─────────┐
                ▼                  ▼
             SUCCESS            FAILURE
                │                  │
                ▼                  ▼
          Deployment OK      Automatic Rollback

🏷️ Versionado de imágenes

Cada imagen utiliza el SHA del commit:

bankcloud/frontend:<commit-sha>
bankcloud/productcatalogservice:<commit-sha>

Esto proporciona trazabilidad exacta entre código, imagen Docker y versión desplegada en ECS.

🗺️ Roadmap

Sprint

Entregable

Estado

01

🌐 Arquitectura & Networking

🟢 100%

02

🐳 Docker & Amazon ECR

🟢 100%

03

🚀 ECS Fargate & ALB

🟢 100%

04

🗄️ Amazon RDS PostgreSQL

🟢 100%

05

🔄 GitHub Actions CI/CD

🟡 95%

06

📊 Observabilidad

🟢 100%

07

🛡️ Seguridad / DevSecOps

⚪ Pendiente

08

♻️ Alta disponibilidad / DR / Troubleshooting

⚪ Pendiente

PROJECT PROGRESS

Sprint 01  ████████████████████  100%
Sprint 02  ████████████████████  100%
Sprint 03  ████████████████████  100%
Sprint 04  ████████████████████  100%
Sprint 05  ███████████████████░   95%
Sprint 06  ████████████████████  100%
Sprint 07  ░░░░░░░░░░░░░░░░░░░░    0%
Sprint 08  ░░░░░░░░░░░░░░░░░░░░    0%

Overall   ███████████████░░░░░   74%

🏁 Implementación por Sprint

<details>
<summary><b>✅ Sprint 1 — Arquitectura & Networking</b></summary>

Objetivo

Construir una base de networking modular, segura y reproducible con Terraform.

Implementado

VPC

Public / Private / Database Subnets

Internet Gateway

Elastic IP

NAT Gateway

Route Tables

Network ACL

Security Groups

VPC Endpoints

Remote State en Amazon S3

State Locking

Validación

terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

Resultado: 🟢 COMPLETADO

</details>

<details>
<summary><b>✅ Sprint 2 — Docker & Amazon ECR</b></summary>

Implementado

Dockerfile Frontend

Dockerfile ProductCatalogService

Multi-stage Builds

Usuario no root

Health Checks

Docker Compose

Repositorios privados Amazon ECR

bankcloud/frontend
bankcloud/productcatalogservice

Resultado: 🟢 COMPLETADO

</details>

<details>
<summary><b>✅ Sprint 3 — Amazon ECS Fargate & ALB</b></summary>

Implementado

ECS Cluster bankcloud-dev

ECS Task Definitions

ECS Services

AWS Fargate

Application Load Balancer

Target Groups

AWS Cloud Map

Service Discovery

CloudWatch Logs

Health Checks

Rolling Deployments

Estado validado

bankcloud-dev-frontend
Desired: 2 | Running: 2 | Rollout: COMPLETED

bankcloud-dev-productcatalogservice
Desired: 1 | Running: 1 | Rollout: COMPLETED

GET /_healthz
HTTP/1.1 200 OK

Resultado: 🟢 COMPLETADO

</details>

<details>
<summary><b>✅ Sprint 4 — Amazon RDS PostgreSQL</b></summary>

Implementado

Amazon RDS PostgreSQL

DB Subnet Group

Private Database Subnets

Security Group dedicado

Acceso desde ECS

AWS Secrets Manager

AWS KMS

Parameter Group

Terraform Integration

ECS Fargate
    │
    ▼
ECS Security Group
    │
    ▼
RDS Security Group
    │
    ▼
Amazon RDS PostgreSQL
    ├── Secrets Manager
    └── AWS KMS

Resultado: 🟢 COMPLETADO

</details>

<details>
<summary><b>🟡 Sprint 5 — GitHub Actions CI/CD · 95%</b></summary>

CI

Checkout

AWS Authentication

Amazon ECR Login

Docker Build

Trivy Scan

HIGH / CRITICAL vulnerability gate

Git Commit SHA tagging

Push a ECR

CD

Terraform Init / Fmt / Validate / Plan / Apply

ECS Task Definition Update

ECS Deployment

Wait Services Stable

ALB Health Check

Smoke Test /_healthz

Automatic Rollback logic

Evidencia

CI · Build / Scan / Push      SUCCESS
CD · Terraform DEV           SUCCESS
ECS Deployment               SUCCESS
Smoke Test                   SUCCESS

🟡 Pendiente: ejecutar y documentar la prueba controlada del rollback.

</details>

<details open>
<summary><b>✅ Sprint 6 — Observabilidad</b></summary>

📊 Arquitectura de observabilidad

ECS Services
     │
     ├──────────────▶ CloudWatch Logs
     │
     ├──────────────▶ CloudWatch Metrics
     │                       │
     │                       ▼
     │                CloudWatch Alarms
     │
     ├──────────────▶ Prometheus
     │
     └──────────────▶ Grafana

Implementado

✅ Amazon CloudWatch

✅ CloudWatch Logs

✅ CloudWatch Metrics

✅ CloudWatch Alarm para CPU

✅ ECS Container Insights

✅ Terraform monitoring module

✅ Prometheus en ECS Fargate

✅ Grafana en ECS Fargate

✅ Log Groups dedicados

✅ Monitoring Security Group

✅ CloudWatch Logs VPC Endpoint

✅ Private DNS

✅ Ejecución en Private Subnets

🟢 Estado final

Servicio

Desired

Running

Pending

bankcloud-dev-grafana

1

1

0

bankcloud-dev-prometheus

1

1

0

🧠 Troubleshooting resuelto

Durante el despliegue se presentó:

ResourceInitializationError:
The task cannot find the Amazon CloudWatch log group
defined in the task definition.

El diagnóstico cubrió:

Task Definition → Log Group → Route Table → NAT Gateway → NACL → Security Groups → VPC Endpoint → Private DNS

Causa corregida: el Security Group del VPC Endpoint debía permitir HTTPS/443 desde la VPC.

BEFORE
ECS Tasks → PENDING → STOPPED ❌

AFTER
Grafana     Desired 1 → Running 1 → Pending 0 ✅
Prometheus  Desired 1 → Running 1 → Pending 0 ✅

💡 Este incidente documenta un caso real de troubleshooting de networking entre ECS Fargate, Private Subnets y CloudWatch Logs mediante Interface VPC Endpoint.

Resultado: 🟢 COMPLETADO

</details>

📊 Estado actual

<div align="center">

🟢 DEV ENVIRONMENT — OPERATIONAL

ECS Fargate · RDS PostgreSQL · CI/CD · CloudWatch · Prometheus · Grafana

</div>

Componente

Estado

Networking AWS

🟢

ECS Fargate

🟢

Application Load Balancer

🟢

Amazon RDS

🟢

GitHub Actions CI/CD

🟢

CloudWatch

🟢

Prometheus

🟢

Grafana

🟢

DevSecOps avanzado

🟡

HA / DR

⚪

🎯 Próximos hitos

Sprint 5
Finalizar la evidencia del rollback controlado.

Sprint 7 — Seguridad / DevSecOps
Ampliar controles de seguridad del pipeline y de la infraestructura.

Sprint 8 — Alta disponibilidad / DR / Troubleshooting
Completar resiliencia, recuperación y escenarios de incidentes.

<div align="center">

🏆 BankCloud

AWS · Terraform · Docker · ECS Fargate · RDS · GitHub Actions · DevSecOps · Observability

Construido como laboratorio práctico de arquitectura Cloud & DevOps empresarial.