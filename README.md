# 🚀 BankCloud - Enterprise AWS DevOps Platform--juna ferrer jxjxjxjx  diana 

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)
![Docker](https://img.shields.io/badge/Docker-Containers-2496ED?logo=docker)
![Amazon ECR](https://img.shields.io/badge/Amazon-ECR-FF9900?logo=amazonaws)
![GitHub](https://img.shields.io/badge/GitHub-Repository-black?logo=github)
![License](https://img.shields.io/badge/License-MIT-green)

---

# 📖 Descripción

**BankCloud** es un laboratorio práctico de nivel profesional enfocado en el diseño, implementación y automatización de una plataforma empresarial sobre AWS utilizando **Terraform** e **Infrastructure as Code (IaC)**.

El proyectow simula la infraestructura tecnológica de una entidad financiera implementando redes, seguridad, contenedores, almacenamiento, monitoreo, despliegues automatizados y servicios administrados siguiendo las mejores prácticas del **AWS Well-Architected Framework**.

El objetivo es construir un proyecto completamente reproducible desde cero que sirva como portafolio profesional para cargos como:

- Cloud Engineer
- DevOps Engineer
- AWS Solutions Architect
- Platform Engineer

---

# 🎯 Objetivos

- Diseñar una arquitectura empresarial sobre AWS.
- Automatizar toda la infraestructura mediante Terraform.
- Construir módulos reutilizables.
- Implementar Docker con imágenes optimizadas.
- Publicar imágenes en Amazon ECR.
- Desplegar aplicaciones sobre Amazon ECS Fargate.
- Automatizar despliegues mediante GitHub Actions.
- Implementar observabilidad.
- Aplicar controles de seguridad.
- Documentar completamente la solución.

---

# 🛠 Tecnologías

## Cloud

- Amazon Web Services (AWS)
- Amazon VPC
- Amazon ECS
- Amazon ECR
- Amazon RDS
- IAM
- CloudWatch
- S3
- DynamoDB
- Elastic Load Balancer
- Auto Scaling

## Infrastructure as Code

- Terraform

## Contenedores

- Docker
- Docker Compose

## DevOps

- Git
- GitHub
- GitHub Actions

## Observabilidad

- CloudWatch
- Prometheus
- Grafana

## Seguridad

- AWS WAF
- GuardDuty
- Security Groups
- Network ACL
- IAM

---

# 📂 Estructura del proyecto

```text
bankcloud/
│
├── terraform/
│   ├── bootstrap/
│   ├── environments/
│   │   ├── dev/
│   │   ├── qa/
│   │   └── prod/
│   │
│   ├── modules/
│   │   ├── alb/
│   │   ├── ecr/
│   │   ├── ecs/
│   │   ├── iam/
│   │   ├── monitoring/
│   │   ├── networking/
│   │   ├── rds/
│   │   ├── security/
│   │   └── vpc/
│   │
│   ├── policies/
│   ├── scripts/
│   └── templates/
│
├── bankcloud-app/
│   ├── frontend/
│   ├── productcatalogservice/
│   └── docker-compose.yml
│
└── README.md
```

---

# 🏗 Arquitectura actual

```text
                              Internet
                                  │
                           Internet Gateway
                                  │
                      ┌────────────────────┐
                      │       AWS VPC      │
                      └────────────────────┘
                                  │
          ┌───────────────────────┴────────────────────────┐
          │                                                │
     Public Subnets                                  Private Subnets
          │                                                │
          │                                          NAT Gateway
          │                                                │
          └───────────────────────┬────────────────────────┘
                                  │
                         Security Groups
                                  │
                          Amazon Elastic
                        Container Registry
                                  │
                 ┌────────────────┴────────────────┐
                 │                                 │
       bankcloud/frontend          bankcloud/productcatalogservice
```
# ✅ Sprint 1 – Arquitectura y Networking

## Objetivo

Construir la infraestructura base de AWS mediante Terraform utilizando una arquitectura modular, segura y completamente automatizada.

## Recursos implementados

- ✅ Bootstrap Terraform
- ✅ Backend remoto (Amazon S3)
- ✅ Bloqueo del estado (Amazon DynamoDB)
- ✅ VPC
- ✅ Subredes públicas
- ✅ Subredes privadas
- ✅ Subredes de base de datos
- ✅ Internet Gateway
- ✅ Elastic IP
- ✅ NAT Gateway
- ✅ Tablas de rutas
- ✅ Asociaciones de tablas de rutas
- ✅ Network ACL
- ✅ Security Groups
- ✅ VPC Endpoint para Amazon S3

---

## Evidencias

### Validación Terraform

```bash
terraform init
terraform validate
terraform plan
terraform apply
```

### Validación AWS CLI

```bash
aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables
aws ec2 describe-internet-gateways
aws ec2 describe-nat-gateways
```

### Resultado

- ✅ Infraestructura creada correctamente.
- ✅ Backend remoto funcionando.
- ✅ Estado almacenado en Amazon S3.
- ✅ Bloqueo mediante DynamoDB.
- ✅ Infraestructura completamente reproducible mediante Terraform.

---

## Estado Sprint 1

| Recurso | Estado |
|---------|:------:|
| Bootstrap Terraform | ✅ |
| Backend remoto (S3) | ✅ |
| DynamoDB Lock | ✅ |
| VPC | ✅ |
| Public Subnets | ✅ |
| Private Subnets | ✅ |
| Database Subnets | ✅ |
| Internet Gateway | ✅ |
| Elastic IP | ✅ |
| NAT Gateway | ✅ |
| Route Tables | ✅ |
| Route Associations | ✅ |
| Network ACL | ✅ |
| Security Groups | ✅ |
| VPC Endpoint S3 | ✅ |

**Sprint 1: COMPLETADO ✅**

---

# ✅ Sprint 2 – Contenedores y Amazon ECR

## Objetivo

Containerizar los microservicios utilizando Docker, aplicar buenas prácticas de construcción de imágenes y publicarlas en Amazon Elastic Container Registry (ECR).

## Funcionalidades implementadas

- ✅ Dockerfile para Frontend
- ✅ Dockerfile para Product Catalog Service
- ✅ Multi-Stage Build
- ✅ Ejecución con usuario no root
- ✅ Health Checks
- ✅ Optimización del tamaño de las imágenes
- ✅ Archivo docker-compose.yml
- ✅ Repositorios privados en Amazon ECR
- ✅ Build de imágenes Docker
- ✅ Publicación de imágenes en Amazon ECR

---

## Evidencias

### Construcción de imágenes

```bash
docker build
docker tag
docker push
```

### Validación Amazon ECR

```bash
aws ecr describe-repositories

aws ecr describe-images --repository-name bankcloud/frontend

aws ecr describe-images --repository-name bankcloud/productcatalogservice
```

### Resultado

Se publicaron correctamente las siguientes imágenes:

| Imagen | Estado |
|---------|:------:|
| bankcloud/frontend:latest | ✅ |
| bankcloud/productcatalogservice:latest | ✅ |

Las imágenes quedaron almacenadas correctamente en Amazon ECR y listas para ser utilizadas por Amazon ECS Fargate.

---

## Estado Sprint 2

| Actividad | Estado |
|-----------|:------:|
| Dockerfile Frontend | ✅ |
| Dockerfile Backend | ✅ |
| Multi-Stage Build | ✅ |
| Usuario no root | ✅ |
| Health Checks | ✅ |
| Optimización de imágenes | ✅ |
| Docker Compose | ✅ |
| Amazon ECR | ✅ |
| Build Frontend | ✅ |
| Build Backend | ✅ |
| Push Frontend | ✅ |
| Push Backend | ✅ |

**Sprint 2: COMPLETADO ✅**

---

# 📅 Roadmap

| Sprint | Objetivo | Estado |
|---------|----------|:------:|
| Sprint 1 | Arquitectura y Networking | ✅ |
| Sprint 2 | Contenedores y Amazon ECR | ✅ |
| Sprint 3 | Amazon ECS Fargate + Application Load Balancer | ⏳ |
| Sprint 4 | Amazon RDS | ⏳ |
| Sprint 5 | GitHub Actions CI/CD | ⏳ |
| Sprint 6 | Observabilidad | ⏳ |
| Sprint 7 | Seguridad | ⏳ |
| Sprint 8 | Alta Disponibilidad y Disaster Recovery | ⏳ |

---

# 🚀 Próximo Sprint

## Sprint 3 – Amazon ECS Fargate

### Objetivos

- Crear Amazon ECS Cluster.
- Crear Task Definitions.
- Crear ECS Services.
- Configurar Application Load Balancer.
- Configurar Target Groups.
- Configurar CloudWatch Logs.
- Configurar Auto Scaling.
- Desplegar los microservicios utilizando Terraform.

---

# 📈 Avance General jajajaj

| Sprint | Estado |
|---------|:------:|
| Sprint 1 | ✅ 100% |
| Sprint 2 | ✅ 100% |
| Sprint 3 | ⏳ |
| Sprint 4 | ⏳ |
| Sprint 5 | ⏳ |
| Sprint 6 | ⏳ |
| Sprint 7 | ⏳ |
| Sprint 8 | ⏳ |

**Avance del proyecto: 25%**
---

