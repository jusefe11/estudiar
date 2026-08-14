# ☁️ BankCloud – Plataforma Empresarial AWS DevOps

## 📖 Descripción

**BankCloud** es un laboratorio práctico de nivel profesional enfocado en el diseño, implementación, automatización y operación de una plataforma empresarial sobre **Amazon Web Services (AWS)** utilizando **Terraform, Docker, Amazon ECS Fargate y GitHub Actions**.

El proyecto simula la modernización de una plataforma tecnológica empresarial mediante una arquitectura Cloud basada en **Infrastructure as Code (IaC)**, contenedores, microservicios, redes privadas, balanceo de carga, bases de datos administradas, seguridad, observabilidad y automatización CI/CD.

La infraestructura está diseñada siguiendo principios de:

- Infrastructure as Code
- DevOps
- DevSecOps
- Automatización
- Alta disponibilidad
- Seguridad por capas
- Separación por ambientes
- AWS Well-Architected Framework

El proyecto está orientado a demostrar competencias para roles como:

- Cloud Engineer
- DevOps Engineer
- DevSecOps Engineer
- AWS Solutions Architect
- Platform Engineer
- Cloud Infrastructure Engineer

---

# 🎯 Objetivos

- Diseñar una arquitectura empresarial sobre AWS.
- Automatizar la infraestructura mediante Terraform.
- Construir módulos Terraform reutilizables.
- Implementar networking público, privado y de base de datos.
- Containerizar microservicios con Docker.
- Publicar imágenes en Amazon ECR.
- Ejecutar workloads mediante Amazon ECS Fargate.
- Implementar Application Load Balancer.
- Implementar Service Discovery.
- Implementar PostgreSQL mediante Amazon RDS.
- Gestionar credenciales mediante AWS Secrets Manager.
- Utilizar AWS KMS para cifrado.
- Automatizar CI/CD mediante GitHub Actions.
- Ejecutar análisis de vulnerabilidades con Trivy.
- Implementar Health Checks y Smoke Tests.
- Implementar rollback automático.
- Incorporar observabilidad y monitoreo.
- Implementar controles DevSecOps.
- Diseñar mecanismos de alta disponibilidad y recuperación.
- Mantener una plataforma completamente reproducible mediante código.

---

# 🛠 Tecnologías

## ☁️ AWS

- Amazon VPC
- Amazon ECS
- AWS Fargate
- Amazon ECR
- Application Load Balancer (ALB)
- Target Groups
- Amazon RDS PostgreSQL
- AWS Secrets Manager
- AWS KMS
- AWS Cloud Map
- Amazon CloudWatch
- Amazon S3
- Amazon DynamoDB
- AWS IAM
- NAT Gateway
- Internet Gateway
- VPC Endpoints
- Security Groups
- Network ACL

## 🏗 Infrastructure as Code

- Terraform
- Terraform Modules
- Remote State
- Amazon S3 Backend
- State Locking

## 🐳 Contenedores

- Docker
- Docker Compose
- Multi-Stage Builds
- Amazon ECR

## 🔄 DevOps / CI/CD

- Git
- GitHub
- GitHub Actions
- Terraform
- Docker
- Amazon ECR
- Amazon ECS

## 🔐 DevSecOps

- Trivy
- AWS IAM
- AWS KMS
- AWS Secrets Manager
- Security Groups
- Network ACL
- VPC Endpoints

## 📊 Observabilidad

- Amazon CloudWatch
- CloudWatch Logs
- Health Checks
- Application Load Balancer
- Prometheus — próximo sprint
- Grafana — próximo sprint

---

# 📂 Estructura del proyecto

```text
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
│   │
│   ├── productcatalogservice/
│   │   └── Dockerfile
│   │
│   └── docker-compose.yml
│
├── terraform/
│   ├── bootstrap/
│   │
│   ├── environments/
│   │   ├── dev/
│   │   ├── qa/
│   │   └── prod/
│   │
│   └── modules/
│       ├── alb/
│       ├── cloudmap/
│       ├── cloudwatch/
│       ├── ecr/
│       ├── ecs/
│       ├── iam/
│       ├── rds/
│       └── vpc/
│
└── README.md
```

---

# 🏗 Arquitectura actual

```text
                            INTERNET
                               │
                               ▼
                     ┌──────────────────┐
                     │ Internet Gateway │
                     └────────┬─────────┘
                              │
                              ▼
                  ┌───────────────────────┐
                  │      Amazon VPC       │
                  │      bankcloud        │
                  └───────────┬───────────┘
                              │
             ┌────────────────┴────────────────┐
             │                                 │
             ▼                                 ▼
      PUBLIC SUBNETS                    PRIVATE SUBNETS
             │                                 │
             ▼                                 │
    Application Load                           │
        Balancer                               │
             │                                 │
             └──────────────┬──────────────────┘
                            ▼
                   ┌─────────────────┐
                   │   ECS Fargate   │
                   │ bankcloud-dev   │
                   └────────┬────────┘
                            │
              ┌─────────────┴─────────────┐
              │                           │
              ▼                           ▼
       ┌────────────┐          ┌──────────────────────┐
       │  Frontend  │  gRPC    │ ProductCatalog      │
       │   :8080    │─────────▶│ Service :3550       │
       └────────────┘          └──────────────────────┘
              │                           │
              │                   AWS Cloud Map
              │
              ▼
       Target Groups
              │
              ▼
       Health Checks
        /_healthz

                 PRIVATE DATABASE SUBNETS
                            │
                            ▼
                    ┌───────────────┐
                    │ Amazon RDS    │
                    │ PostgreSQL    │
                    └───────────────┘

Additional Services:

Amazon ECR
   │
   ├── bankcloud/frontend
   └── bankcloud/productcatalogservice

AWS Secrets Manager
AWS KMS
Amazon CloudWatch
Amazon S3
Amazon DynamoDB
VPC Endpoints
```

---

# 🔄 Flujo CI/CD

```text
Developer
    │
    ▼
Git / GitHub
    │
    ▼
GitHub Actions
    │
    ├── Checkout
    │
    ├── AWS Authentication
    │
    ├── Docker Build
    │
    ├── Trivy Security Scan
    │
    ├── Push Amazon ECR
    │
    ├── Terraform Init
    │
    ├── Terraform Format
    │
    ├── Terraform Validate
    │
    ├── Terraform Plan
    │
    ├── Terraform Apply
    │
    ▼
Amazon ECS Fargate
    │
    ├── Wait Services Stable
    ├── Verify ECS Services
    │
    ▼
Application Load Balancer
    │
    ▼
Smoke Test
/_healthz
    │
    ├── OK ───────▶ Deployment Completed
    │
    └── FAIL ─────▶ Automatic Rollback
```

Las imágenes Docker utilizan el **SHA del commit de Git** como tag:

```text
bankcloud/frontend:<commit-sha>

bankcloud/productcatalogservice:<commit-sha>
```

Esto permite identificar exactamente qué versión del código está ejecutándose en ECS y facilita procesos de rollback.

---

# ✅ Sprint 1 – Arquitectura y Networking

## Objetivo

Construir la infraestructura base de AWS mediante Terraform utilizando una arquitectura modular, segura y reproducible.

## Recursos implementados

- ✅ Bootstrap Terraform
- ✅ Backend remoto en Amazon S3
- ✅ State Locking
- ✅ VPC
- ✅ Subredes públicas
- ✅ Subredes privadas
- ✅ Subredes de base de datos
- ✅ Internet Gateway
- ✅ Elastic IP
- ✅ NAT Gateway
- ✅ Route Tables
- ✅ Route Table Associations
- ✅ Network ACL
- ✅ Security Groups
- ✅ VPC Endpoint S3
- ✅ VPC Endpoints para servicios AWS

## Validaciones

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Validación mediante AWS CLI:

```bash
aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables
aws ec2 describe-internet-gateways
aws ec2 describe-nat-gateways
```

## Resultado

- Infraestructura creada mediante Terraform.
- Estado remoto almacenado en Amazon S3.
- Control de concurrencia del estado.
- Networking público, privado y de base de datos.
- Infraestructura modular y reproducible.

**Sprint 1: COMPLETADO ✅**

---

# ✅ Sprint 2 – Docker y Amazon ECR

## Objetivo

Containerizar los microservicios utilizando Docker, aplicar buenas prácticas y almacenar las imágenes en Amazon ECR.

## Implementación

- ✅ Dockerfile Frontend
- ✅ Dockerfile ProductCatalogService
- ✅ Multi-Stage Build
- ✅ Usuario no root
- ✅ Health Checks
- ✅ Optimización de imágenes
- ✅ Docker Compose
- ✅ Repositorios privados Amazon ECR
- ✅ Build de imágenes
- ✅ Push hacia ECR

## Repositorios ECR

```text
bankcloud/frontend
bankcloud/productcatalogservice
```

## Validación

```bash
aws ecr describe-repositories

aws ecr describe-images \
  --repository-name bankcloud/frontend

aws ecr describe-images \
  --repository-name bankcloud/productcatalogservice
```

**Sprint 2: COMPLETADO ✅**

---

# ✅ Sprint 3 – Amazon ECS Fargate + ALB

## Objetivo

Desplegar los microservicios sobre una plataforma de contenedores administrada utilizando Amazon ECS Fargate.

## Implementación

- ✅ ECS Cluster `bankcloud-dev`
- ✅ ECS Task Definitions
- ✅ ECS Services
- ✅ AWS Fargate
- ✅ Application Load Balancer
- ✅ Target Groups
- ✅ Security Groups
- ✅ CloudWatch Logs
- ✅ AWS Cloud Map
- ✅ Service Discovery
- ✅ Networking privado
- ✅ Health Checks
- ✅ Despliegue Rolling Update

## Servicios

```text
bankcloud-dev-frontend
bankcloud-dev-productcatalogservice
```

Estado esperado:

```text
Frontend
Desired: 2
Running: 2
Rollout: COMPLETED

ProductCatalogService
Desired: 1
Running: 1
Rollout: COMPLETED
```

## Health Check

El ALB verifica:

```text
/_healthz
```

Resultado validado:

```text
HTTP/1.1 200 OK

ok
```

**Sprint 3: COMPLETADO ✅**

---

# ✅ Sprint 4 – Amazon RDS PostgreSQL

## Objetivo

Implementar una capa de persistencia administrada y protegida dentro de las subredes privadas de base de datos.

## Implementación

- ✅ Amazon RDS
- ✅ PostgreSQL
- ✅ DB Subnet Group
- ✅ Subredes privadas de base de datos
- ✅ Security Group dedicado
- ✅ Acceso controlado desde ECS
- ✅ AWS Secrets Manager
- ✅ Generación segura de contraseña
- ✅ AWS KMS
- ✅ Parameter Group
- ✅ Integración mediante Terraform

## Arquitectura

```text
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
```

**Sprint 4: COMPLETADO ✅**

---

# 🟡 Sprint 5 – GitHub Actions CI/CD

## Objetivo

Construir un pipeline CI/CD empresarial para automatizar pruebas, seguridad, publicación de imágenes, infraestructura y despliegues.

## Pipeline implementado

### Continuous Integration

- ✅ Checkout del repositorio
- ✅ Autenticación AWS
- ✅ Login Amazon ECR
- ✅ Docker Build Frontend
- ✅ Docker Build ProductCatalogService
- ✅ Trivy Scan Frontend
- ✅ Trivy Scan ProductCatalogService
- ✅ Bloqueo por vulnerabilidades HIGH/CRITICAL
- ✅ Tag de imágenes mediante Git Commit SHA
- ✅ Push hacia Amazon ECR

### Continuous Deployment

- ✅ Selección de ambiente
- ✅ Terraform Init
- ✅ Terraform Format
- ✅ Terraform Validate
- ✅ Terraform Plan
- ✅ Terraform Apply
- ✅ Actualización de ECS Task Definitions
- ✅ Deployment ECS
- ✅ Espera automática de estabilidad
- ✅ Verificación de servicios
- ✅ Health Checks del ALB
- ✅ Smoke Test automático `/_healthz`
- ✅ Pipeline completo ejecutado exitosamente
- ✅ Rollback automático implementado
- 🟡 Prueba controlada del rollback pendiente

## Flujo

```text
Git Commit
     │
     ▼
GitHub Actions
     │
     ▼
Docker Build
     │
     ▼
Trivy
     │
     ▼
Amazon ECR
     │
     ▼
Terraform Plan
     │
     ▼
Terraform Apply
     │
     ▼
Amazon ECS
     │
     ▼
Wait Services Stable
     │
     ▼
Smoke Test
     │
     ├── SUCCESS → Deployment Completed
     │
     └── FAILURE → Automatic Rollback
```

## Evidencia funcional

El pipeline fue ejecutado correctamente sobre DEV obteniendo:

```text
CI - Build, Scan and Push     SUCCESS

CD - Terraform - DEV         SUCCESS

ECS Deployment               OK

Smoke Test                   OK
```

También se verificó manualmente:

```bash
curl http://<ALB-DNS>/_healthz
```

Resultado:

```text
HTTP/1.1 200 OK

ok
```

## Estado

**Sprint 5: 95% 🟡**

Pendiente:

- Prueba controlada del rollback.
- Evidencia final del rollback.
- Cierre documental del Sprint.

---

# 📅 Roadmap

| Sprint | Objetivo | Estado |
|---|---|---|
| Sprint 1 | Arquitectura y Networking | ✅ 100% |
| Sprint 2 | Docker y Amazon ECR | ✅ 100% |
| Sprint 3 | Amazon ECS Fargate + ALB | ✅ 100% |
| Sprint 4 | Amazon RDS PostgreSQL | ✅ 100% |
| Sprint 5 | GitHub Actions CI/CD | 🟡 95% |
| Sprint 6 | Observabilidad | ⏳ Pendiente |
| Sprint 7 | Seguridad / DevSecOps | ⏳ Pendiente |
| Sprint 8 | Alta Disponibilidad, DR y Troubleshooting | ⏳ Pendiente |

---

# 🚧 Sprint 6 – Observabilidad

## Próximo objetivo

Implementar una estrategia completa de observabilidad para infraestructura y aplicaciones.

### Actividades previstas

- Amazon CloudWatch
- CloudWatch Logs
- CloudWatch Metrics
- CloudWatch Alarms
- Métricas ECS
- Métricas ALB
- Métricas RDS
- Centralización de logs
- Prometheus
- Grafana
- Dashboards
- Alertas
- Monitoreo de disponibilidad
- Monitoreo de rendimiento

---

# 📈 Avance General

| Sprint | Avance |
|---|---:|
| Sprint 1 | ✅ 100% |
| Sprint 2 | ✅ 100% |
| Sprint 3 | ✅ 100% |
| Sprint 4 | ✅ 100% |
| Sprint 5 | 🟡 95% |
| Sprint 6 | ⏳ 0% |
| Sprint 7 | ⏳ 0% |
| Sprint 8 | ⏳ 0% |

## Avance aproximado del proyecto: **62%**

```text
Sprint 1  ████████████████████ 100%
Sprint 2  ████████████████████ 100%
Sprint 3  ████████████████████ 100%
Sprint 4  ████████████████████ 100%
Sprint 5  ███████████████████░  95%
Sprint 6  ░░░░░░░░░░░░░░░░░░░░   0%
Sprint 7  ░░░░░░░░░░░░░░░░░░░░   0%
Sprint 8  ░░░░░░░░░░░░░░░░░░░░   0%
```

---

# 🏆 Estado actual

Actualmente BankCloud cuenta con una plataforma funcional que integra:

**Terraform + AWS VPC + ECS Fargate + ECR + ALB + RDS PostgreSQL + Secrets Manager + KMS + CloudWatch + Cloud Map + Docker + Trivy + GitHub Actions.**

El despliegue desde GitHub hasta AWS está automatizado y el endpoint de salud de la aplicación responde correctamente a través del Application Load Balancer.

El siguiente hito es completar la validación del **rollback automático del Sprint 5** y posteriormente avanzar al **Sprint 6 – Observabilidad**.