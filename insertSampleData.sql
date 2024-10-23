Drop table ORDERS;
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_value DECIMAL(10, 2),
    status VARCHAR(50)
);

INSERT INTO Orders (id, customer_id, order_date, order_value, status)
SELECT LEVEL,
       TRUNC(DBMS_RANDOM.VALUE(1000, 5000)),
       TRUNC(SYSDATE - (DBMS_RANDOM.normal * 365 * 3)),
       ROUND(DBMS_RANDOM.VALUE(50, 1000), 2),
       CASE ROUND(DBMS_RANDOM.VALUE(1, 5))
         WHEN 1 THEN 'processing'
         WHEN 2 THEN 'shipped'
         WHEN 3 THEN 'delivered'
         WHEN 4 THEN 'cancelled'
         WHEN 5 THEN 'returned'
       END
  FROM DUAL
  CONNECT BY LEVEL <= 10000;

INSERT INTO Orders (id, customer_id, order_date, order_value, status) VALUES
(10001, 1234, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 250.00, 'shipped');
INSERT INTO Orders (id, customer_id, order_date, order_value, status) VALUES
(10002, 1234, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 150.00, 'delivered');
INSERT INTO Orders (id, customer_id, order_date, order_value, status) VALUES
(10003, 1234, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 300.00, 'processing');
INSERT INTO Orders (id, customer_id, order_date, order_value, status) VALUES
(10004, 5678, TO_DATE('2024-03-15', 'YYYY-MM-DD'), 400.00, 'delivered');
INSERT INTO Orders (id, customer_id, order_date, order_value, status) VALUES
(10005, 1234, TO_DATE('2024-01-10', 'YYYY-MM-DD'), 100.00, 'cancelled');