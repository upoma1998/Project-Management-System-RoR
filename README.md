# 🚀 Project Management System (PMS)

A role-based **Project & User Management System** built with **Ruby on Rails**, featuring Organizations, Members, and Admins with authentication, authorization, project/task management, and plan-based project creation.  

---

## 📌 Entity-Relationship Diagram 
## [ERD] [📄](https://drive.google.com/file/d/1ESTqEvZx9bBULUBQOeCtbuVlQ-fN7IsY/view?usp=sharing)

---

## 📖 Project Description  

This system supports **three types of users**:  

- **👨‍💼 Organizations** – Manage projects and members.  
- **👤 Members** – Assigned to projects, manage and assign tasks.  
- **🛡️ Admins** – Oversee organizations, projects, and members.  

### 🔑 Key Features  

1. **Organization Module**  
   - Organizations can register and create projects under a plan.  
   - Two plans available:  
     - 🆓 **Free Plan** → Only **1 project** allowed.  
     - 💎 **Paid Plan** → Multiple projects supported.  
   - Add members to projects, who can then register and collaborate.  

2. **Member Module**  
   - View assigned projects.  
   - Create tasks, assign tasks to other members, and manage updates.  

3. **Admin Module**  
   - Manage organizations, projects (free & paid), and members.  

---

## ✅ Requirements Implemented  

- 🔐 **Authentication** for Organizations, Members, and Admins using **Devise JWT**.  
- 🔒 **Authorization** for role-based access:  
  - **Organization** → CRUD on projects & member management.  
  - **Admin** → CRUD on organizations, projects, and members.  
  - **Member** → Create, assign, update, and delete tasks.  
- 🔄 **Plan Switching** → Seamlessly switch between free and paid project plans.  

---

## 🛠️ Tech Stack  

- **Language**: Ruby `3.2.0`  
- **Framework**: Ruby on Rails
- **Front End**: ReactJS 
- **Database**: PostgreSQL (via Docker container)  
- **Authentication**: Devise JWT  
- **Containerization**: Docker & Docker Compose
