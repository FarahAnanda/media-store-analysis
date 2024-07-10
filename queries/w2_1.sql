SELECT 
    "BillingCountry" AS Country,
    COUNT(*) AS NumberOfInvoices
FROM 
    "Invoice"
GROUP BY 
    "BillingCountry"
ORDER BY 
    NumberOfInvoices DESC,
    Country ASC
LIMIT 10;
