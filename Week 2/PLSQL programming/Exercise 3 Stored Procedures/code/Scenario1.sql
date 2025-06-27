CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
    -- Cursor to fetch all savings accounts for interest calculation
    CURSOR c_savings_accounts IS
        SELECT AccountID, Balance
        FROM Accounts
        WHERE AccountType = 'Savings';

    v_account_id    Accounts.AccountID%TYPE;
    v_current_balance Accounts.Balance%TYPE;
    v_interest_rate CONSTANT NUMBER := 0.01; -- 1% monthly interest rate
    v_new_balance   Accounts.Balance%TYPE;
    v_rows_updated  NUMBER := 0;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting monthly interest processing for savings accounts...');

    -- Open cursor to begin processing savings accounts
    OPEN c_savings_accounts;
    LOOP
        -- Fetch next savings account details
        FETCH c_savings_accounts INTO v_account_id, v_current_balance;
        -- Exit loop when no more savings accounts to process
        EXIT WHEN c_savings_accounts%NOTFOUND;

        -- Calculate new balance with interest applied
        v_new_balance := v_current_balance * (1 + v_interest_rate);

        -- Update account with new balance and modification timestamp
        UPDATE Accounts
        SET Balance = v_new_balance,
            LastModified = SYSDATE
        WHERE AccountID = v_account_id;

        -- Increment counter for processed accounts
        v_rows_updated := v_rows_updated + SQL%ROWCOUNT;

        DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_account_id || ' - Old Balance: ' || v_current_balance || ', New Balance: ' || ROUND(v_new_balance, 2));
    END LOOP;
    -- Close cursor to free resources
    CLOSE c_savings_accounts;

    -- Save all interest calculations to database
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Monthly interest process completed. Total savings accounts updated: ' || v_rows_updated);

EXCEPTION
    -- Handle any errors during interest processing
    WHEN OTHERS THEN
        -- Undo any changes made during this transaction
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred during monthly interest processing: ' || SQLERRM);
END ProcessMonthlyInterest;
/
