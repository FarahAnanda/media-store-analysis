SELECT
    c."FirstName" || ' ' || c."LastName" AS CustomerName,
    c."Email",
    SUM(i."Total") AS TotalSpending
FROM
    "Customer" c
JOIN
    "Invoice" i ON c."CustomerId" = i."CustomerId"
GROUP BY
    c."CustomerId"
ORDER BY
    TotalSpending DESC
LIMIT 10;