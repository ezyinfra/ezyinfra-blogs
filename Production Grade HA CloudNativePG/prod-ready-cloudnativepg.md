# Production-Grade PostgreSQL using CloudNativePG

[![CloudNativePG](https://img.shields.io/badge/Operator-Kubernetes-blue?logo=kubernetes)](https://cloudnative-pg.io/)
[![PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-blue?logo=postgresql)](https://www.postgresql.org/)
[![Blog](https://img.shields.io/badge/Read%20the%20Blog-%F0%9F%93%9A-blue)](https://app.typeflo.io/site/561e34af-cb66-4d61-a1cb-360ebf0aa5dd/posts/bd6116cb-7cd7-4f0c-ae2b-7258cb7a1cd8)

> Get hands-on with setting up a **High Availability PostgreSQL cluster** on Kubernetes using CloudNativePG, with automated backups and Point-in-Time Recovery using **MinIO** and **Barman**!

---

## What’s Covered

- ✅ CloudNativePG HA cluster setup (Primary + Replicas)
- ☁️ MinIO installation for local S3-compatible object storage
- 🔐 Secrets management for DB and backup credentials
- 📦 Configuring automated backups using Barman
- ⏪ Performing PITR (Point-in-Time Recovery)
- 🧪 Simulating Failover in your cluster

---

## Technologies Used

- Kubernetes (Tested on Minikube / Killer Koda)
- CloudNativePG Operator
- PostgreSQL 15+
- MinIO
- Barman

---

## Why It Matters

Running PostgreSQL in production requires:
- High Availability
- Crash Recovery
- Backup consistency

With CloudNativePG, we get all of this **natively on Kubernetes**. Combined with MinIO + Barman, you’re set for a **robust, self-healing, and recoverable DB architecture**.

---

## 📖 Full Blog Post

🔗 [Read the Full Step-by-Step Guide](https://app.typeflo.io/site/561e34af-cb66-4d61-a1cb-360ebf0aa5dd/posts/bd6116cb-7cd7-4f0c-ae2b-7258cb7a1cd8)

---

## 🎯 Bonus

Looking to understand Kubernetes Operators better before diving in?  
👉 [Part 1: Introduction to Kubernetes Operators](https://ezyinfra.typeflo.io/blog/kubernetes-operators)

---

## 🤝 Contributions

Feel free to fork this repo and extend the examples, add different storage backends, or enhance recovery strategies!

---
