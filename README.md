# Bike Share + Weather Analytics — dbt Demo Project

A beginner-friendly dbt project built on **Snowflake** that models bike sharing and weather data. This was my first hands-on project with dbt Core — focused on understanding the fundamentals of data modelling, source definitions, materialisation strategies, and the dbt development workflow.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Cloud Data Warehouse | Snowflake |
| Transformation | dbt Core |
| Data Sources | Bike sharing trips data, Weather data |
| Version Control | Git |

---

## What This Project Covers

This project demonstrates the core dbt workflow applied to two related datasets — bike share trip records and corresponding weather observations — to explore how weather conditions relate to ridership patterns.

### Data Sources

- **Bike sharing data** — trip records including start/end station, duration, and timestamps
- **Weather data** — daily weather observations (temperature, precipitation, conditions) matched to trip dates

---

## Project Architecture

```
Snowflake Raw Tables (demo schema)
          │
          ▼
    Staging Models          ← Clean column names, cast types, add derived fields
          │
          ▼
     Mart Models            ← Business-level aggregations and joined tables
```

### Folder Structure

```
DBT_DEMO/
├── models/
│   ├── staging/            # stg_bike_*, stg_weather_*: source layer cleaning
│   └── example/            # Demo models (materialised as tables)
├── macros/                 # Custom Jinja macros
├── seeds/                  # Static lookup data
├── snapshots/              # Historical tracking with SCD Type 2
├── tests/                  # Data quality tests
├── analyses/               # Exploratory SQL queries
└── dbt_project.yml         # Project configuration
```

---

## Key dbt Concepts Demonstrated

- **`source()` function** — defines Snowflake raw tables as dbt sources with lineage tracking
- **`ref()` function** — chains models together, enabling the dbt DAG
- **Materialisation** — models configured as views (staging) and tables (marts)
- **`sources.yml`** — documents source tables with column descriptions
- **Generic tests** — `not_null` and `unique` applied to key columns
- **CTEs** — SQL structured with common table expressions for readability
- **Jinja templating** — dynamic SQL using dbt's built-in Jinja support

---

## Getting Started

### Prerequisites

- Snowflake account (free trial works)
- Python 3.8+
- dbt Core: `pip install dbt-snowflake`

### Setup

```bash
# Clone the repo
git clone https://github.com/tnmypthk/DBT_DEMO.git
cd DBT_DEMO

# Configure your Snowflake connection
# Create ~/.dbt/profiles.yml — see example below

# Run models
dbt run

# Run tests
dbt test
```

### profiles.yml example

```yaml
default:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <your_account>
      user: <your_user>
      password: <your_password>
      role: <your_role>
      database: <your_database>
      warehouse: <your_warehouse>
      schema: dev
      threads: 1
```

---

## Sample Questions This Project Answers

- How does daily temperature affect bike trip volume?
- Which stations see the highest ridership during different weather conditions?
- What is the average trip duration by season?
- How do rainy days compare to sunny days for total trips?

---

## What I Learned

- Setting up a dbt project from scratch connected to Snowflake
- Defining sources and using `ref()` to build a model dependency graph
- Writing staging models that standardise raw data before transformation
- Applying generic and singular dbt tests for data quality
- Understanding dbt materialisation — when to use views vs tables
- Using Jinja and CTEs to write clean, reusable SQL

---

## Progression

This project was the starting point. The **[BTC repo](https://github.com/tnmypthk/BTC)** extends these fundamentals with dbt packages, custom macros, snapshots, and a full CI/CD pipeline via GitHub Actions — applied to Bitcoin market data.

---

## About

A learning project to build hands-on familiarity with dbt Core and Snowflake as part of exploring modern analytics engineering and the ELT pattern.

**Author:** Tanmay Pathak · [@tnmypthk](https://github.com/tnmypthk)
