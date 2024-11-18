# Common Table Expressions (CTEs) in SQL

## Introduction
Common Table Expressions (CTEs) are a temporary result set in SQL that can be referenced within a `SELECT`, `INSERT`, `UPDATE`, or `DELETE` statement. They enhance query readability, allow recursive operations, and help break down complex queries into smaller, manageable parts.

---

## Syntax

### Basic CTE
```sql
WITH cte_name (column1, column2, ...) AS (
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
```
## Advantages of Using CTEs
### Improved Readability: Makes complex queries easier to understand and maintain.
### Modular Code: Allows breaking a large query into smaller, reusable parts.
### Recursion Support: Enables handling hierarchical or iterative data structures (e.g., organization trees, file systems).
### Temporary Scope: Exists only for the duration of the query.

## Notes
* Temporary Scope: CTEs only exist for the duration of the query in which they are defined.
* Performance: While CTEs improve readability, ensure performance by testing with large datasets.
* Recursion Depth: The recursion limit may depend on your SQL database (e.g., 100 levels in SQL Server).
