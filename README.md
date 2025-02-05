# Apartment Management Database

## Project Overview
This project is a relational database designed to manage apartment rentals, owners, tenants, and reviews. It consists of five core tables: **Owners, Apartments, Tenants, Rentals, and Reviews**. The database is structured to store essential details about apartment ownership, rental agreements, tenant details, and feedback on properties.

## Database Schema
The database consists of the following tables:

### 1. Owners Table
Stores information about apartment owners.
```sql
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
```
- **Owner_id**: Unique identifier for each owner.
- **TIN**: Tax identification number (mandatory).
- **first_name, last_name**: Owner's name.
- **email**: Contact email (mandatory).
- **city**: Owner's city.
- **dob**: Date of birth (mandatory).
- **phone_number**: Contact number.

### 2. Apartments Table
Stores details of apartments owned by individuals.
```sql
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
```
- **Apartment_id**: Unique identifier for each apartment.
- **Owner_id**: References the apartment owner.
- **street, street_number, postal_code, city**: Apartment location details.
- **price**: Rental price.
- **floor**: Floor number.
- **number_of_rooms**: Number of rooms.

### 3. Tenants Table
Stores tenant details.
```sql
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
```
- **Tenant_id**: Unique identifier for each tenant.
- **first_name, last_name**: Tenant's name.
- **gender**: Gender (M/F).
- **email**: Contact email (mandatory).
- **dob**: Date of birth.
- **country**: Tenant's country.
- **number_of_tenants**: Default value is 1.
- **phone_number**: Contact number.

### 4. Rentals Table
Manages rental agreements between tenants and apartment owners.
```sql
CREATE TABLE Rentals (
    Rental_id VARCHAR2(10),
    Apartment_id VARCHAR2(10),
    Tenant_id VARCHAR2(10),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);
```
- **Rental_id**: Unique identifier for each rental contract.
- **Apartment_id**: References the rented apartment.
- **Tenant_id**: References the tenant renting the apartment.
- **start_date, end_date**: Rental period.

### 5. Reviews Table
Stores tenant reviews for apartments.
```sql
CREATE TABLE Reviews (
    Review_id VARCHAR2(10),
    Apartment_id VARCHAR2(10),
    Tenant_id VARCHAR2(10),
    review_date DATE NOT NULL,
    stars NUMBER(1),
    review_text VARCHAR2(1000)
);
```
- **Review_id**: Unique identifier for each review.
- **Apartment_id**: References the apartment being reviewed.
- **Tenant_id**: References the tenant who provided the review.
- **review_date**: Date of the review.
- **stars**: Rating (1-5 stars).
- **review_text**: Text review (max 1000 characters).

## Usage Instructions
1. **Database Setup**: Execute the provided SQL script to create the database tables.
2. **Data Entry**:
   - Populate `Owners` with apartment owners.
   - Add apartment details to `Apartments` and link them to owners.
   - Register tenants in the `Tenants` table.
   - Record rental agreements in `Rentals`.
   - Collect tenant reviews in `Reviews`.
3. **Queries**:
   - Retrieve apartment details using `Apartment_id`.
   - Find available apartments using the `Rentals` table.
   - Generate owner reports based on rental history.
   - Analyze tenant feedback from `Reviews`.

## Future Enhancements
- Implement **foreign key constraints** to enforce data integrity.
- Add **triggers** for automatic updates based on rental agreements.
- Create **stored procedures** for automated report generation.
- Introduce **indexes** to improve query performance.

## License
This project is open-source and free to use. Feel free to modify and improve upon it as needed.
