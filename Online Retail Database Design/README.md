# Retail Sales Database Design - Project 1

This project models a relational **Online Retail Sales Database** in MySQL for an online shopping platform. It includes fully normalized tables, realistic sample data, business-critical queries, and powerful views to simulate a production-grade backend system. It serves both operational and analytical needs such as order tracking, payment summaries, product analytics, and customer segmentation.


## Project Objectives
- Design a scalable, normalized schema for retail sales
- Create realistic sample datasets for customers, products, orders, and payments
- Implement advanced SQL queries for real-world business analysis
- Enable insights on revenue, inventory, payment behavior, and customer value


## Tools & Technologies Used
- **Database Engine**: MySQL (via MySQL Workbench)
- **SQL**: DDL, DML, Joins, Aggregates, Views
- **ER Diagram**: [draw.io](https://draw.io)
- **Reporting**: Analytical SQL + Business Insights


## Database Schema
The database consists of the following key entities:
- **Customers**: Personal info, contact, registration date
- **Products**: Inventory, price, supplier details
- **Orders**: Order date, status, customer linkage
- **Order Items**: Line items for each order
- **Payments**: Method, status, transaction info

**ER Diagram**: [View Live ER Diagram](https://viewer.diagrams.net/index.html?highlight=0000ff&edit=_blank&layers=1&nav=1#R<...>)


## Contents of Repository

|                      File Name                      |                        Description                       |
|-----------------------------------------------------|----------------------------------------------------------|
| `Retail Sales Database Design.sql`                  | Complete DDL + DML script with schema and sample data    |
| `Sample Data - Retail Sales Database Design.sql`    | Data-only script for quick testing                       |
| `Query Outputs - Retail Sales Database Design.docx` | Business insights and query result snapshots             |
| `Retail Sales Database Design Project Report.docx`  | Full report with objectives, tools, steps, and use cases |
| `Retail Sales Database ER.drawio.html`              | Interactive ER diagram (view in browser)                 |


## Sample Business Use Cases
✅ **Top Performing Products**  
✅ **Average Order Value by Customer**  
✅ **Failed vs Successful Payments**  
✅ **Revenue by Payment Method**  
✅ **Unit Economics per Product**  
✅ **Product Demand vs Stock Left**  
✅ **Order Fulfillment Analysis**  

Each use case is backed by SQL views and queries that provide actionable insights.


## Key Insights (From Report)
- **Webcam 1080p** leads in revenue, showing strong demand and pricing power.
- Customers like **Karan Sharma** and **Aanya Kapoor** represent high-value segments.
- Debit Card is the **most reliable payment method**, followed by Cash on Delivery.
- Over 30% of payments attempted via UPI **fail**, requiring checkout optimization.
- Products like **Notebook Cooler** exhibit strong turnover, ideal for bundling or scaling.
- Inventory optimization and marketing interventions are suggested based on sales velocity.


## Analytical Views Created
1. **CustomerOrderSummary**
2. **ProductSalesReport**
3. **MonthlyRevenue**
4. **FailedPaymentsReport**
5. **OrderDetailsExpanded**


## What I Learned
✅ **Practical database normalization (up to 3NF)**  
✅ **Writing complex SQL for business analysis**  
✅ **Creating reusable views for reporting**  
✅ **Structuring and documenting a full-stack data project**  


## Report Summary
"This isn’t just a schema. It’s a reporting foundation for real business decisions."
— Retail Sales Database Design Project Report


## Contact Me
If you'd like to connect, collaborate, or discuss this project further:
- [LinkedIn](https://www.linkedin.com/in/diya-menghani-ab409031a/)
- Email: diyamenghani00@gmail.com  

I'm always open to opportunities, feedback, and meaningful conversations around data analytics, SQL, and database design!
