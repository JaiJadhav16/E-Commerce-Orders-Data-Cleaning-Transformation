# 🛒 E-Commerce Orders: Data Cleaning & Transformation

An end-to-end data analysis project on ~10,000 e-commerce orders (US, 2022–2023). 
Raw order data is cleaned and transformed with **Python (Pandas)**, analysed with **SQL**,
explored with **Matplotlib/Seaborn**, and summarised in a **Power BI dashboard**.

## 📌 Project Overview

| Stage | Tool | What was done |
|---|---|---|
| 1. Cleaning & transformation | Python (Pandas) | Handled missing values, standardised column names, created new business metrics |
| 2. Business analysis | SQL (MySQL) | Answered revenue, regional and time-based questions |
| 3. Exploratory visuals | Matplotlib, Seaborn | Sales by category, region, segment, ship mode and trend over time |
| 4. Dashboard | Power BI | Interactive KPI cards and charts |

## 📂 Repository Structure

```
├── orders.csv                       # Raw dataset (9,994 rows, 16 columns)
├── project.ipynb                    # Data cleaning & transformation
├── new_order.csv                    # Cleaned dataset (output of project.ipynb)
├── question.sql                     # SQL business questions
├── graphical_representation.ipynb   # EDA and visualisations
└── Dashboard.pbix                   # Power BI dashboard
```

## 🧹 Data Cleaning & Transformation (`project.ipynb`)

1. **Handled invalid values**: `Ship Mode` contained `Not Available` and `unknown`. These were read as `NaN` using `na_values`.
2. **Standardised column names**: converted to lowercase and replaced spaces with underscores (e.g. `Order Id` → `order_id`).
3. **Feature engineering**: created new columns:
   - `discount = list_price × discount_percent × 0.01`
   - `sale_price = list_price − discount`
   - `profit = sale_price − cost_price`
4. **Fixed data types**: converted `order_date` from string to `datetime`.
5. **Dropped redundant columns**: removed `list_price` and `discount_percent` after deriving `sale_price`.
6. **Exported** the cleaned data to `new_order.csv`, ready to load into MySQL.

## 🗄️ SQL Analysis (`question.sql`)

The cleaned data is loaded into a `new_order` table and used to answer:

1. **Top 10 highest-revenue products**: `GROUP BY` + `ORDER BY` + `LIMIT`
2. **Top 5 best-selling products in each region**: CTE + `ROW_NUMBER() OVER (PARTITION BY region …)`
3. **Month-over-month comparison of 2022 vs 2023 sales**: conditional aggregation with `CASE WHEN`
4. **Highest-sales month for each category**: CTE + window function + `DATE_FORMAT`

**Concepts used:** CTEs, window functions, conditional aggregation, date functions.

## 📊 Visualisations (`graphical_representation.ipynb`)

- Total sales by category
- Distribution of list price
- Sales by region
- Quantity vs sales (scatter plot)
- Monthly sales trend (line chart)
- Sales contribution by segment (pie chart)
- Category-wise sales by region
- Sales by ship mode

## 📈 Power BI Dashboard (`Dashboard.pbix`)

An interactive dashboard with KPI cards, a donut chart, a stacked area chart, a column chart, a gauge and a funnel chart.

> 📸 *Add a screenshot here:* `![Dashboard](images/dashboard.png)`

## 🛠️ Tech Stack

`Python` · `Pandas` · `Matplotlib` · `Seaborn` · `MySQL` · `Power BI` · `Jupyter Notebook`

## 💡 Key Learnings

- Cleaning messy categorical values and placeholder strings
- Deriving business metrics (discount, sale price, profit) with Pandas
- Writing analytical SQL with CTEs and window functions
- Turning cleaned data into visuals and a dashboard
