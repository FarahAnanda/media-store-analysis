WITH TopCountries AS (
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
    LIMIT 10
),
RankedCities AS (
    SELECT
        i."BillingCountry" AS Country,
        i."BillingCity" AS City,
        COUNT(*) AS NumberOfInvoices,
        ROW_NUMBER() OVER (PARTITION BY i."BillingCountry" ORDER BY COUNT(*) DESC) AS rn
    FROM 
        "Invoice" i
    JOIN 
        TopCountries tc ON i."BillingCountry" = tc.Country
    GROUP BY 
        i."BillingCountry", i."BillingCity"
)

SELECT 
    Country,
    City,
    NumberOfInvoices
FROM 
    RankedCities
WHERE 
    rn = 1
ORDER BY 
    NumberOfInvoices DESC,
    Country ASC;