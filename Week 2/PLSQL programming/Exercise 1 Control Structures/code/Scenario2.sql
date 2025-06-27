-- Add VIP status column to track customer tier
ALTER TABLE Customers ADD IsVIP VARCHAR2(5) DEFAULT 'NO';


/*Pl/SQL block*/

DECLARE
    -- Cursor to fetch customer balance information for VIP evaluation
    CURSOR c_customers_balance IS
        SELECT CustomerID, Balance
        FROM Customers;

    v_customer_id   Customers.CustomerID%TYPE;
    v_balance       Customers.Balance%TYPE;
    v_update_count  NUMBER := 0;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting VIP customer promotion process...');

    -- Open cursor to begin processing customer balances
    OPEN c_customers_balance;

    LOOP
        -- Fetch next customer's balance information
        FETCH c_customers_balance INTO v_customer_id, v_balance;
        -- Exit loop when no more customers to process
        EXIT WHEN c_customers_balance%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Processing Customer ID: ' || v_customer_id || ', Balance: ' || v_balance);

        -- Check if customer qualifies for VIP status (balance > 10000)
        IF v_balance > 10000 THEN
            -- Promote customer to VIP status
            UPDATE Customers
            SET IsVIP = 'YES'
            WHERE CustomerID = v_customer_id;
            -- Increment counter for successful VIP promotions
            v_update_count := v_update_count + SQL%ROWCOUNT;
            DBMS_OUTPUT.PUT_LINE('  --> Customer ID: ' || v_customer_id || ' promoted to VIP status.');
        ELSE
            -- Ensure non-qualifying customers are marked as non-VIP
            UPDATE Customers
            SET IsVIP = 'NO'
            WHERE CustomerID = v_customer_id
            AND IsVIP <> 'NO'; -- Only update if currently marked as VIP
            IF SQL%ROWCOUNT > 0 THEN
                DBMS_OUTPUT.PUT_LINE('  --> Customer ID: ' || v_customer_id || ' set to non-VIP status.');
            END IF;
        END IF;
    END LOOP;

    -- Close cursor to free resources
    CLOSE c_customers_balance;

    -- Save all VIP status changes to database
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('VIP customer promotion process completed. Total VIPs updated: ' || v_update_count);

EXCEPTION
    -- Handle any unexpected errors during VIP processing
    WHEN OTHERS THEN
        -- Undo any changes made during this transaction
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Changes rolled back.');
END;
/
