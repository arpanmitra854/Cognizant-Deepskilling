DECLARE
    -- Cursor to fetch all customers with their DOB for age calculation
    CURSOR c_customers IS
        SELECT CustomerID, DOB
        FROM Customers;

    v_customer_id   Customers.CustomerID%TYPE;
    v_dob           Customers.DOB%TYPE;
    v_age_years     NUMBER;
    v_rows_updated  NUMBER := 0;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting loan interest rate discount process...');

    -- Open cursor to begin processing customers
    OPEN c_customers;

    LOOP
        -- Fetch next customer record
        FETCH c_customers INTO v_customer_id, v_dob;
        -- Exit loop when no more records found
        EXIT WHEN c_customers%NOTFOUND;

        -- Calculate customer's age in years
        v_age_years := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);

        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id || ', DOB: ' || TO_CHAR(v_dob, 'YYYY-MM-DD') || ', Age: ' || v_age_years);

        -- Check if customer qualifies for senior citizen discount (60+ years)
        IF v_age_years >= 60 THEN
            -- Apply 1% interest rate reduction for eligible customers
            UPDATE Loans
            SET InterestRate = InterestRate - 1
            WHERE CustomerID = v_customer_id;

            -- Check how many loan records were updated
            v_rows_updated := SQL%ROWCOUNT;

            IF v_rows_updated > 0 THEN
                DBMS_OUTPUT.PUT_LINE('  --> Discount applied for Customer ID: ' || v_customer_id || '. Loans updated: ' || v_rows_updated);
            ELSE
                DBMS_OUTPUT.PUT_LINE('  --> Customer ID: ' || v_customer_id || ' is 60 or older but has no loans to update.');
            END IF;
        END IF;
    END LOOP;

    -- Close cursor to free resources
    CLOSE c_customers;

    -- Save all changes to database
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Loan interest rate discount process completed and changes committed.');

EXCEPTION
    -- Handle any unexpected errors during processing
    WHEN OTHERS THEN
        -- Undo any changes made during this transaction
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Changes rolled back.');
END;
/
