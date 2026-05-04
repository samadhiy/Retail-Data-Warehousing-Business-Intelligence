🛒 Retail Data Warehouse & Business Intelligence Dashboard

📌 Project Overview

This project focuses on designing and implementing a Retail Data Warehouse using a Star Schema and developing interactive dashboards to generate actionable business insights.

The solution transforms raw transactional data into a structured analytical system, enabling decision-makers to analyze sales, profitability, customer behavior, and regional performance effectively.

🎯 Objectives
* Design a data warehouse architecture for retail analytics
* Implement a Star Schema for efficient querying
* Perform ETL (Extract, Transform, Load) processes
* Develop interactive dashboards (Power BI)
* Generate insights on sales, profit, and customer segments

🏗️ Data Warehouse Architecture

This project follows a Three-Tier Architecture:

1.Bottom Tier (Data Storage)
* Source: Superstore dataset (CSV)
* SQL Server used for staging and warehouse storage
2.Middle Tier (OLAP Layer)
* Star Schema implementation
* Optimized for analytical queries
3. Top Tier (Visualization Layer)
* Power BI dashboards for reporting and insights

⭐ Star Schema Design

📊 Fact Table

* FactSales
* Sales
* Profit
* Quantity
* Discount

📂 Dimension Tables

* DimCustomer – Customer details & segments
* DimProduct – Product categories & hierarchy
* DimLocation – Region, State, City
* DimDate – Time-based analysis

This schema improves:

* Query performance
* Simplicity
* Analytical flexibility

🔄 ETL Process

The ETL pipeline ensures clean and structured data:

1. Extract
Data imported from CSV dataset
2. Transform
Data cleaning (handling nulls, formatting)
Standardization of fields
Creation of derived attributes (e.g., profitability flag)
Surrogate key generation
3. Load
Dimension tables loaded first
Fact table loaded with foreign key relationships

📊 Dashboards (Power BI)

1️⃣ Sales & Profit Overview
* Total Sales & Profit KPIs
* Sales by Category
* Profit by Customer Segment
* Regional performance insights
  
2️⃣ Customer & Product Insights
* Profitability by segment and category
* Impact of discounts on profit
* Top customers and best-selling products
* Drill-down filtering for detailed analysis

💡 Key Insights
* Certain regions show low profitability despite high sales
* Corporate customers are the most profitable segment
* Some products generate losses due to heavy discounts
*Clear visibility into top-performing categories and customers

🛠️ Tools & Technologies
* SQL Server – Data warehouse implementation
* Power BI – Dashboard visualization
* SSIS / SQL Scripts – ETL process
* Kaggle Dataset – Superstore retail data


🚀 How to Use
* Clone the repository
* Import dataset into SQL Server
* Run ETL scripts to populate warehouse
* Open Power BI file (.pbix)
* Connect to the database and explore dashboards

📸 Dashboard Preview

### Sales & Profit Overview
![Sales Dashboard](/dashboard1.jpg)

📈 Future Improvements

* Implement incremental data loading
* Add real-time data pipeline
* Integrate predictive analytics / ML models
* Deploy dashboards to Power BI Service

👩‍💻 Author

Samadhi Jayasundara

* Data Analytics & BI Enthusiast
* Focus: Data Warehousing, Visualization, Machine Learning

📜 License

This project is for academic and educational purposes.
