WITH CustomerGenreSpend AS (
    SELECT
        c."CustomerId",
        c."FirstName" || ' ' || c."LastName" AS "Name",
        g."Name" AS "Genre",
        SUM(il."Quantity" * il."UnitPrice") AS "TotalSpent"
    FROM
        "Customer" c
    JOIN
        "Invoice" i ON c."CustomerId" = i."CustomerId"
    JOIN
        "InvoiceLine" il ON i."InvoiceId" = il."InvoiceId"
    JOIN
        "Track" t ON il."TrackId" = t."TrackId"
    JOIN
        "Genre" g ON t."GenreId" = g."GenreId"
    GROUP BY
        c."CustomerId", c."FirstName", c."LastName", g."Name"
),
RankedGenres AS (
    SELECT
        "CustomerId",
        "Name",
        "Genre",
        "TotalSpent",
        RANK() OVER (PARTITION BY "CustomerId" ORDER BY "TotalSpent" DESC) AS "Rank"
    FROM
        CustomerGenreSpend
)
SELECT
    "CustomerId",
    "Name",
    "Genre",
    "TotalSpent" AS "Sum",
    "Rank"
FROM
    RankedGenres
WHERE
    "Rank" = 1;