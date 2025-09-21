# Task7_MySQL
# Task 7: Data Migration Between Two Databases

## Objective
The goal of this task is to migrate data from a legacy (denormalized) database structure into a new normalized database structure using SQL scripts.  
This ensures data consistency, eliminates redundancy, and follows proper relational database design principles.

---

## Tools
- **Database**: MySQL  
- **Editor**: Any SQL client (MySQL Workbench, phpMyAdmin, CLI, etc.)

---

## Deliverables
1. **Migration SQL Script** (contains steps to move data from legacy schema to new schema).  
2. **Before-and-After Schema Diagram** (to visualize structural changes).  
3. **Notes on Changes Made** (explains normalization improvements).

---

## Before Schema (Legacy Database)

In the legacy system, all student information was stored in a **single table**.  
This design caused redundancy, data inconsistency, and update anomalies.

