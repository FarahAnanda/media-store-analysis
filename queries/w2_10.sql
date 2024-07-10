SELECT
    i."BillingCountry" AS Country,
    SUM(il."Quantity" * il."UnitPrice") AS TotalSpent
FROM
    "Invoice" i
JOIN
    "InvoiceLine" il ON i."InvoiceId" = il."InvoiceId"
GROUP BY
    i."BillingCountry"
ORDER BY
    TotalSpent DESC
LIMIT 10;