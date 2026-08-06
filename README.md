# 🚀 BankCloud - Enterprise AWS DevOps Platform

![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazonaws)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?logo=terraform)
![GitHub](https://img.shields.io/badge/GitHub-Repository-181717?logo=github)
![Terraform](https://img.shields.io/badge/Infrastructure-as_Code-blue)
![Status](https://img.shields.io/badge/Sprint%201-80%25-yellow)

---

# 📖 Descripción

**BankCloud** es un proyecto diseñado para construir una plataforma empresarial sobre AWS utilizando Terraform e Infrastructure as Code (IaC).

El proyecto simula una infraestructura utilizada por una entidad financiera, implementando redes, seguridad, servicios compartidos, contenedores, bases de datos, monitoreo y CI/CD siguiendo las mejores prácticas de AWS Well-Architected Framework.

---

# 🎯 Objetivos

- Diseñar infraestructura empresarial en AWS.
- Automatizar el aprovisionamiento mediante Terraform.
- Implementar una arquitectura modular y reutilizable.
- Aplicar buenas prácticas DevOps.
- Construir un portafolio profesional.

---

# 🛠 Tecnologías

- AWS
- Terraform
- Git
- GitHub
- Docker
- Amazon ECS
- Amazon ECR
- Amazon RDS
- GitHub Actions
- CloudWatch
- Prometheus
- Grafana
- AWS WAF
- GuardDuty

---

# 📂 Estructura del proyecto

```text
terraform/
│
├── bootstrap/
├── environments/
│   ├── dev/
│   ├── qa/
│   └── prod/
│
├── modules/
│   ├── alb/
│   ├── ecr/
│   ├── ecs/
│   ├── iam/
│   ├── monitoring/
│   ├── networking/
│   ├── rds/
│   ├── security/
│   ├── shared/
│   └── vpc/
│
├── policies/
├── scripts/
└── templates/
```

---

# 🏗 Arquitectura Sprint 1

```text
                 AWS

             +----------------+
             |      VPC       |
             +----------------+
                    │
      ┌─────────────┼─────────────┐
      │             │             │
 Public Subnets  Private Subnets  Database Subnets
      │             │             │
      └────── Internet Gateway ───┘
                    │
               NAT Gateway
                    │
         Route Tables / NACL
                    │
           Security Groups
                    │
            VPC Endpoint S3
```

---

# ✅ Sprint 1 – Arquitectura y Networking

### Objetivo

Construir la infraestructura base de AWS mediante Terraform utilizando una arquitectura modular y reutilizable.

## Recursos implementados

- ✅ VPC
- ✅ Public Subnets
- ✅ Private Subnets
- ✅ Database Subnets
- ✅ Internet Gateway
- ✅ Elastic IP
- ✅ NAT Gateway
- ✅ Route Tables
- ✅ Route Associations
- ✅ Network ACL
- ✅ Security Groups
- ✅ VPC Endpoint (Amazon S3)

---

## Evidencias

### Validación Terraform

```bash
terraform init
terraform validate
terraform plan
```

Resultado

```
Plan: 5 to add, 0 to change, 0 to destroy.
```

---

### Validación AWS

Se verificó correctamente mediante AWS CLI:

```bash
aws ec2 describe-vpcs
aws ec2 describe-subnets
aws ec2 describe-route-tables
aws ec2 describe-internet-gateways
```

Se confirmó:

- VPC creada correctamente.
- Internet Gateway asociado.
- Route Tables configuradas.
- Subredes públicas y privadas disponibles.

---

## Estado del Sprint 1

| Actividad | Estado |
|------------|--------|
| Bootstrap | 🟡 |
| Backend remoto | 🟡 |
| VPC | ✅ |
| Public Subnets | ✅ |
| Private Subnets | ✅ |
| Database Subnets | ✅ |
| Internet Gateway | ✅ |
| NAT Gateway | ✅ |
| Route Tables | ✅ |
| Route Associations | ✅ |
| Network ACL | ✅ |
| Security Groups | ✅ |
| VPC Endpoint S3 | ✅ |

---

# 📅 Roadmap

| Sprint | Objetivo | Estado |
|---------|----------|--------|
| Sprint 1 | Arquitectura y Networking | 🟡 80% |
| Sprint 2 | Docker y Amazon ECR | ⚪ |
| Sprint 3 | ECS Fargate y ALB | ⚪ |
| Sprint 4 | Amazon RDS | ⚪ |
| Sprint 5 | GitHub Actions CI/CD | ⚪ |
| Sprint 6 | Observabilidad | ⚪ |
| Sprint 7 | Seguridad | ⚪ |
| Sprint 8 | Alta Disponibilidad y DR | ⚪ |

---

# 🚀 Próximos pasos

- Finalizar Backend Remoto (S3 + DynamoDB).
- Integrar el ambiente **dev**.
- Completar documentación técnica.
- Ejecutar despliegue completo desde cero.
- Publicar evidencias del Sprint 1.

---

# 👨‍💻 Autor

**Juan Sebastián Ferrer Bustos**

Ingeniero Electrónico

Especialista en Seguridad Informática

AWS Certified Solutions Architect • Terraform • DevOps • Cloud Engineer