CREATE TABLE Bank (
    bank_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    website_address VARCHAR(100)
);

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    patronymic_name VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE CustomerBankRelationship (
    customer_id INT REFERENCES Customer(customer_id),
    bank_id INT REFERENCES Bank(bank_id),
    PRIMARY KEY (customer_id, bank_id)
);

CREATE TABLE Account (
    account_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES Customer(customer_id) NOT NULL,
    type VARCHAR(50) NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.0 NOT NULL,
    opened_date DATE NOT NULL,
    UNIQUE (customer_id)
);

CREATE TABLE AccountTransaction (
    transaction_id SERIAL PRIMARY KEY,
    account_id INT REFERENCES Account(account_id) NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_type VARCHAR(50) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);


