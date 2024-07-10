SELECT
    g."Name" AS GenreName,
    SUM(il."Quantity" * il."UnitPrice") AS TotalSales
FROM
    "InvoiceLine" il
JOIN
    "Track" t ON il."TrackId" = t."TrackId"
JOIN
    "Genre" g ON t."GenreId" = g."GenreId"
GROUP BY
    g."Name"
ORDER BY
    TotalSales DESC
LIMIT 10;