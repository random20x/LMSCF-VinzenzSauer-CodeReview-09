(1) See how many tables & rows within the database.:
    
    SELECT TABLE_NAME AS 'table',
    table_rows as 'rows'
    from information_schema.tables
    where table_schema = 'cr09_vinzenz_sauer_delivery'
    GROUP BY TABLE_NAME;

-------------------------------------

(2) Search within the table customer for a specific customer || play a bit around in the package Table.:

    SELECT DISTINCT customer_zip FROM customer_address ORDER
    BY customer_zip;

    SELECT customer_zip
    FROM customer_address
    WHERE customer_zip > 1100;

    SELECT RECEIVE_DATE
    FROM processing_system
    WHERE receive_date
    BETWEEN "2020-02-01" AND "2020-03-13"; 

    SELECT * FROM `package` WHERE weight <1000;


------------------------------------

(3) Does not really work yet, should be a super JOIN between 5 Tables.:

    SELECT post_office_location.post_office_location_id, post_office.post_location_id,post_office.post_office_id, employee.post_office_id,employee.employee_id, deposit_deliver.employee_id, deposit_deliver.customer_id, customer.customer_id, customer.customer_address_id, customer_address.customer_address_id
    FROM post_office
    INNER JOIN post_office ON post_office_id = post_office_location.post_office_location_id
    INNER JOIN employee ON employee_id = post_office.post_office_id
    INNER JOIN deposit_deliver ON employee_id = employee.employee_id
    INNER JOIN deposit_deliver ON customer_id = customer.customer_id
    INNER JOIN customer_address ON customer_address_id = customer.customer_address_id

------------------------------------

(4) Simple search for a specific name in table + table column || JOIN between 2 Tables (packages & processing_system) where I look for a specific weight.:

    SELECT COUNT(customer.customer_id)
	FROM customer
    WHERE customer.customer_name = 'Britta Lhotzky';

    SELECT processing_system.process_system_id
	FROM processing_system
	INNER JOIN package
	ON processing_system.process_system_id = package.process_system_id
	WHERE package.weight > 1000;

-----------------------------------

(5) JOIN between 2 Tables (post_office_location & post_office).:     //figured out an important problem within my tables (Naming)

    SELECT post_office_location.post_office_location_id,post_office.fk_post_office_location_id
	FROM post_office_location
	INNER JOIN post_office
	ON post_office_location.post_office_location_id = post_office.fk_post_office_location_id
	WHERE post_street = 'Weintraubengasse';

-----------------------------------

(6) JOIN between 3 Tables.:




