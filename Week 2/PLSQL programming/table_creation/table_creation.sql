-- Create Customers table to store customer information
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,     -- Unique identifier for each customer
    Name VARCHAR2(100),               -- Customer's full name
    DOB DATE,                         -- Date of birth for age calculations
    Balance NUMBER,                   -- Current account balance
    LastModified DATE                 -- Timestamp of last record update
);

-- Create Accounts table to store account details
CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,     -- Unique identifier for each account
    CustomerID NUMBER,                -- Reference to customer who owns the account
    AccountType VARCHAR2(20),         -- Type of account (Savings, Checking, etc.)
    Balance NUMBER,                   -- Current account balance
    LastModified DATE,                -- Timestamp of last record update
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  -- Link to customer
);

-- Create Transactions table to track all financial transactions
CREATE TABLE Transactions (
    TransactionID NUMBER PRIMARY KEY, -- Unique identifier for each transaction
    AccountID NUMBER,                 -- Reference to account involved in transaction
    TransactionDate DATE,             -- Date when transaction occurred
    Amount NUMBER,                    -- Transaction amount
    TransactionType VARCHAR2(10),     -- Type of transaction (Deposit, Withdrawal, etc.)
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)  -- Link to account
);

-- Create Loans table to manage loan information
CREATE TABLE Loans (
    LoanID NUMBER PRIMARY KEY,        -- Unique identifier for each loan
    CustomerID NUMBER,                -- Reference to customer who took the loan
    LoanAmount NUMBER,                -- Principal loan amount
    InterestRate NUMBER,              -- Annual interest rate for the loan
    StartDate DATE,                   -- Loan start date
    EndDate DATE,                     -- Loan maturity/due date
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  -- Link to customer
);

-- Create Employees table to store employee information
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,    -- Unique identifier for each employee
    Name VARCHAR2(100),               -- Employee's full name
    Position VARCHAR2(50),            -- Job title/position
    Salary NUMBER,                    -- Current salary amount
    Department VARCHAR2(50),          -- Department where employee works
    HireDate DATE                     -- Date when employee was hired
);
