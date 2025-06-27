DECLARE
    -- Cursor to find loans due within the next 30 days
    CURSOR c_due_loans IS
        SELECT
            L.LoanID,
            C.Name AS CustomerName,
            L.EndDate
        FROM
            Loans L
        JOIN
            Customers C ON L.CustomerID = C.CustomerID
        WHERE
            L.EndDate BETWEEN SYSDATE AND (SYSDATE + 30); -- Next 30 days window

    v_loan_id        Loans.LoanID%TYPE;
    v_customer_name  Customers.Name%TYPE;
    v_end_date       Loans.EndDate%TYPE;
    v_found_reminders BOOLEAN := FALSE; -- Flag to track if any reminders were sent

BEGIN
    DBMS_OUTPUT.PUT_LINE('Checking for loans due in the next 30 days...');

    -- Open cursor to begin processing due loans
    OPEN c_due_loans;

    LOOP
        -- Fetch next loan that's due soon
        FETCH c_due_loans INTO v_loan_id, v_customer_name, v_end_date;
        -- Exit loop when no more due loans found
        EXIT WHEN c_due_loans%NOTFOUND;

        -- Mark that we found at least one reminder to send
        v_found_reminders := TRUE;

        -- Generate and display loan reminder message
        DBMS_OUTPUT.PUT_LINE('--- LOAN REMINDER ---');
        DBMS_OUTPUT.PUT_LINE('Dear ' || v_customer_name || ',');
        DBMS_OUTPUT.PUT_LINE('Your Loan ID: ' || v_loan_id || ' is due on ' || TO_CHAR(v_end_date, 'YYYY-MM-DD') || '.');
        DBMS_OUTPUT.PUT_LINE('Please ensure timely repayment to avoid penalties.');
        DBMS_OUTPUT.PUT_LINE('---------------------');
    END LOOP;

    -- Close cursor to free resources
    CLOSE c_due_loans;

    -- Inform if no loans are due in the specified period
    IF NOT v_found_reminders THEN
        DBMS_OUTPUT.PUT_LINE('No loans found due in the next 30 days.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Loan reminder process completed.');

EXCEPTION
    -- Handle any unexpected errors during reminder processing
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
