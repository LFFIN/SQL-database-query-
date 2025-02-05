SELECT *  
FROM Tenants;

-- 2. List Tenants by Last Name (Descending)
SELECT last_name, first_name, country
FROM Tenants
ORDER BY last_name DESC;

-- 3. Tenants from Greece
SELECT first_name, last_name, country
FROM Tenants
WHERE country = 'GREECE';

-- 4.Names starting with 'J', ending with 'SON', starting with 'PIERRE', or containing 'SAINT'
SELECT first_name, last_name
FROM Tenants
WHERE (first_name LIKE 'J%' AND last_name LIKE '%SON')
   OR first_name LIKE 'PIERRE%'
   OR last_name LIKE '%SAINT%';

-- 5. Tenants who are not from Greece
SELECT first_name, last_name, country
FROM Tenants
WHERE country <> 'GREECE';

-----6. Rentals Between April and September 2023
SELECT Rental_id, Tenant_id, start_date, end_date
FROM Rentals
WHERE start_date BETWEEN TO_DATE('01-APR-2023', 'DD-MON-YYYY') 
                     AND TO_DATE('30-SEP-2023', 'DD-MON-YYYY');

----- 7. Apartments with Their Owners , Including streets like 'Saint', 'Rue de Paris', and/ or  'Santa...'
SELECT a.Apartment_id, a.street, o.first_name AS Owner_FirstName, o.last_name AS Owner_LastName
FROM Apartments a
JOIN Owners o ON a.Owner_id = o.Owner_id
WHERE a.street LIKE 'SAINT%'
   OR a.street LIKE 'RUE DE PARIS%'
   OR a.street LIKE 'SANTA%';

----- 8. Rentals with Apartment and Tenant Information
SELECT r.Rental_id, a.street, t.first_name AS Tenant_FirstName, t.last_name AS Tenant_LastName
FROM Rentals r
JOIN Apartments a ON r.Apartment_id = a.Apartment_id
JOIN Tenants t ON r.Tenant_id = t.Tenant_id;

----- 9. Full Rental Details with Tenant and Owner Info
SELECT r.Rental_id, a.street, t.first_name AS Tenant_FirstName, 
       t.last_name AS Tenant_LastName, o.first_name AS Owner_FirstName, 
       o.last_name AS Owner_LastName
FROM Rentals r
JOIN Apartments a ON r.Apartment_id = a.Apartment_id
JOIN Tenants t ON r.Tenant_id = t.Tenant_id
JOIN Owners o ON a.Owner_id = o.Owner_id;

----- 10. Total Number of Rentals
SELECT COUNT(*) AS Total_Rentals
FROM Rentals;

----- 11. Average Apartment Price by City
SELECT city, AVG(price) AS Average_Price
FROM Apartments
GROUP BY city;

----- 12. Maximum and Minimum Apartment Prices
SELECT MAX(price) AS Max_Price, MIN(price) AS Min_Price
FROM Apartments;

-----13. Review Counts by star rating
SELECT stars, COUNT(*) AS Review_Count
FROM Reviews
GROUP BY stars
ORDER BY stars;

----- 14. Total and Average Rental Price by City
SELECT city, 
       SUM(price) AS Total_Rental_Price, 
       AVG(price) AS Average_Rental_Price
FROM Apartments
GROUP BY city
ORDER BY city;

-- 15. Apartments Available in Specific Cities (example, Paris, London, Greece)
SELECT city, street, price, floor, number_of_rooms
FROM Apartments
WHERE city IN ('PARIS', 'LONDON', 'ATHENS', 'THESSALONIKI', 'MARSEILLE');

('WHERE city IN (''PARIS''');
