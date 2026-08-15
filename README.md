BankCloud – Plataforma Empresarial AWS DevOps

📖 Descripción

BankCloud es un laboratorio práctico de nivel profesional enfocado en el diseño, implementación, automatización y operación de una plataforma empresarial sobre Amazon Web Services (AWS) utilizando Terraform, Docker, Amazon ECS Fargate y GitHub Actions .

El proyecto simula la modernización de una plataforma tecnológica empresarial mediante una arquitectura Cloud basada en Infrastructure as Code (IaC) , contenedores, microservicios, redes privadas, balanceo de carga, bases de datos administradas, seguridad, observabilidad y automatización CI/CD.

La infraestructura está diseñada siguiendo principios de:

Infraestructura como código

DevOps

DevSecOps

Automatización

Alta disponibilidad

Seguridad por capas

Separación por ambientes

AWS Well-Architected Framework

El proyecto está orientado a demostrar competencias para roles como:

Ingeniero Cloud

Ingeniero DevOps

Ingeniero DevSecOps

Arquitecto de Soluciones AWS

Ingeniero de Plataforma

Ingeniero de Infraestructura Cloud

🎯 Objetivos

Diseñar una arquitectura empresarial sobre AWS.

Automatizar la infraestructura mediante Terraform.

Construir módulos Terraform reutilizables.

Implementar networking público, privado y de base de datos.

Containerizar microservicios con Docker.

Publicar imágenes en Amazon ECR.

Ejecutar cargas de trabajo mediante Amazon ECS Fargate.

Implementar un balanceador de carga de aplicaciones.

Implementar el descubrimiento de servicios.

Implementar PostgreSQL mediante Amazon RDS.

Gestionar credenciales mediante AWS Secrets Manager.

Utilizar AWS KMS para cifrado.

Automatizar CI/CD mediante GitHub Actions.

Ejecutar análisis de vulnerabilidades con Trivy.

Implementar Chequeos de Salud y Pruebas de Humo.

Implementar rollback automático.

Incorporar observabilidad y monitoreo.

Implementar controles DevSecOps.

Diseñar mecanismos de alta disponibilidad y recuperación.

Mantener una plataforma completamente reproducible mediante código.

🛠 Tecnologías

☁️ AWS

Amazon VPC

Amazon ECS

AWS Fargate

Amazon ECR

Application Load Balancer (ALB)

Grupos objetivo

Amazon RDS PostgreSQL

AWS Secrets Manager

AWS KMS

Mapa de la nube de AWS

Amazon CloudWatch

Amazon S3

Amazon DynamoDB

AWS IAM

NAT Gateway

Internet Gateway

VPC Endpoints

Grupos de seguridad

Network ACL (NACL)

🏗 Infraestructura como código

Terraform

Terraform Modules

Remote State

Backend de Amazon S3

State Locking

🐳 Contenedores

Docker

Docker Compose

Multi-stage Builds

Amazon ECR

🔄 DevOps / CI/CD

Git

GitHub

GitHub Actions

Terraform

Docker

Amazon ECR

Amazon ECS

🔐 DevSecOps

Trivy

AWS IAM

AWS KMS

AWS Secrets Manager

Grupos de seguridad

Network ACL (NACL)

VPC Endpoints

📊 Observabilidad

Amazon CloudWatch

CloudWatch Logs

CloudWatch Metrics

CloudWatch Alarms

ECS Container Insights

Prometheus

Grafana

Health Checks

Application Load Balancer

VPC Endpoint para CloudWatch Logs

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


Las imágenes Docker utilizan el SHA del commit de Git como etiqueta:

bankcloud/frontend:<commit-sha>

bankcloud/productcatalogservice:<commit-sha>


Esto permite identificar exactamente qué versión del código está ejecutándose en ECS y facilitar los procesos de rollback.

✅ Sprint 1 – Arquitectura y Networking

Objetivo

Construir la infraestructura base de AWS mediante Terraform utilizando una arquitectura modular, segura y reproducible.

Recursos implementados

✅ Bootstrap Terraform

✅ Backend remoto en Amazon S3

✅ Bloqueo de estado

✅ VPC

✅ Subredes públicas

✅ Subredes privadas

✅ Subredes de base de datos

✅ Puerta de enlace a Internet

✅ IP elástica

✅ Puerta de enlace NAT

✅ Tablas de ruta

✅ Asociaciones de tablas de ruta

✅ Lista de control de acceso (ACL) de red

✅ Grupos de seguridad

✅ Punto final VPC S3

✅ Puntos finales de VPC para servicios AWS

Validaciones

terraform init
terraform fmt
terraform validate
terraform plan
terraform apply

Validación mediante AWS CLI:

aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables
aws ec2 describe-internet-gateways
aws ec2 describe-nat-gateways

Resultado

Infraestructura creada mediante Terraform.

Remote State almacenado en Amazon S3.

Control de concurrencia del estado.

Networking público, privado y de base de datos.

Infraestructura modular y reproducible.

Sprint 1: COMPLETADO ✅

✅ Sprint 2 – Docker y Amazon ECR

Objetivo

Containerizar los microservicios utilizando Docker, aplicar buenas prácticas y almacenar las imágenes en Amazon ECR.

Implementación

✅ Dockerfile Frontend

✅ Dockerfile ProductCatalogService

✅ Construcción en varias etapas

✅ Usuario no root

✅ Chequeos médicos

✅ Optimización de imágenes

✅ Docker Compose

✅ Repositorios privados Amazon ECR

✅ Build de imágenes

✅ Empujar hacia ECR

Repositorios ECR

bankcloud/frontend
bankcloud/productcatalogservice


Validación

aws ecr describe-repositories

aws ecr describe-images \
  --repository-name bankcloud/frontend

aws ecr describe-images \
  --repository-name bankcloud/productcatalogservice

Sprint 2: COMPLETADO ✅

✅ Sprint 3 – Amazon ECS Fargate + ALB

Objetivo

Desplegar los microservicios sobre una plataforma de contenedores administrada utilizando Amazon ECS Fargate.

Implementación

✅ Clúster ECSbankcloud-dev

✅ Definiciones de tareas de ECS

✅ Servicios ECS

✅ AWS Fargate

✅ Balanceador de carga de aplicaciones

✅ Grupos objetivo

✅ Grupos de seguridad

✅ Registros de CloudWatch

✅ Mapa de la nube de AWS

✅ Descubrimiento de servicios

✅ Redes privadas

✅ Chequeos médicos

✅ Actualización continua de Despliegue

Servicios

bankcloud-dev-frontend
bankcloud-dev-productcatalogservice


Estado esperado:

Frontend
Desired: 2
Running: 2
Rollout: COMPLETED

ProductCatalogService
Desired: 1
Running: 1
Rollout: COMPLETED


Chequeo de salud

El ALB verifica:

/_healthz


Resultado validado:

HTTP/1.1 200 OK

ok


Sprint 3: COMPLETADO ✅

✅ Sprint 4 – Amazon RDS PostgreSQL

Objetivo

Implementar una capa de persistencia administrada y protegida dentro de las subredes privadas de base de datos.

Implementación

✅ Amazon RDS

✅ PostgreSQL

✅ Grupo de subredes de la base de datos

✅ Subredes privadas de base de datos

✅ Grupo de seguridad dedicado

✅ Acceso controlado desde ECS

✅ Administrador de secretos de AWS

✅ Generación segura de contraseña

✅ AWS KMS

✅ Grupo de parámetros

✅ Integración mediante Terraform

Arquitectura

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


Sprint 4: COMPLETADO ✅

🟡 Sprint 5 – GitHub Actions CI/CD

Objetivo

Construir un pipeline CI/CD empresarial para automatizar pruebas, seguridad, publicación de imágenes, infraestructura y despliegues.

Pipeline implementado

Integración continua

✅ Checkout del repositorio

✅ Autenticación AWS

✅ Iniciar sesión en Amazon ECR

✅ Docker Build Frontend

✅ Docker Build ProductCatalogService

✅ Interfaz de usuario de Trivy Scan

✅ Servicio de catálogo de productos Trivy Scan

✅ Bloqueo por vulnerabilidades ALTA/CRÍTICA

✅ Etiqueta de imágenes mediante Git Commit SHA

✅ Empujar hacia Amazon ECR

Despliegue continuo

✅ Selección de ambiente

✅ Inicialización de Terraform

✅ Formato Terraform

✅ Validación de Terraform

✅ Plan de terraformación

✅ Aplicar Terraform

✅ Actualización de definiciones de tareas de ECS

✅ Implementación ECS

✅ Espera automática de estabilidad

✅ Verificación de servicios

✅ Chequeos de salud del ALB

✅ Prueba de humo automática/_healthz

✅ Pipeline completo ejecutado exitosamente

✅ Implementación automática de reversión

🟡 Prueba controlada del rollback pendiente

Flujo

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


Evidencia funcional

El pipeline fue ejecutado correctamente sobre DEV obteniendo:

CI - Build, Scan and Push     SUCCESS

CD - Terraform - DEV         SUCCESS

ECS Deployment               OK

Smoke Test                   OK


También se verificó manualmente:

curl http://<ALB-DNS>/_healthz

Resultado:

HTTP/1.1 200 OK

ok


Estado

Sprint 5: 95% 🟡

Pendiente:

Prueba controlada del rollback.

Evidencia final del rollback.

Cierre documental del Sprint.

📅 Hoja de ruta

SprintObjetivoEstado





Sprint 1

Arquitectura y redes

✅ 100%

Sprint 2

Docker y Amazon ECR

✅ 100%

Sprint 3

Amazon ECS Fargate + ALB

✅ 100%

Sprint 4

Amazon RDS PostgreSQL

✅ 100%

Sprint 5

GitHub Actions CI/CD

🟡 95%

Sprint 6

Observabilidad

✅ 100%

Sprint 7

Seguridad / DevSecOps

⏳ Pendiente

Sprint 8

Alta Disponibilidad, DR y Solución de Problemas

⏳ Pendiente

✅ Sprint 6 – Observabilidad

Objetivo

Implementar una estrategia de observabilidad para los servicios desplegados en Amazon ECS Fargate, centralizando logs, métricas y alarmas, e incorporando Prometheus y Grafana como componentes de monitoreo.

Implementación

✅ Amazon CloudWatch

✅ CloudWatch Logs para servicios ECS

✅ CloudWatch Metrics

✅ CloudWatch Alarm para CPU del Frontend

✅ ECS Container Insights habilitado

✅ Módulo Terraform monitoring

✅ Prometheus desplegado sobre ECS Fargate

✅ Grafana desplegado sobre ECS Fargate

✅ Log Groups dedicados para Prometheus y Grafana

✅ Security Group dedicado para monitoring

✅ VPC Endpoint de CloudWatch Logs con Private DNS

✅ Ejecución de Prometheus y Grafana en subredes privadas

✅ Validación de conectividad mediante VPC Endpoint

✅ Centralización de logs en CloudWatch Logs

Servicios de monitoring

bankcloud-dev-grafana
Desired: 1
Running: 1
Pending: 0

bankcloud-dev-prometheus
Desired: 1
Running: 1
Pending: 0

Evidencia de CloudWatch Logs

/ecs/bankcloud-dev-grafana
ecs/grafana/22d4554a75934d0a963765be4cf4ea97

/ecs/bankcloud-dev-prometheus
ecs/prometheus/51986fc72da741c7980653472fd63733
ecs/prometheus/d78b2e8a82cb4ecb9dc22663b2ff9569

CloudWatch Alarm

Se implementó y validó una alarma de CPU para el servicio Frontend:

bankcloud-dev-frontend-cpu-high

La alarma fue llevada de forma controlada al estado ALARM y posteriormente CloudWatch la devolvió a OK al evaluar nuevamente las métricas reales.

Troubleshooting realizado

Durante el despliegue de Prometheus y Grafana, las tareas ECS presentaron:

ResourceInitializationError:
The task cannot find the Amazon CloudWatch log group defined in the task definition.

El diagnóstico incluyó:

Validación de Task Definitions.

Validación de Log Groups.

Validación de rutas de subredes privadas.

Validación del NAT Gateway.

Validación de Network ACL.

Validación de Security Groups.

Validación del VPC Endpoint com.amazonaws.us-east-1.logs.

Validación de Private DNS.

Corrección del Security Group del VPC Endpoint para permitir HTTPS (443) desde la VPC.

Después de aplicar la corrección mediante Terraform, las nuevas tareas de Prometheus y Grafana iniciaron correctamente y alcanzaron estado estable.

Resultado

La plataforma dispone ahora de observabilidad basada en CloudWatch, Prometheus y Grafana, con servicios de monitoring ejecutándose en ECS Fargate dentro de subredes privadas y logs centralizados en CloudWatch.

Sprint 6: COMPLETADO ✅

📈 Avance General

SprintAvance



Sprint 1

✅ 100%

Sprint 2

✅ 100%

Sprint 3

✅ 100%

Sprint 4

✅ 100%

Sprint 5

🟡 95%

Sprint 6

✅ 100%

Sprint 7

⏳ 0%

Sprint 8

⏳ 0%

Avance aproximado del proyecto: 62%

Sprint 1  ████████████████████ 100%
Sprint 2  ████████████████████ 100%
Sprint 3  ████████████████████ 100%
Sprint 4  ████████████████████ 100%
Sprint 5  ███████████████████░  95%
Sprint 6  ████████████████████ 100%
Sprint 7  ░░░░░░░░░░░░░░░░░░░░   0%
Sprint 8  ░░░░░░░░░░░░░░░░░░░░   0%


🏆 Estado actual

Actualmente BankCloud cuenta con una plataforma funcional que integra:

Terraform + AWS VPC + ECS Fargate + ECR + ALB + RDS PostgreSQL + Secrets Manager + KMS + CloudWatch + CloudWatch Logs + CloudWatch Alarms + Container Insights + Prometheus + Grafana + Cloud Map + Docker + Trivy + GitHub Actions.

El despliegue desde GitHub hasta AWS está automatizado, el endpoint de salud de la aplicación responde correctamente a través del Application Load Balancer y la capa de observabilidad cuenta con servicios de Prometheus y Grafana ejecutándose correctamente sobre ECS Fargate.

El Sprint 6 – Observabilidad está completado. El siguiente hito del proyecto es continuar con el Sprint 7 según la hoja de ruta y finalizar la evidencia pendiente del rollback controlado del Sprint 5.