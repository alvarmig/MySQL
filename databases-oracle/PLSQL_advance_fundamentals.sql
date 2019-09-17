-- PL/SQL - Packages
-- Package Specification
CREATE PACKAGE cust_sal AS 
    PROCEDURE find_sal(c_id customers.id%type);
END cust_sal;
/
-- Package Body
CREATE OR REPLACE PACKAGE BODY cust_sal AS
    
    PROCEDURE find_sal(c_id customers.id%type) IS c_sal customers.salary%type;
    BEGIN 
        SELECT salary INTO c_sal 
        FROM customers
        WHERE id = c_id; 
        dbms_output.put_line('Salary: '|| c_sal);
    END find_sal;
END cust_sal; 
/
-- Using the Package Elements
DECLARE 
    code customers.id%type := &cc_id;
BEGIN 
    cust_sal.find_sal(code);
END; 
/



-- Package Specification
CREATE OR REPLACE PACKAGE c_package AS
    -- Adds a customer 
    PROCEDURE addCustomer(
        c_id customers.id%type,
        c_name customers.name%type,
        c_age customers.age%type,
        c_address customers.address%type,
        c_salary customers.salary%type); 
        
    -- Removes a customer
    PROCEDURE delCustomer(c_id customers.id%type); 
    
    -- List all customers
    PROCEDURE listCustomer;
    
    PROCEDURE listCustomersDetails;
END c_package;
/

-- Package Body
CREATE OR REPLACE PACKAGE BODY c_package AS
    PROCEDURE addCustomer (
        c_id customers.id%type,
        c_name customers.name%type,
        c_age customers.age%type,
        c_address customers.address%type,
        c_salary customers.salary%type)
    IS 
    BEGIN 
        INSERT INTO customers(id, name, age, address, salary)
            VALUES(c_id, c_name, c_age, c_address, c_salary);
    END addCustomer; 
    
    PROCEDURE delCustomer(c_id customers.id%type) 
    IS
    BEGIN   
        DELETE 
        FROM customers 
        WHERE id = c_id;
    END delCustomer;
    
    PROCEDURE listCustomer IS 
        CURSOR customers_cursor IS 
            SELECT name FROM customers;
        TYPE c_list IS TABLE OF customers.Name%type; 
        name_list c_list := c_list();
        counter INTEGER :=0;
    BEGIN 
        FOR n IN customers_cursor LOOP 
            counter:= counter +1;
            name_list.extend;
            name_list(counter) := n.name;
            dbms_output.put_line('Customer(' ||counter|| ')'||name_list(counter)); 
        END LOOP;
    END listCustomer;
    
    PROCEDURE listCustomersDetails IS 
        CURSOR customers_cursor IS 
        SELECT * FROM customers;
        customers_records customers%rowtype;   
    BEGIN 
        OPEN customers_cursor;
        LOOP 
            FETCH customers_cursor INTO customers_records; 
            EXIT WHEN customers_cursor%notfound;
            DBMS_OUTPUT.PUT_LINE(customers_records.id || ' ' || customers_records.name || ' ' || customers_records.address || ' ' || customers_records.salary);
        END LOOP;
        CLOSE customers_cursor;
    END listCustomersDetails;
END c_package; 
/


-- Using the Package Elements
DECLARE 
    code customers.id%type := 8;
BEGIN 
    c_package.addcustomer(9, 'Rajnish', 25, 'Chennai', 3500); 
    c_package.addcustomer(10, 'Subham', 32, 'Delhi', 7500); 
    c_package.listcustomer; 
    c_package.delcustomer(code); 
    c_package.listcustomer;
END;
/

BEGIN 
    c_package.listCustomersDetails;
END;
/

-- PL/SQL - Collections
-- Index-By Table
DECLARE 
    TYPE salary IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
    salary_list salary; 
    name VARCHAR2(20);
BEGIN 
    -- adding elements to te table
    salary_list('Rajnish') := 62000;
    salary_list('Minakshi') := 75000; 
    salary_list('Martin') := 100000; 
    salary_list('James') := 78000; 
    
    -- printing the table 
    name := salary_list.FIRST;
    WHILE name IS NOT NULL LOOP 
        DBMS_OUTPUT.PUT_LINE('Salary of ' || name || ' is ' || TO_CHAR(salary_list(name)));
        name:=salary_list.NEXT(name);
    END LOOP; 
END; 
/

DECLARE 
    CURSOR cursor_customers IS 
    SELECT name FROM customers;
    
    TYPE c_list IS TABLE OF customers.name%type INDEX BY BINARY_INTEGER;
    name_list c_list;
    counter INTEGER :=0;
BEGIN 
    FOR n IN cursor_customers LOOP 
        counter := counter + 1;
        name_list(counter) := n.name;
        dbms_output.put_line('Customer('||counter||'):'||name_list(counter)); 
    END LOOP;
END;
/

-- Nested Tables
DECLARE 
    TYPE names_table IS TABLE OF VARCHAR(20);
    TYPE grades IS TABLE OF INTEGER;
    names names_table := names_table(); 
    marks grades := grades(); 
    total INTEGER:=0;
BEGIN 
    names := names_table('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
    marks := grades(98, 97, 78, 87, 92);
    total := names.count;
    dbms_output.put_line('Total '|| total || ' Students'); 
    
    FOR i IN 1..total LOOP 
        dbms_output.put_line('Student:'||names(i)||', Marks:' || marks(i));
    END LOOP;
END;
/

-- Nested Tables rowType
DECLARE 
   CURSOR c_customers is  
      SELECT  name FROM customers;  
   TYPE c_list IS TABLE of customers.name%type; 
   name_list c_list := c_list(); 
   counter integer :=0; 
BEGIN 
   FOR n IN c_customers LOOP 
      counter := counter +1; 
      name_list.extend; 
      name_list(counter)  := n.name; 
      dbms_output.put_line('Customer('||counter||'):'||name_list(counter)); 
   END LOOP; 
END; 
/

-- PL/SQL - Object Oriented
CREATE OR REPLACE TYPE address AS OBJECT 
(house_no varchar2(10), 
 street varchar2(30), 
 city varchar2(20), 
 state varchar2(10), 
 pincode varchar2(10) 
);
/

CREATE OR REPLACE TYPE customer AS OBJECT(
    code number(5), 
    name varchar2(30), 
    contact_no varchar2(12), 
    addr address, 
    member procedure display
);
/

-- Instantiating an Object
DECLARE 
    residence address;
BEGIN 
    residence := address('103A', 'M.G.Road', 'Jaipur', 'Rajasthan','201301');
    dbms_output.put_line('House No: '|| residence.house_no); 
    dbms_output.put_line('Street: '|| residence.street); 
    dbms_output.put_line('City: '|| residence.city); 
    dbms_output.put_line('State: '|| residence.state); 
    dbms_output.put_line('Pincode: '|| residence.pincode);
END; 
/
-- Using Map method
CREATE OR REPLACE TYPE rectangle AS OBJECT(
    length NUMBER,
    width NUMBER, 
    member function enlarge (inc NUMBER) RETURN rectangle, 
    member PROCEDURE display, 
    MAP member function measure RETURN NUMBER
);
/
-- Creating the type body 
CREATE OR REPLACE TYPE BODY rectangle AS 
    MEMBER FUNCTION enlarge(inc NUMBER) RETURN rectangle IS
    BEGIN 
        RETURN rectangle(SELF.length + inc, SELF.width + inc);
    END enlarge;
    
    MEMBER PROCEDURE display IS 
    BEGIN 
        dbms_output.put_line('Length: '|| length); 
        dbms_output.put_line('Width: '|| width); 
    END display;
    
    MAP MEMBER FUNCTION measure RETURN NUMBER IS 
    BEGIN 
        RETURN(sqrt(length*length + width*width));
    END measure; 
END;
/
-- rectangle object and its member functions
DECLARE 
    r1 rectangle; 
    r2 rectangle; 
    r3 rectangle; 
    inc_factor number := 5;
BEGIN 
    r1:= rectangle(3,4);
    r2:= rectangle(5,7);
    r3:=r1.enlarge(inc_factor);
    r3.display;
    IF (r1 > r2) THEN -- calling measure function 
        r1.display; 
    ELSE 
        r2.display; 
    END IF;
END; 
/


-- Practice TEST PLSQL BLOCK, CURSOR, ROWTYPE, IF, LOOP, INPUT FROM USER;
DECLARE 
    inputSalary NUMBER:= &cc_salary;
    customers_rec customers%rowtype;
    CURSOR customers_cursor IS 
    SELECT * FROM customers;
BEGIN 
    OPEN customers_cursor;
    LOOP 
        FETCH customers_cursor INTO customers_rec;
        EXIT WHEN customers_cursor%notfound;
        
        IF(customers_rec.salary > inputSalary) THEN 
            DBMS_OUTPUT.PUT_LINE(customers_rec.id || ' ' || customers_rec.name || ' ' || customers_rec.address || ' ' || customers_rec.salary);
        ELSE 
            DBMS_OUTPUT.PUT_LINE(customers_rec.id || ' ' || customers_rec.name || ' I want a salary increase ');
        END IF;
    END LOOP;
    CLOSE customers_cursor; 
END;
/
-- Practice TEST PROCEDURE, CALL PROCEDURE, PLSQL BLOCK, CURSOR, ROWTYPE, IF, LOOP, INPUT FROM USER;
CREATE OR REPLACE PROCEDURE users_with_salary(salary IN NUMBER) IS
BEGIN 
    DECLARE 
        inputSalary NUMBER:= salary;
        customers_rec customers%rowtype;
        CURSOR customers_cursor IS 
        SELECT * FROM customers;
    BEGIN 
        OPEN customers_cursor;
        LOOP 
            FETCH customers_cursor INTO customers_rec;
            EXIT WHEN customers_cursor%notfound;
            
            IF(customers_rec.salary > inputSalary) THEN 
                DBMS_OUTPUT.PUT_LINE(customers_rec.id || ' ' || customers_rec.name || ' ' || customers_rec.address || ' ' || customers_rec.salary);
            ELSE 
                DBMS_OUTPUT.PUT_LINE(customers_rec.id || ' ' || customers_rec.name || ' I want a salary increase ');
            END IF;
        END LOOP;
        CLOSE customers_cursor;    
    END;
END;
/
DECLARE 
    inputSalary NUMBER:= &cc_salary;
BEGIN 
    users_with_salary(inputSalary);
END;
/

-- Practice TEST FUNCTION, CALL FUNCTION, PLSQL BLOCK, CURSOR, ROWTYPE, IF, LOOP, INPUT FROM USER;
CREATE OR REPLACE FUNCTION number_of_customers(salary IN NUMBER) 
RETURN NUMBER 
IS
    total_customers NUMBER; 
BEGIN 
    DECLARE 
        TYPE namesarray IS VARRAY(9) OF customers.name%type;
        names namesarray := namesarray();
        
        inputSalary NUMBER:= salary;
        customers_rec customers%rowtype;
        CURSOR customers_cursor IS 
        SELECT * FROM customers;
    BEGIN 
        SELECT COUNT(1) INTO total_customers
        FROM customers;
        
        OPEN customers_cursor;
        LOOP 
            FETCH customers_cursor INTO customers_rec;
            EXIT WHEN customers_cursor%notfound;
            
            IF(customers_rec.salary > inputSalary) THEN 
                DBMS_OUTPUT.PUT_LINE(customers_rec.id || ' ' || customers_rec.name || ' ' || customers_rec.address || ' ' || customers_rec.salary);
            ELSE 
                DBMS_OUTPUT.PUT_LINE(customers_rec.id || ' ' || customers_rec.name || ' I want a salary increase ');
            END IF;
        END LOOP;
        CLOSE customers_cursor;  
        RETURN total_customers;
    END;
END;
/

DECLARE 
    total NUMBER(10);
    inputSalary NUMBER:= &cc_salary;
BEGIN 
    total := number_of_customers(inputSalary);
    DBMS_OUTPUT.PUT_LINE('Total of Customers: ' || total);
END; 
/