# SQL-database-query-
building SQL oracle database project case study 
-- Create Owners table
CREATE TABLE Owners (
    Owner_id VARCHAR2(10),
    TIN NUMBER(9) NOT NULL,
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    city VARCHAR2(30),
    dob DATE NOT NULL,
    phone_number VARCHAR2(25)
);

-- Create Apartments table
CREATE TABLE Apartments (
    Apartment_id VARCHAR2(10),
    Owner_id VARCHAR2(10),
    street VARCHAR2(25) NOT NULL,
    street_number VARCHAR2(10) NOT NULL,
    postal_code VARCHAR2(10) NOT NULL,
    city VARCHAR2(20) NOT NULL,
    price NUMBER(10,2) NOT NULL,
    floor NUMBER(2),
    number_of_rooms NUMBER(1)
);

-- Create Tenants table
CREATE TABLE Tenants (
    Tenant_id VARCHAR2(10),
    first_name VARCHAR2(30) NOT NULL,
    last_name VARCHAR2(30) NOT NULL,
    gender CHAR(1),
    email VARCHAR2(50) NOT NULL,
    dob DATE NOT NULL,
    country VARCHAR2(20) NOT NULL,
    number_of_tenants NUMBER(2) DEFAULT 1,
    phone_number VARCHAR2(25) NOT NULL
);

-- Create Rentals table
CREATE TABLE Rentals (
    Rental_id VARCHAR2(10),
    Apartment_id VARCHAR2(10),
    Tenant_id VARCHAR2(10),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Create Reviews table
CREATE TABLE Reviews (
    Review_id VARCHAR2(10),
    Apartment_id VARCHAR2(10),
    Tenant_id VARCHAR2(10),
    review_date DATE NOT NULL,
    stars NUMBER(1),
    review_text VARCHAR2(1000)
);
