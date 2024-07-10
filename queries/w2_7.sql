WITH CountrySales AS (
    SELECT
        "BillingCountry" AS Country,
        COUNT(DISTINCT "CustomerId") AS TotalCustomers,
        SUM("Total") AS TotalSales,
        COUNT("InvoiceId") AS TotalOrders
    FROM
        "Invoice"
    GROUP BY
        "BillingCountry"
),
AggregatedData AS (
    SELECT
        CASE
            WHEN TotalCustomers = 1 THEN 'Other'
            ELSE Country
        END AS Country,
        SUM(TotalCustomers) AS TotalCustomers,
        SUM(TotalSales) AS TotalSales,
        SUM(TotalOrders) AS TotalOrders
    FROM
        CountrySales
    GROUP BY
        CASE
            WHEN TotalCustomers = 1 THEN 'Other'
            ELSE Country
        END
)
SELECT
    Country,
    TotalCustomers,
    TotalSales,
    ROUND(TotalSales::numeric / TotalCustomers, 2) AS AvgSalesPerCustomer,
    ROUND(TotalSales::numeric / TotalOrders, 2) AS AvgOrderValue
FROM
    AggregatedData
ORDER BY
    TotalSales DESC;