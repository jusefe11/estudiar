☁️ BankCloud – Plataforma Empresarial AWS DevOps

Laboratorio práctico de nivel profesional para diseñar, automatizar, desplegar y operar una plataforma empresarial sobre AWS utilizando Terraform, Docker, Amazon ECS Fargate y GitHub Actions.

📖 Descripción

BankCloud simula la modernización de una plataforma tecnológica empresarial hacia AWS mediante una arquitectura basada en:

Infrastructure as Code (IaC)

Contenedores y microservicios

Networking público, privado y de base de datos

Balanceo de carga

Bases de datos administradas

Seguridad por capas

Observabilidad

Automatización CI/CD

Alta disponibilidad

Separación por ambientes

AWS Well-Architected Framework

🎯 Roles y competencias demostradas

Cloud Engineer

DevOps Engineer

DevSecOps Engineer

AWS Solutions Architect

Platform Engineer

Cloud Infrastructure Engineer

🎯 Objetivos del proyecto

Diseñar una arquitectura empresarial sobre AWS.

Automatizar la infraestructura mediante Terraform.

Construir módulos Terraform reutilizables.

Implementar networking público, privado y de base de datos.

Containerizar microservicios con Docker.

Publicar imágenes en Amazon ECR.

Ejecutar workloads mediante Amazon ECS Fargate.

Implementar Application Load Balancer y Target Groups.

Implementar Service Discovery con AWS Cloud Map.

Implementar PostgreSQL mediante Amazon RDS.

Gestionar credenciales mediante AWS Secrets Manager.

Utilizar AWS KMS para cifrado.

Automatizar CI/CD mediante GitHub Actions.

Ejecutar análisis de vulnerabilidades con Trivy.

Implementar Health Checks y Smoke Tests.

Implementar rollback automático.

Incorporar observabilidad con CloudWatch, Prometheus y Grafana.

Implementar controles DevSecOps.

Diseñar mecanismos de alta disponibilidad y recuperación.

Mantener una plataforma reproducible mediante código.

🛠 Stack tecnológico

Área

Tecnologías

☁️ AWS

VPC, ECS, Fargate, ECR, ALB, RDS PostgreSQL, Secrets Manager, KMS, Cloud Map, CloudWatch, S3, DynamoDB, IAM, NAT Gateway, Internet Gateway, VPC Endpoints

🏗 IaC

Terraform, módulos reutilizables, Remote State en S3, State Locking

🐳 Contenedores

Docker, Docker Compose, Multi-stage Builds, Amazon ECR

🔄 CI/CD

Git, GitHub, GitHub Actions, Terraform, Docker, ECR, ECS

🔐 DevSecOps

Trivy, IAM, KMS, Secrets Manager, Security Groups, NACL, VPC Endpoints

📊 Observabilidad

CloudWatch, CloudWatch Logs, CloudWatch Metrics, CloudWatch Alarms, ECS Container Insights, Prometheus, Grafana

📂 Estructura del proyecto

estudiar/
│
├── .github/
│   └── workflows/
│       ├── terraform-dev.yml
│       └── security.yml
│
├── bankcloud-app/
│   ├── frontend/
│   │   ├── Dockerfile
│   │   └── main.go
│   ├── productcatalogservice/
│   │   └── Dockerfile
│   └── docker-compose.yml
│
├── terraform/
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
└── README.md

🏗 Arquitectura actual

                            INTERNET
                               │
                               ▼
                     ┌──────────────────┐
                     │ Internet Gateway │
                     └────────┬─────────┘
                              │
                              ▼
                     ┌──────────────────┐
                     │    Amazon VPC    │
                     │    BankCloud     │
                     └────────┬─────────┘
                              │
             ┌────────────────┴────────────────┐
             │                                 │
             ▼                                 ▼
      PUBLIC SUBNETS                    PRIVATE SUBNETS
             │                                 │
             ▼                                 ▼
     ┌───────────────┐                 ┌─────────────────┐
     │      ALB      │────────────────▶│   ECS Fargate   │
     └───────────────┘                 │  bankcloud-dev  │
                                       └────────┬────────┘
                                                │
                              ┌─────────────────┴─────────────────┐
                              │                                   │
                              ▼                                   ▼
                       ┌────────────┐                    ┌──────────────────┐
                       │  Frontend  │       gRPC         │ ProductCatalog   │
                       │   :8080    │───────────────────▶│ Service :3550    │
                       └────────────┘                    └──────────────────┘
                              │                                   │
                              ▼                                   ▼
                       Target Groups                       AWS Cloud Map
                              │
                              ▼
                         Health Check
                          /_healthz

                     PRIVATE DATABASE SUBNETS
                              │
                              ▼
                     ┌──────────────────┐
                     │    Amazon RDS    │
                     │    PostgreSQL    │
                     └──────────────────┘

Servicios complementarios

Amazon ECR
├── bankcloud/frontend
└── bankcloud/productcatalogservice

AWS Secrets Manager
AWS KMS
Amazon CloudWatch
Amazon S3
Amazon DynamoDB
VPC Endpoints

🔄 Flujo CI/CD

Developer
   │
   ▼
Git / GitHub
   │
   ▼
GitHub Actions
   │
   ├── Checkout
   ├── AWS Authentication
   ├── Docker Build
   ├── Trivy Security Scan
   ├── Push → Amazon ECR
   ├── Terraform Init
   ├── Terraform Fmt
   ├── Terraform Validate
   ├── Terraform Plan
   └── Terraform Apply
   │
   ▼
Amazon ECS Fargate
   │
   ├── Wait Services Stable
   └── Verify ECS Services
   │
   ▼
Application Load Balancer
   │
   ▼
Smoke Test → /_healthz
   │
   ├── SUCCESS → Deployment Completed
   └── FAILURE → Automatic Rollback

Las imágenes Docker utilizan el SHA del commit de Git como tag:

bankcloud/frontend:<commit-sha>
bankcloud/productcatalogservice:<commit-sha>

Esto permite identificar exactamente qué versión se encuentra desplegada en ECS y facilita el rollback.

📌 Sprints

✅ Sprint 1 – Arquitectura y Networking

Objetivo

Construir la infraestructura base de AWS mediante Terraform utilizando una arquitectura modular, segura y reproducible.

Implementado

✅ Bootstrap Terraform

✅ Backend remoto en Amazon S3

✅ State Locking

✅ VPC

✅ Subredes públicas

✅ Subredes privadas

✅ Subredes de base de datos

✅ Internet Gateway

✅ Elastic IP

✅ NAT Gateway

✅ Route Tables

✅ Route Table Associations

✅ Network ACL

✅ Security Groups

✅ VPC Endpoint para S3

✅ VPC Endpoints para servicios AWS

Validaciones

terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables
aws ec2 describe-internet-gateways
aws ec2 describe-nat-gateways

Estado: COMPLETADO ✅

✅ Sprint 2 – Docker y Amazon ECR

Objetivo

Containerizar los microservicios, aplicar buenas prácticas y almacenar las imágenes en Amazon ECR.

Implementado

✅ Dockerfile Frontend

✅ Dockerfile ProductCatalogService

✅ Multi-stage Builds

✅ Usuario no root

✅ Health Checks

✅ Optimización de imágenes

✅ Docker Compose

✅ Repositorios privados Amazon ECR

✅ Build de imágenes

✅ Push a ECR

Repositorios

bankcloud/frontend
bankcloud/productcatalogservice

Estado: COMPLETADO ✅

✅ Sprint 3 – Amazon ECS Fargate + ALB

Objetivo

Desplegar los microservicios sobre Amazon ECS Fargate con balanceo de carga y Service Discovery.

Implementado

✅ ECS Cluster bankcloud-dev

✅ ECS Task Definitions

✅ ECS Services

✅ AWS Fargate

✅ Application Load Balancer

✅ Target Groups

✅ Security Groups

✅ CloudWatch Logs

✅ AWS Cloud Map

✅ Service Discovery

✅ Networking privado

✅ Health Checks

✅ Rolling Deployments

Servicios

bankcloud-dev-frontend
Desired: 2
Running: 2
Rollout: COMPLETED

bankcloud-dev-productcatalogservice
Desired: 1
Running: 1
Rollout: COMPLETED

Health Check

/_healthz
HTTP/1.1 200 OK
ok

Estado: COMPLETADO ✅

✅ Sprint 4 – Amazon RDS PostgreSQL

Objetivo

Implementar una capa de persistencia administrada y protegida dentro de subredes privadas de base de datos.

Implementado

✅ Amazon RDS PostgreSQL

✅ DB Subnet Group

✅ Subredes privadas de base de datos

✅ Security Group dedicado

✅ Acceso controlado desde ECS

✅ AWS Secrets Manager

✅ Generación segura de contraseñas

✅ AWS KMS

✅ Parameter Group

✅ Integración mediante Terraform

ECS Fargate
     │
     ▼
Security Group ECS
     │
     ▼
Security Group RDS
     │
     ▼
Amazon RDS PostgreSQL
     │
     ├── Secrets Manager
     └── AWS KMS

Estado: COMPLETADO ✅

🟡 Sprint 5 – GitHub Actions CI/CD

Objetivo

Construir un pipeline CI/CD empresarial para automatizar seguridad, publicación de imágenes, infraestructura y despliegues.

Continuous Integration

✅ Checkout

✅ Autenticación AWS

✅ Login Amazon ECR

✅ Docker Build Frontend

✅ Docker Build ProductCatalogService

✅ Trivy Scan

✅ Bloqueo por vulnerabilidades HIGH/CRITICAL

✅ Tag mediante Git Commit SHA

✅ Push a Amazon ECR

Continuous Deployment

✅ Selección de ambiente

✅ Terraform Init / Fmt / Validate / Plan / Apply

✅ Actualización de ECS Task Definitions

✅ Despliegue ECS

✅ Espera automática de estabilidad

✅ Verificación de servicios

✅ ALB Health Checks

✅ Smoke Test /_healthz

✅ Pipeline ejecutado exitosamente

✅ Lógica de rollback automático

🟡 Prueba controlada del rollback pendiente

Evidencia funcional

CI - Build, Scan and Push     SUCCESS
CD - Terraform - DEV         SUCCESS
ECS Deployment               OK
Smoke Test                   OK

Estado: 95% 🟡

Pendiente: ejecutar, evidenciar y documentar la prueba controlada del rollback.

✅ Sprint 6 – Observabilidad

Objetivo

Implementar observabilidad para los servicios ECS Fargate mediante logs, métricas, alarmas, Prometheus y Grafana.

Implementado

✅ Amazon CloudWatch

✅ CloudWatch Logs para ECS

✅ CloudWatch Metrics

✅ CloudWatch Alarm de CPU para Frontend

✅ ECS Container Insights

✅ Módulo Terraform monitoring

✅ Prometheus sobre ECS Fargate

✅ Grafana sobre ECS Fargate

✅ Log Groups dedicados

✅ Security Group dedicado para monitoring

✅ VPC Endpoint de CloudWatch Logs

✅ Private DNS

✅ Prometheus y Grafana en subredes privadas

✅ Centralización de logs en CloudWatch

Estado de servicios

bankcloud-dev-grafana
Desired: 1
Running: 1
Pending: 0

bankcloud-dev-prometheus
Desired: 1
Running: 1
Pending: 0

CloudWatch Logs

/ecs/bankcloud-dev-grafana
└── ecs/grafana/22d4554a75934d0a963765be4cf4ea97

/ecs/bankcloud-dev-prometheus
├── ecs/prometheus/51986fc72da741c7980653472fd63733
└── ecs/prometheus/d78b2e8a82cb4ecb9dc22663b2ff9569

🚨 CloudWatch Alarm

Se implementó y validó una alarma de CPU para el servicio Frontend. La alarma fue llevada de forma controlada al estado ALARM y posteriormente CloudWatch regresó a OK al evaluar nuevamente las métricas reales.

🔧 Troubleshooting destacado

Durante el despliegue de Prometheus y Grafana, las tareas ECS presentaron:

ResourceInitializationError:
The task cannot find the Amazon CloudWatch log group defined
in the task definition.

Se validaron:

Task Definitions y Log Groups.

Route Tables de las subredes privadas.

NAT Gateway.

Network ACL.

Security Groups.

VPC Endpoint com.amazonaws.us-east-1.logs.

Private DNS.

La causa se resolvió corrigiendo el Security Group del VPC Endpoint para permitir tráfico HTTPS/443 desde la VPC.

Después del cambio aplicado mediante Terraform, Prometheus y Grafana alcanzaron estado estable:

Desired: 1
Running: 1
Pending: 0

Estado: COMPLETADO ✅

📅 Hoja de ruta

Sprint

Objetivo

Estado

1

Arquitectura y Networking

✅ 100%

2

Docker y Amazon ECR

✅ 100%

3

Amazon ECS Fargate + ALB

✅ 100%

4

Amazon RDS PostgreSQL

✅ 100%

5

GitHub Actions CI/CD

🟡 95%

6

Observabilidad

✅ 100%

7

Seguridad / DevSecOps

⏳ Pendiente

8

Alta disponibilidad, DR y Troubleshooting

⏳ Pendiente

📈 Avance general

Sprint 1  ████████████████████  100%
Sprint 2  ████████████████████  100%
Sprint 3  ████████████████████  100%
Sprint 4  ████████████████████  100%
Sprint 5  ███████████████████░   95%
Sprint 6  ████████████████████  100%
Sprint 7  ░░░░░░░░░░░░░░░░░░░░    0%
Sprint 8  ░░░░░░░░░░░░░░░░░░░░    0%

Avance aproximado: 74%

🏆 Estado actual

BankCloud integra actualmente:

Terraform + AWS VPC + ECS Fargate + ECR + ALB + RDS PostgreSQL + Secrets Manager + KMS + CloudWatch + CloudWatch Logs + CloudWatch Alarms + Container Insights + Prometheus + Grafana + Cloud Map + Docker + Trivy + GitHub Actions

El despliegue desde GitHub hasta AWS está automatizado, el endpoint /_healthz responde correctamente mediante el Application Load Balancer y la capa de observabilidad ejecuta Prometheus y Grafana sobre ECS Fargate con logs centralizados en CloudWatch.

Próximos pasos

Finalizar la prueba controlada de rollback del Sprint 5.

Iniciar Sprint 7 – Seguridad / DevSecOps.

Continuar con Sprint 8 – Alta disponibilidad, DR y Troubleshooting.

📌 Estado del proyecto

6 sprints implementados · Sprint 5 al 95% · Observabilidad operativa · Próximo hito: DevSecOps