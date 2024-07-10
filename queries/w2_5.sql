SELECT 
    g."Name" AS Genre,
    SUM(il."Quantity") AS TotalPurchases
FROM 
    "Invoice" i
JOIN 
    "InvoiceLine" il ON i."InvoiceId" = il."InvoiceId"
JOIN 
    "Track" t ON il."TrackId" = t."TrackId"
JOIN 
    "Genre" g ON t."GenreId" = g."GenreId"
WHERE 
    i."BillingCountry" = 'United Kingdom'
GROUP BY 
    g."Name"
ORDER BY 
    TotalPurchases DESC;