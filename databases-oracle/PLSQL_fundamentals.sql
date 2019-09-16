CREATE TABLE CUSTOMERS( 
   ID INT NOT NULL, 
   NAME VARCHAR (20) NOT NULL, 
   AGE INT NOT NULL, 
   ADDRESS CHAR (25), 
   SALARY   DECIMAL (18, 2),        
   PRIMARY KEY (ID) 
);

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (1, 'Ramesh', 32, 'Ahmedabad', 2000.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (2, 'Khilan', 25, 'Delhi', 1500.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (3, 'kaushik', 23, 'Kota', 2000.00 );
  
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (4, 'Chaitali', 25, 'Mumbai', 6500.00 ); 
 
INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (5, 'Hardik', 27, 'Bhopal', 8500.00 );  

INSERT INTO CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) 
VALUES (6, 'Komal', 22, 'MP', 4500.00 );


CREATE TABLE CUSTOMERS2( 
   ID INT NOT NULL, 
   NAME VARCHAR (20) NOT NULL, 
   AGE INT NOT NULL, 
   ADDRESS CHAR (25), 
   SALARY   DECIMAL (18, 2),        
   PRIMARY KEY (ID) 
);

-- PLSQL DECLARATION
DECLARE
    message varchar2(20):= 'Hello World!';
BEGIN 
    dbms_output.put_line(message);
END;
/

-- DATA TYPES
DECLARE 
    num1 INTEGER;
    num2 REAL;
    num3 DOUBLE PRECISION;
BEGIN
    num1:= 10;
    num2:= 64.59;
    num3:= 9.9634;
    
    DBMS_OUTPUT.PUT_LINE(num1 || num2 || num3);
    DBMS_OUTPUT.PUT_LINE(num2);
    DBMS_OUTPUT.PUT_LINE(num3);
    DBMS_OUTPUT.PUT_LINE(num1 + num2 + num3 );
END;
/

DECLARE
    SUBTYPE name IS char(20);
    SUBTYPE message IS varchar2(100);
    salutation name; 
    greetings message;
BEGIN
    salutation:= 'Reader';
    greetings:= 'Welcome to the world of PL/SQL';
    DBMS_OUTPUT.PUT_LINE('Hello ' || salutation || greetings);
END;
/
-- Initializing Variables in PL/SQL
DECLARE 
    sales number(10,2);
    pi CONSTANT double precision NOT NULL := 3.1415;
    name varchar2(25);
    address varchar2(100);
    counter binary_integer := 0;
    greetings varchar2(20) DEFAULT ' Have a Good Day';
    
    a integer := 10; 
    b integer := 20; 
    c integer; 
    f real;
BEGIN 
    c := a + b;
    DBMS_OUTPUT.put_line('Value of c: ' || c);
    f := 70.0/3.0;
    dbms_output.put_line('Value of f: ' || f || greetings || ' ' || pi);
END; 
/

-- Variable Scope in PL/SQL
DECLARE 
    -- Global variables
    num1 number := 95;
    num2 number := 85;
BEGIN 
    dbms_output.put_line('Outer Variable num1 ' || num1);
    dbms_output.put_line('Outer Variable num2 ' || num2);
    DECLARE 
        -- Local variables
        num1 number := 195;
        num2 number := 185;
    BEGIN 
        dbms_output.put_line('Inner Variable num1: ' || num1); 
        dbms_output.put_line('Inner Variable num2: ' || num2);
    END;
END;
/

-- Assigning SQL Query Results to PL/SQL Variables
DECLARE 
    c_id customers.id%type := 1;
    c_name customers.name%type;
    c_addr customers.address%type;
    c_sal customers.salary%type;
BEGIN 
    SELECT name, address, salary INTO c_name, c_addr, c_sal
    FROM customers
    WHERE id = c_id;
    dbms_output.put_line('Customer ' || c_name || ' from ' || c_addr || ' earns ' || c_sal );
END;
/

-- Declaring a Constant
DECLARE 
   -- constant declaration 
   pi constant number := 3.141592654; 
   -- other declarations 
   radius number(5,2);  
   diameter number(5,2);  
   circumference number(7, 2); 
   area number (10, 2); 
BEGIN  
    --processing
    radius := 9.5;
    diameter := radius * 2;
    circumference := 2.0 * pi * radius;
    area := pi * radius * radius;
    -- output
    DBMS_OUTPUT.PUT_LINE('Radius: ' || radius);
    DBMS_OUTPUT.PUT_LINE('Diameter: ' || diameter);
    DBMS_OUTPUT.PUT_LINE('Circumference: ' || circumference); 
    DBMS_OUTPUT.PUT_LINE('Area: ' || area);
END; 
/ 

-- The PL/SQL Literals
DECLARE 
   message  varchar2(30):= 'That''s tutorialspoint.com!'; 
BEGIN 
   dbms_output.put_line(message); 
END; 
/  


-- PL/SQL - IF-THEN Statement
DECLARE
    a number(2) := 10;
BEGIN 
    a:= 10;
    -- check the boolean condition using if statement
    IF(a < 20) THEN 
        -- if condition is true then print the following   
        dbms_output.put_line('a is less than 20 ' ); 
    END IF;
    dbms_output.put_line('value of a is : ' || a); 
END;
/

-- PL/SQL - IF-THEN Statement
DECLARE
    c_id customers.id%type := 1;
    c_name customers.name%type;
    c_sal customers.salary%type;
BEGIN 
    SELECT id, name, salary
    INTO c_id, c_name, c_sal
    FROM customers
    WHERE id = c_id;
    IF (c_sal <= 2000) THEN
        UPDATE customers 
        SET salary = salary + 1000
            WHERE id = c_id;
        DBMS_OUTPUT.PUT_LINE('NEW SALARY ' || c_id || ' ' || c_name || ' ' || c_sal);
    END IF;
END;
/

-- PL/SQL - IF-THEN-ELSE Statement
DECLARE 
    a number:= 100;
BEGIN 
    -- check the boolean condition using if statement 
    IF (a < 20) THEN
        dbms_output.put_line('a is less than 20');
    ELSE 
        dbms_output.put_line('a is NOT less than 20');
    END IF;
    dbms_output.put_line('The value of a is: ' || a);
END;
/

-- PL/SQL - IF-THEN-ELSIF Statement
DECLARE 
    a number:= 100;
    b number:= 20;
BEGIN 
    IF(a = 10 or b =10) THEN 
        dbms_output.put_line('Value of a/b is 10');
    ELSIF (a = 20 or b =20) THEN 
        dbms_output.put_line('Value of a/b is 20');
    ELSIF (a = 30 or b =20) THEN 
        dbms_output.put_line('Value of a/b is 30');
    ELSE 
        dbms_output.put_line('NONE OF THE VALUES IS MATCHING');
    END IF;
    dbms_output.put_line('Exact value of a and b is ' || a || ' ' || b);
END;
/

-- PL/SQL - CASE Statement
DECLARE 
    grade CONSTANT char(1) NOT NULL := 'C';
BEGIN 
    CASE grade
        WHEN 'A' then dbms_output.put_line('Excellent');
        WHEN 'B' then dbms_output.put_line('Very Good');
        WHEN 'C' then dbms_output.put_line('Well done');
        WHEN 'D' then dbms_output.put_line('You passed');
        WHEN 'E' then dbms_output.put_line('Better try again');
        else dbms_output.put_line('No such grade');
    END case;
END; 
/

-- PL/SQL - Searched CASE Statement
DECLARE 
    grade CONSTANT char(1) NOT NULL := 'B';
BEGIN 
    CASE 
        WHEN grade = 'A' then dbms_output.put_line('Excellent');
        WHEN grade = 'B' then dbms_output.put_line('Very Good');
        WHEN grade = 'C' then dbms_output.put_line('Well done');
        WHEN grade = 'D' then dbms_output.put_line('You passed');
        WHEN grade = 'E' then dbms_output.put_line('Better try again');
        else dbms_output.put_line('No such grade');
    END case;
END; 
/

-- PL/SQL - Nested IF-THEN-ELSE Statements
DECLARE 
    a number(3) := 100;
    b number(3) := 200;
BEGIN 
    -- check the boolean condition 
    IF(a = 100) THEN 
        -- if condition is true then check the following  
        IF(b = 200) THEN 
            dbms_output.put_line('Value of a is ' || a || ' and b is ' || b);
        END IF;
    END IF;
    dbms_output.put_line('Exact value of a is : ' || a ); 
    dbms_output.put_line('Exact value of b is : ' || b );
END;
/

-- PL/SQL - Basic Loop Statement
DECLARE
    x number:= 10;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE(x);
        x := x + 10;
        
        IF (x > 50) THEN 
            exit;
        END IF;
    END LOOP;
     -- after exit, control resumes here  
   dbms_output.put_line('After Exit x is: ' || x); 
END;
/

-- PL/SQL - Basic Loop Statement EXIT WHEN 
DECLARE
    x number:= 10;
BEGIN
    LOOP 
        DBMS_OUTPUT.PUT_LINE(x);
        x := x + 10;
        exit WHEN x > 70;
    END LOOP;
     -- after exit, control resumes here  
   dbms_output.put_line('After Exit x is: ' || x); 
END;
/

-- PL/SQL - WHILE LOOP Statement
DECLARE 
    a number(2) := 10;
BEGIN 
    WHILE a < 20 LOOP 
        dbms_output.put_line('Value of a: ' || a);
        a := a+1;
    END LOOP; 
END; 
/

-- PL/SQL - FOR LOOP Statement
DECLARE 
    a number(2);
BEGIN 
    FOR a in 10 .. 20 LOOP 
        dbms_output.put_line('value of a is ' || a);
        IF(a = 15) THEN 
            dbms_output.put_line('ENTRE');
        END IF;
    END LOOP;
END; 
/

-- Reverse FOR LOOP Statement
DECLARE 
    a number(2);
BEGIN 
    FOR a IN REVERSE 10 .. 20  LOOP 
        DBMS_OUTPUT.PUT_LINE('value of a is ' || a);
    END LOOP;
END;
/

-- PL/SQL - Nested Loops
DECLARE 
    i number(3);
    j number(3);
BEGIN 
    i := 2;
    LOOP 
        j:= 2;
        LOOP 
            exit WHEN ((mod(i, j) = 0) or (j = i));
            j:= j + 1;
        END LOOP ;
    IF(j = i) THEN 
        dbms_output.put_line(i || ' is prime'); 
    END IF;
    i := i +1;
    exit WHEN i = 50;
    END LOOP;
END; 
/

-- Labeling a PL/SQL Loop
DECLARE
    i number(3);
    j number(3);
BEGIN 
    <<outer_loop>>
    FOR i IN 1..3 LOOP 
        <<inner_loop>>
        FOR j IN 1..3 LOOP 
            dbms_output.put_line('i is: ' || i || ' and j is: ' || j);
        END LOOP inner_loop;
    END LOOP outer_loop; 
END; 
/

-- PL/SQL - EXIT Statement
DECLARE 
    a number(2) := 10;
BEGIN 
     -- while loop execution 
     WHILE a < 20 LOOP 
        dbms_output.put_line ('value of a: ' || a); 
        a := a + 1;
        EXIT WHEN a > 15;
     END LOOP;
END; 
/

-- PL/SQL - CONTINUE Statement
DECLARE 
    a number(2) := 10;
BEGIN 
     -- while loop execution 
     WHILE a < 20 LOOP 
        dbms_output.put_line ('value of a: ' || a); 
        a := a + 1;
        IF a = 15 THEN 
            a := a + 1;
            CONTINUE;
        END IF;
     END LOOP;
END; 
/

-- PL/SQL - GOTO Statement
DECLARE 
   a number(2) := 10; 
BEGIN 
   <<loopstart>> 
   -- while loop execution  
   WHILE a < 20 LOOP
   dbms_output.put_line ('value of a: ' || a); 
      a := a + 1; 
      IF a = 15 THEN 
         a := a + 1; 
         GOTO loopstart; 
      END IF; 
   END LOOP; 
END; 
/

-- PL/SQL - Strings
DECLARE 
   name varchar2(20); 
   company varchar2(30); 
   introduction clob; 
   choice char(1); 
BEGIN 
   name := 'John Smith'; 
   company := 'Infotech'; 
   introduction := ' Hello! I''m John Smith from Infotech.'; 
   choice := 'y'; 
   IF choice = 'y' THEN 
      dbms_output.put_line(name); 
      dbms_output.put_line(company); 
      dbms_output.put_line(introduction); 
   END IF; 
END; 
/

DECLARE 
    greetings varchar2(11) := 'Hello World';
BEGIN 
    dbms_output.put_line(UPPER(greetings));
    
    dbms_output.put_line(LOWER(greetings));
    
    dbms_output.put_line(INITCAP(greetings));
    
    /* retrieve the first character in the string */ 
    dbms_output.put_line(SUBSTR(greetings, 1,1));
    
    /* retrieve the first character in the string */ 
    dbms_output.put_line(SUBSTR(greetings, -1, 1));
    
     /* retrieve five characters,  
      starting from the seventh position. */ 
    dbms_output.put_line(SUBSTR(greetings, 7, 5));
    
    /* retrieve the remainder of the string, 
      starting from the second position. */ 
    dbms_output.put_line ( SUBSTR (greetings, 2)); 
    
    /* find the location of the first "e" */ 
    dbms_output.put_line(INSTR(greetings, 'e'));
END; 
/

-- TRIM EXAMPLE
DECLARE 
   greetings varchar2(30) := '......Hello World.....'; 
BEGIN 
   dbms_output.put_line(RTRIM(greetings,'.')); 
   dbms_output.put_line(LTRIM(greetings, '.')); 
   dbms_output.put_line(TRIM( '.' from greetings)); 
END; 
/

-- PL/SQL - Arrays
DECLARE 
    type namesarray IS VARRAY(5) OF VARCHAR2(10);
    type grades IS VARRAY(5) OF INTEGER;
    names namesarray; 
    marks grades;
    total INT;
BEGIN 
    names := namesarray('Kavita', 'Pritam', 'Ayan', 'Rishav', 'Aziz');
    marks := grades(98,97,78,87,92);
    total := names.count;
    
    dbms_output.put_line('Totla ' || total || ' Students');
    FOR i in 1..total LOOP 
        DBMS_OUTPUT.PUT_LINE('Student ' || names(i) || ' Marks: ' || marks(i));
    END LOOP;
END; 
/

DECLARE 
    CURSOR c_customers is
    SELECT name, salary FROM customers;
    type c_list IS VARRAY(6) OF customers.name%type;
    type c_salary IS VARRAY(6) OF customers.salary%type;
    name_list c_list := c_list();
    salary_list c_salary := c_salary();
    counter INTEGER :=0;
BEGIN 
    FOR n IN c_customers LOOP 
        counter := counter + 1;
        name_list.extend;
        name_list(counter) := n.name;
        
        salary_list.extend;
        salary_list(counter) := n.salary;
        
        dbms_output.put_line('Customer('||counter ||'):' || name_list(counter) || ' '|| salary_list(counter));
    END LOOP;
END; 
/

-- PL/SQL - Procedures
CREATE OR REPLACE PROCEDURE greetings
AS
BEGIN 
    dbms_output.put_line('Hello World!'); 
END;
/

EXECUTE greetings;
DROP PROCEDURE greetings;

-- Parameter Modes in PL/SQL Subprograms
-- Execute a  procedure that has been declared inside a PL/SQL block
DECLARE 
    a number; 
    b number; 
    c number;
PROCEDURE findMin(x IN number, y IN  number, z OUT number) IS
BEGIN 
    IF x < y THEN
        z := x;
    ELSE 
        z := y;
    END IF;
END;
BEGIN 
    a := 23;
    b := 45;
    findMin( a, b, z => c);
    dbms_output.put_line(' Minimum of (23,45): ' || c);
END;
/

-- First create the procedure and then call it using a PL/SQL block
CREATE PROCEDURE findMin(x IN number, y IN  number, z OUT number) IS
BEGIN 
    IF x < y THEN
        z := x;
    ELSE 
        z := y;
    END IF;
END;
-- CALL findMin procedure
DECLARE 
    a number; 
    b number; 
    c number;
BEGIN 
    a := 23;
    b := 45;
    findMin(a, b, c);
    dbms_output.put_line(' Minimum of (23,45): ' || c);
END;
/

-- IN & OUT Mode
DECLARE 
    a number;
PROCEDURE squareNum(x IN OUT number) AS
BEGIN
    x := x * x;
END; 
BEGIN 
    a := 23;
    squareNum(a);
    dbms_output.put_line(' Square of (23): ' || a);
END; 
/

-- PL/SQL - Functions
-- Function Declaration
CREATE OR REPLACE FUNCTION totalCustomers
RETURN number IS
    total number(2) :=0;
BEGIN 
    SELECT COUNT(1) INTO total
    FROM customers;
    
    RETURN total;
END; 
/
-- Call the function 
DECLARE 
    c number(2);
BEGIN 
    c := totalCustomers();
    dbms_output.put_line('Total number of Customers: ' || c );
END;
/

DECLARE 
    a number; 
    b number; 
    c number; 
FUNCTION findMax(x IN number, y IN number) 
RETURN number 
IS
    z number; 
BEGIN 
    IF x > y THEN 
        z := x;
    ELSE 
        z := y;
    END IF;
    RETURN z;
END; 
BEGIN 
    a:= 23;
    b:= 45;
    
    c:= findMax(a, b);
    
    dbms_output.put_line(' Maximum of ' || a || ',' || b || ' : ' || c);
END; 
/

-- PL/SQL Recursive Functions
DECLARE 
    num number; 
    factorial number; 

FUNCTION fact(x number) 
RETURN number
IS 
    f number;
BEGIN 
    IF x=0 THEN 
        f := 1;
    ELSE 
        f := x * fact(x -1);
    END IF; 
    RETURN f;
END;

BEGIN 
    num:=6; 
    factorial := fact(num);
    dbms_output.put_line('Factorial ' || num || ' is  ' || factorial);
END; 
/

-- PL/SQL - Cursors
DECLARE 
    total_rows number(2);
BEGIN 
    UPDATE customers
    SET salary = salary + 500;
    IF sql%notfound THEN 
        dbms_output.put_line('no customers selected'); 
    ELSIF sql%found THEN 
        total_rows := sql%rowcount;
        dbms_output.put_line( total_rows || ' customers selected ');
    END IF;
END;
/
-- EXAMPLE CURSOR DECLARING, OPEN, FETCH, CLOSE
DECLARE 
    c_id customers.id%type;
    c_name customers.name%type;
    c_salary customers.salary%type;
    CURSOR c_customers IS 
        SELECT id, name, salary FROM customers;   
BEGIN 
    OPEN c_customers;
    LOOP 
        FETCH c_customers INTO c_id, c_name, c_salary;
        EXIT WHEN c_customers%notfound;
        dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_salary);
    END LOOP;
    CLOSE c_customers;
END;
/
-- SELECT INTO difference
DECLARE 
    c_id customers.id%type;
    c_name customers.name%type;
    c_salary customers.salary%type;        
BEGIN 
    SELECT id, name, salary 
    INTO  c_id, c_name, c_salary
    FROM customers
    WHERE id = 1; 
    dbms_output.put_line(c_id || ' ' || c_name || ' ' || c_salary);
END; 
/

--PL/SQL - Records
DECLARE 
    customer_rec customers%rowtype;
BEGIN 
    SELECT * INTO customer_rec 
    FROM customers
    WHERE id = 5;
    
    dbms_output.put_line('Customer ID: ' || customer_rec.id); 
    dbms_output.put_line('Customer Name: ' || customer_rec.name); 
    dbms_output.put_line('Customer Address: ' || customer_rec.address); 
    dbms_output.put_line('Customer Salary: ' || customer_rec.salary);
END; 
/
-- Cursor-Based Records
DECLARE 
    CURSOR customer_cur IS 
    SELECT id, name, address, salary
    FROM customers;
    
    customer_rec customer_cur%rowtype;
BEGIN 
    OPEN customer_cur;
    LOOP 
        FETCH customer_cur INTO customer_rec;
        EXIT WHEN customer_cur%notfound;
        DBMS_OUTPUT.put_line(customer_rec.id || ' ' || customer_rec.name || ' ' || customer_rec.address || ' ' || customer_rec.salary);    
    END LOOP;
END;
/

-- User-Defined Records
DECLARE 
    TYPE books IS RECORD 
    (title varchar2(50), 
     author varchar2(50), 
     subject varchar2(50), 
     book_id number);
     
     book1 books; 
     book2 books;
BEGIN 
    -- Book 1 specification 
   book1.title  := 'C Programming'; 
   book1.author := 'Nuha Ali ';  
   book1.subject := 'C Programming Tutorial'; 
   book1.book_id := 6495407;  
   -- Book 2 specification 
   book2.title := 'Telecom Billing'; 
   book2.author := 'Zara Ali'; 
   book2.subject := 'Telecom Billing Tutorial'; 
   book2.book_id := 6495700;  
  
  -- Print book 1 record 
   dbms_output.put_line('Book 1 title : '|| book1.title); 
   dbms_output.put_line('Book 1 author : '|| book1.author); 
   dbms_output.put_line('Book 1 subject : '|| book1.subject); 
   dbms_output.put_line('Book 1 book_id : ' || book1.book_id); 
   
   -- Print book 2 record 
   dbms_output.put_line('Book 2 title : '|| book2.title); 
   dbms_output.put_line('Book 2 author : '|| book2.author); 
   dbms_output.put_line('Book 2 subject : '|| book2.subject); 
   dbms_output.put_line('Book 2 book_id : '|| book2.book_id); 
END; 
/

-- Records as Subprogram Parameters
DECLARE 
    TYPE books IS record
    (title varchar2(50), 
     author varchar2(50), 
     subject varchar2(50), 
     book_id number);
   book1 books; 
   book2 books;
PROCEDURE printbook(book books) IS 
BEGIN 
   dbms_output.put_line ('Book  title :  ' || book.title); 
   dbms_output.put_line('Book  author : ' || book.author); 
   dbms_output.put_line( 'Book  subject : ' || book.subject); 
   dbms_output.put_line( 'Book book_id : ' || book.book_id); 
END;
BEGIN 
-- Book 1 specification 
   book1.title  := 'C Programming'; 
   book1.author := 'Nuha Ali ';  
   book1.subject := 'C Programming Tutorial'; 
   book1.book_id := 6495407;  
   -- Book 2 specification 
   book2.title := 'Telecom Billing'; 
   book2.author := 'Zara Ali'; 
   book2.subject := 'Telecom Billing Tutorial'; 
   book2.book_id := 6495700;  
   
    -- Use procedure to print book info 
   printbook(book1); 
   printbook(book2);
END;
/

-- PL/SQL - Exceptions
DECLARE 
    c_id customers.id%type := 8;
    c_name customers.name%type;
    c_addr customers.address%type;
BEGIN 
    SELECT name, address INTO c_name, c_addr
    FROM customers
    WHERE id = c_id;
    DBMS_OUTPUT.PUT_LINE('Name: ' || c_name);
    DBMS_OUTPUT.PUT_LINE('Address: ' || c_addr);
    
    EXCEPTION 
        WHEN no_data_found THEN 
            dbms_output.put_line('No such customer!'); 
        WHEN others THEN 
            dbms_output.put_line('Error!'); 
END; 
/
-- User-defined Exceptions
DECLARE 
    c_id customers.id%type := &cc_id; 
    c_name customerS.Name%type; 
    c_addr customers.address%type;  
    -- user defined exception 
    ex_invalid_id  EXCEPTION;
BEGIN 
    IF c_id <= 0 THEN 
        RAISE ex_invalid_id;
    ELSE 
        SELECT  name, address INTO  c_name, c_addr 
        FROM customers 
        WHERE id = c_id;
        DBMS_OUTPUT.PUT_LINE ('Name: '||  c_name);  
        DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr); 
   END IF;  
   
   EXCEPTION 
    WHEN ex_invalid_id THEN 
        dbms_output.put_line('ID must be greater than zero!');
    WHEN no_data_found THEN 
        dbms_output.put_line('No such customer!');
    WHEN others THEN 
        dbms_output.put_line('Error!');
END; 
/

-- PL/SQL - Triggers
CREATE OR REPLACE TRIGGER display_salary_changes
BEFORE DELETE OR INSERT OR UPDATE ON customers
FOR EACH ROW
WHEN (NEW.ID > 0)
DECLARE 
    sal_diff number; 
BEGIN 
    sal_diff := :NEW.salary - :OLD.salary; 
    sal_diff := :NEW.salary  - :OLD.salary; 
    dbms_output.put_line('Old salary: ' || :OLD.salary); 
    dbms_output.put_line('New salary: ' || :NEW.salary); 
    dbms_output.put_line('Salary difference: ' || sal_diff);
END; 
/

INSERT INTO customers(ID, NAME, AGE, ADDRESS, SALARY)
    VALUES(7, 'Kriti', 22, 'HP', 7500.00);
    
UPDATE customers 
SET salary = salary + 500
WHERE id = 2;

-- PL/SQL - Triggers
CREATE OR REPLACE TRIGGER update_books
AFTER INSERT ON customers
FOR EACH ROW 
WHEN (NEW.ID > 0)
DECLARE 
    customer2_rec customers2%rowtype;
    CURSOR customer2_cursor IS 
    SELECT * FROM customers2;
BEGIN 
--    INSERT INTO customers2(ID, NAME, AGE, ADDRESS, SALARY)
--    VALUES(OLD.ID, OLD.NAME, OLD.AGE, OLD.ADDRESS, OLD.SALARY);
    
    OPEN customer2_cursor;
    LOOP 
        FETCH customer2_cursor INTO customer2_rec;
        EXIT WHEN customer2_cursor%notfound;
        DBMS_OUTPUT.put_line('');
        DBMS_OUTPUT.put_line('Row inserted:');
        DBMS_OUTPUT.put_line(customer2_rec.id || ' ' || customer2_rec.name || ' ' || customer2_rec.address || ' ' || customer2_rec.salary); 
    END LOOP ;   
END;
/

INSERT INTO customers(ID, NAME, AGE, ADDRESS, SALARY)
    VALUES(7, 'Kriti', 22, 'HP', 7500.00);