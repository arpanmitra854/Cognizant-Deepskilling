CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department       IN Employees.Department%TYPE,  -- Department to apply bonus to
    p_bonus_percentage IN NUMBER                       -- Bonus percentage (e.g., 0.10 for 10%)
)
IS
    v_rows_updated NUMBER := 0; -- Counter for employees updated
BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting bonus update for ' || p_department || ' department with ' || (p_bonus_percentage * 100) || '% bonus...');

    -- Apply salary increase to all employees in specified department
    UPDATE Employees
    SET Salary = Salary * (1 + p_bonus_percentage)
    WHERE Department = p_department;

    -- Get count of employees whose salaries were updated
    v_rows_updated := SQL%ROWCOUNT;

    -- Save salary changes to database
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bonus update completed. Total employees updated in ' || p_department || ' department: ' || v_rows_updated);

EXCEPTION
    -- Handle any errors during bonus processing
    WHEN OTHERS THEN
        -- Undo any changes made during this transaction
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('An error occurred during employee bonus update: ' || SQLERRM);
END UpdateEmployeeBonus;
/