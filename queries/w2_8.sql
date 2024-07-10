SELECT 
    g."Name" AS Genre,
    SUM(il."Quantity") AS qty,
    SUM(il."Quantity" * il."UnitPrice") AS sold_tracks
FROM 
    "Invoice" i
JOIN 
    "InvoiceLine" il ON i."InvoiceId" = il."InvoiceId"
JOIN 
    "Track" t ON il."TrackId" = t."TrackId"
JOIN 
    "Genre" g ON t."GenreId" = g."GenreId"
WHERE 
    i."BillingCountry" = 'USA'
GROUP BY 
    g."Name"
ORDER BY 
    sold_tracks ASC;