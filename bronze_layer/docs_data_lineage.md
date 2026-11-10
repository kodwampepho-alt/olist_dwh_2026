# Data Lineage: Bronze Layer

## Overview

| Item | Detail |
|---|---|
| Database | olist_dwh |
| Target schema | bronze |
| Load tool | SSIS package `01_bronze_load.dtsx` (project `olist_dwh_etl`) |
| Source | 9 Olist CSV files (UTF-8, code page 65001, text qualifier `"`, header row) |
| Load pattern | Truncate and reload (repeatable) |
| Column types | All source columns NVARCHAR (no casting in bronze) |
| Metadata columns | `dwh_load_ts` (default SYSDATETIME()), `dwh_source_file`, `dwh_batch_id` |
| Batch ID | 1 |

## Load order in the package

1. Execute SQL Task: create database and schemas (if not exist)
2. Execute SQL Task: create bronze tables (if not exist)
3. Execute SQL Task: truncate bronze tables
4. Data Flow Tasks: Flat File Source, then Derived Column (metadata), then OLE DB Destination

## Row count reconciliation

CSV counts are **records, not physical lines** (review comments contain line breaks), taken with
`(Import-Csv .\<file>.csv -Encoding UTF8).Count` in PowerShell. Bronze counts are taken with
`SELECT COUNT(*) FROM bronze.<table>;` in SSMS.

| Source file | Bronze table | CSV records | Bronze rows | Match |
|---|---|---|---|---|
| orders_dataset.csv | bronze.orders | 99,441 | 99,441 | Yes |
| customer_dataset.csv | bronze.customers | 99,441 | 99,441 | Yes |
| sellers.dataset.csv | bronze.sellers | 3,095 | 3,095 | Yes |
| product_category_name_translation.csv | bronze.product_category_name_translation | 71 | 71 | Yes |
| products_dataset.csv | bronze.products | 32,951 | 32,951 | Yes |
| order_items_dataset.csv | bronze.order_items | 112,650 | 112,650 | Yes |
| gelocation_dataset.csv | bronze.geolocation | 1,000,163 | 1,000,163 | Yes |
| order_payments_dataset.csv | bronze.order_payments | 103,886 | 103,886 | Yes |
| order_reviews.dataset.csv | bronze.order_reviews | 99,224 | 99,224 | Yes |

## Repeatability test (orders)

| Test | Result |
|---|---|
| Run 1 (first load) | 99,441 rows |
| Run 2 (no changes, truncate then reload) | |
| Manual truncate in SSMS, then run | |

## Notes

- Source column spellings are kept as they arrive in bronze, for example `product_name_lenght` and `product_description_lenght` in the products file.
- The `dwh_source_file` column records the file each row came from, and `dwh_batch_id` records the load batch.
