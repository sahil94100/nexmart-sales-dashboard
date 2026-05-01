# 🚀 NexMart E-Commerce Sales Dashboard (SQL + Power BI)

<p align="center">

![SQL](https://img.shields.io/badge/SQL-MySQL-blue?style=for-the-badge\&logo=mysql)
![Power BI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow?style=for-the-badge\&logo=powerbi)
![Data Analyst](https://img.shields.io/badge/Role-Data%20Analyst-success?style=for-the-badge)
![Project](https://img.shields.io/badge/Project-End--to--End%20Analytics-purple?style=for-the-badge)

</p>

---

## 📌 Project Overview

> Transforming **raw e-commerce data into executive-level insights** using SQL and Power BI.

This project simulates a **real-world business scenario** where NexMart’s leadership lacks visibility into performance, customer value, and regional trends.

🔄 **End-to-End Workflow:**

```id="flow"
Raw Data → SQL Cleaning → Advanced Analysis → Power BI Dashboard → Business Insights
```

---

## 🧠 Business Context

NexMart operates across **4 US regions** with **3 product categories**, but decision-making is limited due to lack of analytics.

### 🎯 Objective:

* Identify **top-performing products**
* Segment **high-value customers**
* Analyze **regional performance**
* Track **business growth patterns**

---

## 🗂️ Repository Structure

```id="structure"
nexmart-sales-dashboard/
│
├── 📊 Dashboard.pbix                  ← Power BI Dashboard ⭐
├── 📄 SQL_Queries.sql                 ← Analysis Engine
├── 📄 NexMart_Problem_Statement.pdf   ← Business Context
├── 📂 Dataset/
│   └── Sample-Superstore.csv
└── 📂 Screenshots/
    └── dashboard.png
```

---

## 📸 Dashboard Preview

> 💡 *Real Power BI dashboard built using NexMart dataset*

![Dashboard](Screenshots/dashboard.png)

---

## 🧹 Data Preparation (SQL)

Handled multiple real-world data issues:

* 📅 Standardized inconsistent date formats
* 🧱 Fixed schema & column naming issues
* 🔍 Cleaned sub-category inconsistencies
* ⚙️ Converted raw data → analysis-ready table

```sql id="sql1"
STR_TO_DATE(`Order Date`, '%d-%m-%Y')
```

---

## 🧠 Advanced SQL Analytics

### 💡 Techniques Used:

* Aggregations → `SUM()`, `COUNT()`, `AVG()`
* Filtering → `HAVING`
* Window Functions → `LAG()`, `ROW_NUMBER()`
* CTEs → `WITH` clause
* Date Functions → `DATE_FORMAT()`

---

## 📊 Power BI Dashboard Features

✔ KPI Cards (Revenue, Profit, Margin, Orders, Customers)
✔ Monthly Revenue Trend Visualization
✔ Region-wise Revenue Comparison
✔ Top Sub-Categories Performance
✔ Customer Ranking Table
✔ Interactive & Executive UI

---

## 🎨 Dashboard Design

* 🌙 Dark Theme (#0F1117 / #181C2A)
* 📊 Clean executive layout
* 🎯 Focus on business decision-making
* ⚡ Smooth interactive visuals

---

## 💼 Skills Demonstrated

```id="skills"
✔ SQL Data Cleaning
✔ Advanced SQL (Window Functions, CTEs)
✔ Business Analysis
✔ Data Storytelling
✔ Power BI Dashboard Design
✔ Analytical Thinking
```

---

## 🏆 Why This Project Stands Out

✔ Real-world messy dataset simulation
✔ Strong business problem framing
✔ Advanced SQL (not basic queries)
✔ Clear storytelling (Problem → Insight → Action)
✔ Recruiter-friendly structure

---

## 🚀 How to Use

1. Download `.pbix` file
2. Open in **Power BI Desktop**
3. Explore dashboard interactively

---

## 🔗 Let’s Connect

📩 Open to **Data Analyst roles**
📈 Passionate about turning data into decisions

---

## ⭐ Support

If you found this useful:

* ⭐ Star this repo
* 🍴 Fork it
* 📢 Share it

---

<p align="center">
🔥 Built with SQL + Power BI | Portfolio Project by Sahil
</p>
