---
layout: page
permalink: /Azure/Terraform/sql_database/
icon: SQLDatabase.svg 
description: SQL Databse 
status: Ready for Production
automation: TerraformModule
onlineTemplateReference: sql_database
onlineServiceDescription: 
name: SQL Database with Terraform
title: SQL Database with Terraform
tags:
- Azure SQL Database

---

{%- include template_terraform.html -%}

How this Management groups get executed :

1. Connect to Azure
2. Login from VS code
3. Once the connection is establish your able to login to azure portal
4. Then Next we use the terraform commmands like, terraform init, terraform validate, terraform plan & terraform apply to create resource in portal.
5. First we need to execute the script in Non-prod.