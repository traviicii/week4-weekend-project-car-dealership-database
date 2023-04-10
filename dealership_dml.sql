CREATE OR REPLACE FUNCTION add_customer(
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    phone NUMERIC(10),
    email VARCHAR(50)
    )
    RETURNS VOID
    LANGUAGE plpgsql
    AS
    $MAIN$
    BEGIN
        INSERT INTO customers (first_name, last_name, phone, email, date_added)
        VALUES (f_name, l_name, phone, email, NOW()::TIMESTAMP);
    END
    $MAIN$
    ;

SELECT add_customer('Travis', 'Peck', 4109809342, 'traviscpeck@youalreadyknow.com')

SELECT add_customer('Steven', 'Aldridge', 4109801004, 'steviebb@thisaddress.com')

SELECT * FROM customers


CREATE OR REPLACE FUNCTION add_employee(
    f_name VARCHAR(20),
    l_name VARCHAR(20),
    title VARCHAR(20),
    email VARCHAR(50),
    bday DATE,
    pin NUMERIC(4),
    phone NUMERIC(10)
    )
    RETURNS VOID
    LANGUAGE plpgsql
    AS
    $MAIN$
    BEGIN
        INSERT INTO employees (first_name, last_name, job_title, email, birthday, pin_code, phone)
        VALUES (f_name, l_name, title, email, bday, pin, phone);
    END
    $MAIN$
    ;

SELECT add_employee('John', 'Deer', 'Mechanic', 'mechaman@carjob.com', '1991-10-09', 3197, 4100891349)

SELECT add_employee('Yve', 'Bee', 'Sales', 'yveb@carjob.com', '1993-10-09', 6824, 3100893428)

SELECT add_employee('Manly', 'Man', 'Mechanic', 'manlyman@carjob.com', '1995-07-09', 6969, 4207823428)

SELECT * FROM employees


INSERT INTO cars(
    vin_num,
    make,
    model,
    year,
    used,
    base_cost,
    for_sale
)VALUES(
    38473910,
    'Tesla',
    'Model Y',
    2023,
    false,
    50000.00,
    false
);

INSERT INTO cars(
    vin_num,
    make,
    model,
    year,
    used,
    base_cost,
    for_sale,
    customer_id
)VALUES(
    68273100,
    'Tesla',
    'Model X',
    2023,
    false,
    63000.00,
    false,
    2
);

SELECT * FROM cars

UPDATE cars
SET for_sale = true
WHERE vin_num = 38473910

UPDATE cars
SET used = true
WHERE vin_num = 68273100

INSERT INTO cars(
    vin_num,
    make,
    model,
    year,
    used,
    base_cost,
    for_sale,
    customer_id
)VALUES(
    19465378,
    'Tesla',
    'Cybertruck',
    2023,
    true,
    63000.00,
    false,
    1
);

UPDATE cars
SET base_cost = 74300.00
WHERE vin_num = 19465378

INSERT INTO cars(
    vin_num,
    make,
    model,
    year,
    used,
    base_cost,
    for_sale
)VALUES(
    06252011,
    'Ford',
    'Escort',
    2016,
    true,
    16420.00,
    true
);


SELECT * FROM cars;
SELECT * FROM employees;
SELECT * FROM customers;


INSERT INTO invoices(
    customer_id,
    employee_id,
    vin_num,
    amount,
    car_sale
    )VALUES(
        1,
        2,
        19465378,
        74300,
        true
    )

SELECT * FROM invoices

UPDATE invoices
SET date = NOW()::TIMESTAMP
WHERE invoice_id = 1


INSERT INTO invoices(
    date,
    customer_id,
    employee_id,
    vin_num,
    amount,
    car_sale
    )VALUES(
        NOW()::TIMESTAMP,
        1,
        2,
        19465378,
        500.00,
        false
    )

INSERT INTO services_tickets(
    service_done,
    invoice_id,
    vin_num,
    date_start,
    date_finish
)VALUES(
    'Oil Change',
    2,
    19465378,
    '2023-04-10',
    '2023-04-10'
)

SELECT * FROM services_tickets

INSERT INTO service_done_by (
    employee_id,
    service_id
)VALUES(
    1,
    1
)

INSERT INTO service_done_by (
    employee_id,
    service_id
)VALUES(
    2,
    1
)

SELECT * FROM service_done_by

DELETE FROM service_done_by
WHERE employee_id = 2

-- check out a combination of services_tickets and serive_done_by whit employee names that completed the services
SELECT services_tickets.service_id, service_done, invoice_id, employees.first_name
FROM services_tickets
RIGHT JOIN service_done_by
ON services_tickets.service_id = service_done_by.service_id
INNER JOIN employees
ON employees.employee_id = service_done_by.employee_id

SELECT * FROM invoices

INSERT INTO invoices(
    date,
    customer_id,
    employee_id,
    vin_num,
    amount,
    car_sale
    )VALUES(
        NOW()::TIMESTAMP,
        2,
        2,
        68273100,
        900.00,
        false
    )

INSERT INTO services_tickets(
    service_done,
    invoice_id,
    vin_num,
    date_start,
    date_finish
)VALUES(
    'Tire Rotation',
    3,
    19465378,
    '2023-04-10',
    '2023-04-10'
)

INSERT INTO service_done_by (
    employee_id,
    service_id
)VALUES(
    1,
    2
)

INSERT INTO service_done_by (
    employee_id,
    service_id
)VALUES(
    3,
    2
)


SELECT * FROM cars;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM invoices;
SELECT * FROM services_tickets;
SELECT * FROM service_done_by;