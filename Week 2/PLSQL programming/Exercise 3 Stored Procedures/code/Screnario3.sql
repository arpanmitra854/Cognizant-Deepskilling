CREATE OR REPLACE PROCEDURE TransferFunds (
  p_source_account_id IN NUMBER,  -- Account to debit funds from
  p_target_account_id IN NUMBER,  -- Account to credit funds to
  p_transfer_amount IN NUMBER     -- Amount to transfer
) AS
  v_source_balance NUMBER; -- Current balance of source account
BEGIN
  -- Retrieve current balance of source account
  SELECT Balance INTO v_source_balance FROM Accounts WHERE AccountID = p_source_account_id;

  -- Check if source account has sufficient funds for transfer
  IF v_source_balance < p_transfer_amount THEN
    -- Raise custom error for insufficient funds
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance in source account.');
  ELSE
    -- Deduct transfer amount from source account
    UPDATE Accounts
    SET Balance = Balance - p_transfer_amount
    WHERE AccountID = p_source_account_id;

    -- Add transfer amount to target account
    UPDATE Accounts
    SET Balance = Balance + p_transfer_amount
    WHERE AccountID = p_target_account_id;

    -- Save both account updates to database
    COMMIT;
  END IF;
END;
/