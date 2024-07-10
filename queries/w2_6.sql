SELECT
    a."Title" AS AlbumTitle,
    ar."Name" AS ArtistName,
    SUM(il."Quantity") AS TotalUnitsSold
FROM
    "InvoiceLine" il
JOIN
    "Track" t ON il."TrackId" = t."TrackId"
JOIN
    "Album" a ON t."AlbumId" = a."AlbumId"
JOIN
    "Artist" ar ON a."ArtistId" = ar."ArtistId"
JOIN
    "Invoice" i ON il."InvoiceId" = i."InvoiceId"
JOIN
    "Customer" c ON i."CustomerId" = c."CustomerId"
WHERE
    c."Country" = 'USA'
GROUP BY
    a."AlbumId", a."Title", ar."Name"
ORDER BY
    SUM(il."Quantity") DESC
LIMIT 10;