# 🚀 BankCloud - Proyecto DevOps en AWS

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)
![Git](https://img.shields.io/badge/Git-Version_Control-F05032?logo=git)
![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?logo=github)
![Status](https://img.shields.io/badge/Status-Sprint%201%20en%20progreso-success)

---

# 📖 Descripción

Este proyecto documenta el desarrollo de una infraestructura Cloud empresarial utilizando AWS y Terraform siguiendo buenas prácticas de DevOps e Infrastructure as Code (IaC).

El objetivo es construir una plataforma completa desde cero, automatizando la infraestructura, el despliegue de aplicaciones, la observabilidad, la seguridad y los procesos de CI/CD.

---

# 🎯 Objetivos

- Aprender Terraform desde un nivel profesional.
- Diseñar infraestructura empresarial en AWS.
- Automatizar despliegues.
- Implementar buenas prácticas DevOps.
- Construir un portafolio técnico.

---

# 🛠 Tecnologías

- AWS
- Terraform
- Git
- GitHub
- Docker *(Sprint 2)*
- Amazon ECR *(Sprint 2)*
- Amazon ECS Fargate *(Sprint 3)*
- Amazon RDS *(Sprint 4)*
- GitHub Actions *(Sprint 5)*
- CloudWatch *(Sprint 6)*
- Prometheus *(Sprint 6)*
- Grafana *(Sprint 6)*
- AWS WAF *(Sprint 7)*
- GuardDuty *(Sprint 7)*

---

# 📂 Estructura del proyecto

```text
terraform/
│
├── environments/
│   ├── dev/
│   ├── qa/
│   └── prod/
│
└── modules/
    └── vpc/
```

---

# 🏗 Arquitectura actual

Actualmente la infraestructura desplegada incluye:

- VPC
- 2 Public Subnets
- 2 Private Subnets
- 2 Database Subnets

```text
AWS
│
└── VPC (10.0.0.0/16)
      │
      ├── Public Subnet A
      ├── Public Subnet B
      │
      ├── Private Subnet A
      ├── Private Subnet B
      │
      ├── Database Subnet A
      └── Database Subnet B
```

---

# 📅 Roadmap

## Sprint 1 – Arquitectura Base

- [x] AWS CLI
- [x] Terraform
- [x] Cuenta AWS
- [x] Usuario IAM
- [x] Access Keys
- [x] Configuración AWS CLI
- [x] Terraform Init
- [x] Terraform Validate
- [x] Terraform Plan
- [x] Terraform Apply
- [x] VPC
- [x] Public Subnets
- [x] Private Subnets
- [x] Database Subnets
- [ ] Backend remoto S3
- [ ] DynamoDB Lock

---

## Sprint 2

- [ ] Docker
- [ ] Dockerfile
- [ ] Multi Stage Build
- [ ] Docker Compose
- [ ] Amazon ECR

---

## Sprint 3

- [ ] ECS Fargate
- [ ] Load Balancer
- [ ] Auto Scaling

---

## Sprint 4

- [ ] Amazon RDS PostgreSQL

---

## Sprint 5

- [ ] GitHub Actions
- [ ] CI/CD

---

## Sprint 6

- [ ] CloudWatch
- [ ] Prometheus
- [ ] Grafana

---

## Sprint 7

- [ ] WAF
- [ ] GuardDuty
- [ ] Security Hub

---

## Sprint 8

- [ ] Troubleshooting
- [ ] Disaster Recovery
- [ ] Alta Disponibilidad

---

# 📊 Estado del proyecto

| Sprint | Estado |
|---------|--------|
| Sprint 1 | 🟡 95% |
| Sprint 2 | ⚪ 0% |
| Sprint 3 | ⚪ 0% |
| Sprint 4 | ⚪ 0% |
| Sprint 5 | ⚪ 0% |
| Sprint 6 | ⚪ 0% |
| Sprint 7 | ⚪ 0% |
| Sprint 8 | ⚪ 0% |

---

# 👨‍💻 Autor

Juan Sebastián Ferrer Bustos

Ingeniero Electrónico

Especialista en Seguridad Informática

AWS | Terraform | DevOps | Cloud